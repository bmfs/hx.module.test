#ifndef Extern_H
#define Extern_H

#include <hxcpp.h>

namespace com {
	namespace bmfs{
		class Extern_obj{
			public:
				static void testfunc(::cpp::Function < Void()> fn)
				{
					fn();
				}
		};
	}
};

#endif