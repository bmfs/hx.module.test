package com.bmfs;

import com.bmfs.tech.promotion.PromoEventDispatcher;

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
	public static function registerForEvent(eventName:String):Int
	{
		trace("Registering event");
		_eventd.registerForEvent(eventName, _eventd, genericCallback);
		return 0;
	}
	
	@:headerCode
	public static function unregisterForEvent(eventName:String):Void
	{
		_eventd.unregisterForEvent(eventName, genericCallback);
	}
	
	@:headerCode
	public static function unregisterObserverForAllEvents():Void
	{
		_eventd.unregisterObserverForAllEvents(_eventd);
	}
	
	@:headerCode
	public static function postEvent(eventName:String):Void
	{
		_eventd.postEvent(eventName, null);
	}
	
	public static function genericCallback(event:PromoEvent):Void
	{
		trace("event (" + event.name+") was called!");
	}
	
	static function main():Void
	{
		
	}
	
}