package com.bmfs;

import com.bmfs.tech.promotion.PromoEventDispatcher;
import cpp.Char;
import cpp.ConstPointer;
import cpp.NativeString;

#if !flash
import hxcpp.StaticStd;
import hxcpp.StaticZlib;
import hxcpp.StaticRegexp;

#end

/**
 * ...
 * @author Bruno Santos
 */

@:headerCode
class PromoHx
{
	public static var _eventd:PromoEventDispatcher;
	
	@:headerCode
	public static function init():Int
	{
		_eventd = PromoEventDispatcher.getInstance();
		
		trace("Promohx initialized");
		return 0;
	}
	
	@:headerCode
	public static function registerForEvent(eventName:ConstPointer<Char>):Int
	{
		trace("Registering event " + NativeString.fromPointer(eventName));
		
		_eventd.registerForEvent( NativeString.fromPointer(eventName) , _eventd, genericCallback);
		return 0;
	}
	
	@:headerCode
	public static function unregisterForEvent(eventName:ConstPointer<Char>):Void
	{
		_eventd.unregisterForEvent( NativeString.fromPointer(eventName), genericCallback);
	}
	
	@:headerCode
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
	
	public static function genericCallback(event:PromoEvent):Void
	{
		trace("event (" + event.name+") was called!");
	}
	
	static function main():Void
	{
		
	}
	
}