package com.bmfs;

@:include("Extern.h")
extern class Extern
{
	static function testfunc( fn : cpp.Callable<Void->Void> ):Void;
}