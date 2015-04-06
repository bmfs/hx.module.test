cmake_minimum_required (VERSION 2.6)
project (PromoHxTest)
set(sources src/haxetest.cpp include/Extern.h
)

add_library(libPromoHx STATIC IMPORTED)
set_property(TARGET libPromoHx PROPERTY
					IMPORTED_LOCATION D:/Projects/Code/hx.module.test_github/promohx/out/libPromoHx-debug.lib)



include_directories("include" "D:/Projects/Code/hx.module.test_github/promohx/out/include/" "D:/HaxeToolkit/haxe/lib/hxcpp/3,2,37/include")

add_executable(${CMAKE_PROJECT_NAME} ${sources})

target_link_libraries(${CMAKE_PROJECT_NAME} libPromoHx)

if(WIN32)
set_target_properties(${CMAKE_PROJECT_NAME} PROPERTIES LINK_FLAGS_DEBUG "/SUBSYSTEM:CONSOLE")
set_target_properties(${CMAKE_PROJECT_NAME} PROPERTIES COMPILE_DEFINITIONS_DEBUG "_CONSOLE")
set_target_properties(${CMAKE_PROJECT_NAME} PROPERTIES LINK_FLAGS_RELWITHDEBINFO "/SUBSYSTEM:CONSOLE")
set_target_properties(${CMAKE_PROJECT_NAME} PROPERTIES COMPILE_DEFINITIONS_RELWITHDEBINFO "_CONSOLE")
set_target_properties(${CMAKE_PROJECT_NAME} PROPERTIES LINK_FLAGS_RELEASE "/SUBSYSTEM:windows")
set_target_properties(${CMAKE_PROJECT_NAME} PROPERTIES LINK_FLAGS_MINSIZEREL "/SUBSYSTEM:windows")
endif(WIN32)

if (MSVC)
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /MTd")
endif()