package com.bmfs.tech.promotion;

import haxe.ds.StringMap;
import msignal.Signal.Signal1;

/**
 * ...
 * @author Bruno Santos
 */

typedef EventInfo = {
	var name: String;
	var caller: Dynamic;
	var callback: EventCallback;
	var observer:Signal1<Dynamic>;
}

typedef PromoEvent = {
	var name:String;
	var data:Dynamic;
}

typedef EventMap = StringMap<Signal1<Dynamic>>;
typedef EventCallback = PromoEvent->Void;

class PromoEventDispatcher
{
	static var _instance:PromoEventDispatcher;
	
	var observersList:EventMap;
	var eventsList:List<EventInfo>;
	var parentsList:Map<Dynamic, Array<EventCallback>>;

	function new() 
	{
		observersList = new EventMap();
		eventsList = new List<EventInfo>();
	}
	
	public static function getInstance():PromoEventDispatcher
	{
		if (_instance == null) {
			_instance = new PromoEventDispatcher();
		}
		return _instance;
	}
	
	public function registerForEvent(eventName:String, caller:Dynamic, callb:EventCallback):Void
	{
		//for (eventName in events)
		//{	
			var observer:Signal1<Dynamic>;

			if (observersList.exists(eventName))
			{
				observer = observersList.get(eventName);
			} else {
				observer = new Signal1();
				observersList.set(eventName, observer);
			}

			eventsList.push({ name: eventName, caller: caller, callback: callb, observer:observer});

			observer.add(callb);
		//}
	}
	
	public function unregisterForEvent(eventName:String, callb:EventCallback):Void
	{
		if (observersList.exists(eventName))
		{
			var observer:Signal1<Dynamic> = observersList.get(eventName);
			observer.remove(callb);
			
		}
	}

	public function unregisterObserverForAllEvents(caller:Dynamic):Void
	{
		for (event in eventsList)
		{
			if (event.caller == caller)
			{
				if (observersList.exists(event.name)){
					var signal:Signal1<Dynamic> = observersList.get(event.name);
					signal.remove(event.callback);
				}

				eventsList.remove(event);
			}
		}
	}
	
	public function postEvent(eventName:String, data:Dynamic):Void
	{
		if (observersList.exists(eventName)) {
			var observer = observersList.get(eventName);
			var event:PromoEvent = { name: eventName, data: data };
			observer.dispatch(event);
		}
	}
	
}