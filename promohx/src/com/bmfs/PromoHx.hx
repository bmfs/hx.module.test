package com.bmfs;

import com.bmfs.Include;
import com.bmfs.Extern;

import com.bmfs.tech.promotion.PromoEventDispatcher;
import cpp.Char;
import cpp.ConstPointer;
import cpp.Function;
import cpp.Callable;
import cpp.NativeString;
import cpp.RawPointer;


#if !flash
import hxcpp.StaticStd;
import hxcpp.StaticZlib;
import hxcpp.StaticRegexp;
#end



class PromoHx
{

	public static var _eventd:PromoEventDispatcher;
	static var _delegate: cpp.Callable<Void->Void>;
	static var _initialized:Bool = false;

	//@:native('com::bmfs::PromoHx_obj::init')
	public static function init():Void
	{
		_eventd = PromoEventDispatcher.getInstance();
		//_delegate = delegate;

		_initialized = true;
		trace("Promohx initialized");
		return;
	}

	public static function registerForEvent(eventName:ConstPointer<Char>):Int
	{
		trace("Registering event " + NativeString.fromPointer(eventName));

		_eventd.registerForEvent( NativeString.fromPointer(eventName) , _eventd, genericCallback);
		return 0;
	}

	public static function unregisterForEvent(eventName:ConstPointer<Char>):Void
	{
		_eventd.unregisterForEvent( NativeString.fromPointer(eventName), genericCallback);
	}

	public static function unregisterObserverForAllEvents():Void
	{
		_eventd.unregisterObserverForAllEvents(_eventd);
	}

	@:headerCode
	public static function postEvent(eventName:ConstPointer<Char>):Int
	{
		_eventd.postEvent( NativeString.fromPointer(eventName) , null);

		return 0;
	}

	static function testf():Void { trace("called from c++"); }

	public static function genericCallback(event:PromoEvent):Void
	{

		Extern.testfunc( cpp.Function.fromStaticFunction(testf) );
		trace("event (" + event.name+") was called!");
		//_delegate.call();
	}

	static function main():Void
	{

	}

}