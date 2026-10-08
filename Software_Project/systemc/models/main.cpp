#include <systemc>
#include "shino/device_protocol.h"
#include "shino/register_bank.h"
#include <cstdint>
#include <cstring>
#include <iostream>
#include <vector>

namespace {
void complete(shino::RegisterSlot& s,std::uint32_t v){s.value=v;__atomic_store_n(&s.response,1u,__ATOMIC_RELEASE);__atomic_store_n(&s.request,0u,__ATOMIC_RELEASE);}
struct DeviceModels:sc_core::sc_module{
 shino::RegisterBank cdma{shino::kCdmaRegisters,shino::kCdmaSize},conv{shino::kConvRegisters,shino::kConvSize};
 shino::SharedBytes cdma_mem{shino::kCdmaMemory,shino::kCdmaMemorySize},conv_mem{shino::kConvMemory,shino::kConvMemorySize};
 std::vector<std::uint8_t> cdma_shadow;std::vector<std::int32_t> conv_shadow;std::uint32_t cdma_dst=0,selected=0,width=10,height=10;bool cdma_pending=false,conv_pending=false;
 SC_HAS_PROCESS(DeviceModels);DeviceModels(sc_core::sc_module_name n):sc_module(n){cdma.slot(shino::kCdmaStatus).value=shino::kCdmaIdle;SC_THREAD(run);}
 void run(){for(;;){bool handled=false;
  for(std::size_t i=0;i<cdma.slots();++i){auto&s=cdma.slot(i*4);if(!__atomic_load_n(&s.request,__ATOMIC_ACQUIRE))continue;handled=true;auto off=(std::uint32_t)i*4;if(s.operation==0){complete(s,s.value);continue;}if(off==shino::kCdmaLength){auto src=cdma.slot(shino::kCdmaSource).value-shino::kCdmaMemoryBase;cdma_dst=cdma.slot(shino::kCdmaDestination).value-shino::kCdmaMemoryBase;if(src+s.value<=shino::kCdmaMemorySize&&cdma_dst+s.value<=shino::kCdmaMemorySize){cdma_shadow.assign(cdma_mem.data()+src,cdma_mem.data()+src+s.value);cdma_pending=true;cdma.slot(shino::kCdmaStatus).value=0;}else cdma.slot(shino::kCdmaStatus).value=shino::kCdmaError;}else if(off==shino::kCdmaCommit&&cdma_pending){std::memcpy(cdma_mem.data()+cdma_dst,cdma_shadow.data(),cdma_shadow.size());cdma_pending=false;cdma.slot(shino::kCdmaStatus).value=shino::kCdmaIdle;}complete(s,s.value);}
  for(std::size_t i=0;i<conv.slots();++i){auto&s=conv.slot(i*4);if(!__atomic_load_n(&s.request,__ATOMIC_ACQUIRE))continue;handled=true;auto off=(std::uint32_t)i*4;if(s.operation==0){complete(s,s.value);continue;}if(off==shino::kConvIndex)selected=s.value;else if(off==shino::kConvData){if(selected==1)width=s.value;else if(selected==2)height=s.value;else if(selected==4&&s.value){auto*k=(std::int32_t*)(conv_mem.data()+shino::kConvKernel);auto*image=(std::int32_t*)(conv_mem.data()+shino::kConvImage);auto ow=width-2,oh=height-2;conv_shadow.assign(ow*oh,0);for(std::uint32_t y=0;y<oh;++y)for(std::uint32_t x=0;x<ow;++x)for(std::uint32_t ky=0;ky<3;++ky)for(std::uint32_t kx=0;kx<3;++kx)conv_shadow[y*ow+x]+=image[(y+ky)*width+x+kx]*k[ky*3+kx];conv_pending=true;conv.slot(shino::kConvStatus).value=0;}else if(selected==7&&s.value==0)conv.slot(shino::kConvStatus).value=0;}else if(off==shino::kConvCommit&&conv_pending){std::memcpy(conv_mem.data()+shino::kConvResult,conv_shadow.data(),conv_shadow.size()*4);conv_pending=false;conv.slot(shino::kConvStatus).value=shino::kConvComputeDone|shino::kConvResultDone;}complete(s,s.value);}
  wait(handled?sc_core::SC_ZERO_TIME:sc_core::sc_time(20,sc_core::SC_US));}}
};}
int sc_main(int,char**){DeviceModels models("devices");std::cerr<<"SHINO_SYSTEMC_MODEL_READY version="<<sc_core::sc_version()<<"\n";sc_core::sc_start();return 0;}
