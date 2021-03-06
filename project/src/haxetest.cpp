#include <iostream>

#define HXCPP_VISIT_ALLOCS
#define HXCPP_DEBUG
#define HX_WINDOWS
#define _USING_V120_SDK71_
#define HXCPP_API_LEVEL 321

#include <Extern.h>
#include <hxcpp.h>
#include <com/bmfs/PromoHx.h>


extern "C" const char *hxRunLibrary();
extern "C" void hxcpp_set_top_of_stack();



void callmeback()
{
	std::cout << "callback was called" << std::endl;
	return;
}


int main()
{
	std::cout << "cpp main()" << std::endl;
	
	hxcpp_set_top_of_stack();
	
	const char *err = hxRunLibrary();
	if (err) {
		fprintf(stderr, "Error %s\n", err);
		return -1;
	}
	
	std::cout << "init promoHX" << std::endl;
	::com::bmfs::PromoHx_obj::init();
	std::cout << "register event" << std::endl;
	::com::bmfs::PromoHx_obj::registerForEvent("cenas");

	std::cout << "post event blah" << std::endl;
	::com::bmfs::PromoHx_obj::postEvent("blah");

	std::cout << "post event cenas" << std::endl;
	::com::bmfs::PromoHx_obj::postEvent("cenas");

	std::cout <<  "-end-" << std::endl;
	
	#ifdef WIN32 
		system("pause");
	#endif
}