/**
 * It should be a single instance, that is there is only one ScheduleRunner in every model.
 * But how to impement this?
 */
public class ScheduleRunner {
	/**
	 * @ parameter: go-----------------Decide whether to continue for this simulating.
	 * 
	 * @ parameter: schedule-----------????
	 * 
	 * @ parameter: globalNextTick-----The global tick for next.
	 * @ parameter: localNextTick------The local tick for next.
	 * @ parameter: endEvent-----------The end event for schedule.
	 */
	private var go: boolean;
	//private var schedule: Schedule;
	private var globalNextTick: double, localNextTick: double;
	private var stopTick: double;
	private var endEvents: Functor;
	static val plh=PlaceLocalHandle.make[Cell[Schedule]](Place.places(),()=>new Cell[Schedule](new Schedule()));
	
	//private static val SR: ScheduleRunner = null;
	
	public def this(){
		go = true;
		globalNextTick = 0.0;
		localNextTick = 0.0;
		stopTick = -1.0 as double;
		
		//schedule = new Schedule();              //this need parrall
		
		endEvents = null;
	}
	
	/**
	 * Construct with parameter of endEvents.
	 * Pass the event(functor) which is the end event to be scheduled.
	 */
	public def this(endEvents: Functor){
		go = true;
		globalNextTick = 0.0;
		localNextTick = 0.0;
		stopTick = -1.0 as double;
		//schedule = new Schedule();
		this.endEvents = endEvents;
	}
	
	/**
	 * This is right or wrong to implement single instance.
	 * Not USE!
	 */
	public static def getInstance():ScheduleRunner{
		return new ScheduleRunner();
	}
	
	/**
	 * Schedule the OneTimeEvent which will invoke the schedule's schedule_event.
	 * In fact, it is push the event into queue of schedule firstly.
	 * 
	 */
	public def scheduleEvent(start:double, fun:Functor):void{
		for(p in Place.places())
	{
	
	  at(p) 
	  {
		//var event: ScheduledEvent = plh()().schedule_event(start, fun);
		plh()().schedule_event(start, fun);
		//nextTick();
		}
		}
		//return event;
	}
	
	
	/**
	 * Schedule the RepeatingEvent which will invoke the schedule's schedule_event.
	 * In fact, it is push the event into queue of schedule firstly.
	 * 
	 */
	public def scheduleEvent(start:double, interval:double, fun:Functor):void{
		
		
		for(p in Place.places())
		{
			
			at(p) 
			{
				//var event: ScheduledEvent = plh()().schedule_event(start, fun);
				plh()().schedule_event(start, interval, fun);
				//Console.OUT.println("Assignment State (ScheduleRunner) at Place "+here.id);
				//nextTick();
			}
		}
		
	}
	/**
	 * OneTimeEvent, but this will end the simulation.
	 */
	public def scheduleStopEvent(start:double, fun:Functor):void{
	
		
		for(p in Place.places())
		{
			
			at(p) 
			{
				//var event: ScheduledEvent = plh()().schedule_event(start, fun);
				//plh()().schedule_event(start, fun);
				plh()().schedule_Endevent(start, fun);
				//nextTick();
			}
		}
	}
	
	/**
	 * Schedule the end event.
	 * Which object's fun ?
	 */
	public def scheduleEndEvent(start:double, fun: Functor):void{
		/**
		 * endEvents.push(fun);
		 */
	}
	
	/**
	 * This is wrong, because there maybe no such tick in schedule.
	 * So that, the simulation can't stop as expected!
	 * 
	 * The correct method is wrapped this as a StopEvent, and push it in the schedule.
	 */
	public def scheduleStop(stopAt:double):void{
		stopTick = stopAt;
	}
	
	
	
	/**
	 * Test run
	 * Right!!
	 */
	public def run():void{
		/*if(schedule.getNextTick() != -1.0){
			while(go){
				schedule.execute();
				nextTick();
				
				if(localNextTick == -1.0){
					go = false;
				}
			}
		}
		return;*/
		finish for(p in Place.places())
		{
			
			async at(p) 
			{
				//Console.OUT.println("first"+"here.id="+here.id+"-----CureentTick="+localNextTick);
				if(plh()().getNextTick() != -1.0){
					  while(go){
						  //Console.OUT.println("second"+"here.id="+here.id+"-----localCureentTick="+plh()().getCurrentTick());
						  plh()().execute();
						 // Console.OUT.println("third"+"here.id="+here.id+"-----localCureentTick="+plh()().getCurrentTick());
						    nextTick();
						    // Console.OUT.println("forth"+"here.id="+here.id+"-----localNextTick="+localNextTick);
						      if(localNextTick == -1.0){
						    	   go = false;
						    	   
						    		  // Console.OUT.println("the current localNextTick == -1.0");
						    	   
						    	   
						      }
					  }
			}
		}
	}
	}
	
/*	public def getCurrentTick():double{
		return schedule.getCurrentTick();
	}*/
	
	/**
	 * Stop the simulating.
	 */
	public def stop():void{
		go = false;
		
		//Console.OUT.println("�˿̵�go��Ϊ��false");
		
	}
	
	/*public def getSchedule():Schedule{
		return schedule;
	}*/
	
	/**
	 * Get the next tick to be schedule at.
	 */
	public def nextTick():void{
		localNextTick = plh()().getNextTick();
	}
	public def judgego():boolean
	{
	   return go;
	   
	      
	}
}