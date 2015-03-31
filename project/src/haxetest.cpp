#include <iostream>
#include <stdio.h>

#include "com/bmfs/PromoHx.h"

/*namespace com{
namespace miniclip{
class PromoHx_obj{
	public:
		static int init();
		static int registerForEvent(String eventName, void* callback);
		static void postEvent(std::string eventName);
};
}}*/


extern "C" const char *hxRunLibrary();
extern "C" void hxcpp_set_top_of_stack();


int callmeback()
{
	std::cout << "callback was called" << std::endl;
	return 0;
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
	
	::com::bmfs::PromoHx_obj::init();
	//::com::miniclip::PromoHx_obj::registerForEvent("cenas", &callmeback);
	//::com::miniclip::tech::PromoSystem_obj::update(123213123);

	std::cout <<  "cenas" << std::endl;
	
	#ifdef WIN32 
		system("pause");
	#endif
}