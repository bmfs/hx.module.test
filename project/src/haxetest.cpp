#include <iostream>


namespace cpp
{
	template<typename T>
	class Pointer
	{
	public:
		T *ptr;
		inline Pointer(const T *inValue) : ptr((T*)inValue) { }
	};

	class Char
	{

	};
}


namespace com{
	namespace bmfs{
		class PromoHx_obj{
		public:
			static int init();
			static int registerForEvent(::cpp::Pointer<char> eventName);
			static int postEvent(::cpp::Pointer<char>  eventName);
		};
	}
}

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