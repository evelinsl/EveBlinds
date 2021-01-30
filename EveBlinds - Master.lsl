///
/// EveBlinds - MASTER SCRIPT
/// Made by Evelin ❤
///
/// Check out the Github page for documentation:
/// https://github.com/evelinsl/EveBlinds
/// 

float blindOffsetWhenOpened = 0.8;

/// Do not edit anything beyond this point.
/// Or do so, but at your own risk :]

integer duration = 1;
integer working = 0;
integer blindState = 0; // 1 = opening, 0 = closing


performSetup()
{
	working = 1;
	
	llSay(0, "Performing setup...");
	
	// Set up each slave prim to the intial state 
	
	integer index;
	integer prims = llGetObjectPrimCount(llGetKey());
	 
	for(index = 2; index <= prims; index++)
	{
		// Set the base position of each blind relative to the root prim

		llSetLinkPrimitiveParamsFast(index, [PRIM_POSITION, <0.04 * (index - 1), 0.08 * (index - 1), 0.0>]); 
		
		// Then give them each there relative offset
		
		float offset = blindOffsetWhenOpened * (index - 1);
		llMessageLinked(index, 1, (string)offset, ""); 
	}
	
	llSleep(1);
	
	llSay(0, "Setup done!");
	
	working = 0;
}


startAnimation()
{
	blindState = !blindState;
	working = 1;
	 
	// Send all the slaves a message to move in a certain direction
	
	llMessageLinked(LINK_ALL_CHILDREN, blindState, "move", ""); 
	
	llSetTimerEvent(duration);
}


endAnimation()
{
	llSetTimerEvent(0.0);
	working = 0;
}


default
{
	state_entry()
	{ 
		performSetup();
	}
	
	
	on_rez(integer start_param)
	{
		llResetScript();
	}
	
	
	timer()
	{
		endAnimation();
	}
	

	touch_start(integer total_number)
	{
		if(working)
		{
			llSay(0, "I am still doing something, Gosssh wait a second!");
			return;
		}
		
		startAnimation();
	}
}
