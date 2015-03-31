## Requirements
I started following this guide: http://www.wighawag.com/blog/2014/12/Hxcpp-extern

And compiled hxcpp by doing:

```
D:\HaxeToolkit\haxe\lib\hxcpp\3,2,37\project
neko build.n -debug -DABI=-MTd
```

## Build
Steps to build:
	
```
cd promohx
haxe build.hxml
```

This will generate the static lib of the haxe module in promohx/out/cpp/module/libPromoHx-debug.lib

### CPP Side

We can either use cmake to generate a Visual Studio project.

Update the Hxcpp lib path in `project/CMakeLists.txt` and then run:
```
cd project/build
cmake ..
```

or we can call the compiler directly.
Update the Hxcpp lib path in `project/runTest.bat` and then run

```
cd project
runTest.bat
```




## Current Errors
```
Error	6	error LNK2001: unresolved external symbol "public: virtual class Dynamic __thiscall hx::Object::__Field(class String const &,bool)" (?__Field@Object@hx@@UAE?AVDynamic@@ABVString@@_N@Z)	D:\Projects\Code\hx.module.test\project\build\haxetest.obj	PromoHxTest
Error	7	error LNK2001: unresolved external symbol "public: virtual class Dynamic __thiscall hx::Object::__SetField(class String const &,class Dynamic const &,bool)" (?__SetField@Object@hx@@UAE?AVDynamic@@ABVString@@ABV3@_N@Z)	D:\Projects\Code\hx.module.test\project\build\haxetest.obj	PromoHxTest
Error	8	error LNK2001: unresolved external symbol "public: virtual class Dynamic __thiscall hx::Anon_obj::__Field(class String const &,bool)" (?__Field@Anon_obj@hx@@UAE?AVDynamic@@ABVString@@_N@Z)	D:\Projects\Code\hx.module.test\project\build\haxetest.obj	PromoHxTest
Error	9	error LNK2001: unresolved external symbol "public: virtual class Dynamic __thiscall hx::Anon_obj::__SetField(class String const &,class Dynamic const &,bool)" (?__SetField@Anon_obj@hx@@UAE?AVDynamic@@ABVString@@ABV3@_N@Z)	D:\Projects\Code\hx.module.test\project\build\haxetest.obj	PromoHxTest
Error	10	error LNK2001: unresolved external symbol "public: virtual class Dynamic __thiscall cpp::IteratorBase::__Field(class String const &,bool)" (?__Field@IteratorBase@cpp@@UAE?AVDynamic@@ABVString@@_N@Z)	D:\Projects\Code\hx.module.test\project\build\haxetest.obj	PromoHxTest
Error	11	error LNK2001: unresolved external symbol "public: virtual class Dynamic __thiscall hx::ArrayBase::__Field(class String const &,bool)" (?__Field@ArrayBase@hx@@UAE?AVDynamic@@ABVString@@_N@Z)	D:\Projects\Code\hx.module.test\project\build\haxetest.obj	PromoHxTest
Error	12	error LNK2001: unresolved external symbol "public: virtual class Dynamic __thiscall hx::Class_obj::__Field(class String const &,bool)" (?__Field@Class_obj@hx@@UAE?AVDynamic@@ABVString@@_N@Z)	D:\Projects\Code\hx.module.test\project\build\haxetest.obj	PromoHxTest
Error	13	error LNK2001: unresolved external symbol "public: virtual class Dynamic __thiscall hx::Class_obj::__SetField(class String const &,class Dynamic const &,bool)" (?__SetField@Class_obj@hx@@UAE?AVDynamic@@ABVString@@ABV3@_N@Z)	D:\Projects\Code\hx.module.test\project\build\haxetest.obj	PromoHxTest
Error	14	error LNK2001: unresolved external symbol "public: virtual class Dynamic __thiscall hx::EnumBase_obj::__Field(class String const &,bool)" (?__Field@EnumBase_obj@hx@@UAE?AVDynamic@@ABVString@@_N@Z)	D:\Projects\Code\hx.module.test\project\build\haxetest.obj	PromoHxTest
Error	15	error LNK2001: unresolved external symbol "public: virtual class Dynamic __thiscall hx::Interface::__Field(class String const &,bool)" (?__Field@Interface@hx@@UAE?AVDynamic@@ABVString@@_N@Z)	D:\Projects\Code\hx.module.test\project\build\haxetest.obj	PromoHxTest
Error	16	error LNK2001: unresolved external symbol "public: virtual class Dynamic __thiscall hx::Interface::__SetField(class String const &,class Dynamic const &,bool)" (?__SetField@Interface@hx@@UAE?AVDynamic@@ABVString@@ABV3@_N@Z)	D:\Projects\Code\hx.module.test\project\build\haxetest.obj	PromoHxTest
Error	17	error LNK1120: 11 unresolved externals	D:\Projects\Code\hx.module.test\project\build\Debug\PromoHxTest.exe	PromoHxTest
```