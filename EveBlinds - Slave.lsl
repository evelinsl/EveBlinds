///
/// EveBlinds - SLAVE SCRIPT
/// Made by Evelin ❤
///
/// Check out the Github page for documentation:
/// https://github.com/evelinsl/EveBlinds
/// 

vector movement = <0.0, 0.0, 0.0>;
vector origin = <0.0, 0.0, 0.0>;
integer blindState = 0;


startAnimation()
{
	integer action;
	vector moveTo;

	if(blindState == 1)
		moveTo = origin + movement;
	else
		moveTo = origin;
		
	llSetLinkPrimitiveParamsFast(LINK_THIS, [PRIM_POS_LOCAL, moveTo, PRIM_ROTATION, llGetRootRotation()]);
}


setup(float offset)
{
	origin = llGetLocalPos();
	movement = <0.0, offset, 0.0>;
}


default
{
    state_entry()
    {

    }
    
    
	link_message(integer sender_num, integer num, string msg, key id)
	{
		if(msg == "move")
		{
			blindState = num;
			startAnimation();
			
		} else
		{
			setup((float)msg);
		}
	}
}
