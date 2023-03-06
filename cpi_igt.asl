state("ClubPenguinIsland")
{
    int load : "UnityPlayer.dll", 0x00FDB24C, 0x4, 0x28, 0xA8, 0x4, 0xFC, 0x64, 0x2C;
	int splitVar :"mono.dll", 0x001F50AC, 0x14, 0x60, 0xD0, 0x274, 0x4, 0x64, 0x28;
	int startVar: "mono.dll", 0x001F50AC, 0x14, 0x60, 0xD0, 0x274, 0x4, 0x48, 0x1C;
}

startup
{
    refreshRate = 160;
}

init
{
	vars.startref = current.startVar;
	vars.starttime = false;
}

start
{
	if(vars.startref != current.startVar)
	{
		vars.starttime = current.startVar != 999;
		vars.startref = current.startVar;
	}
	if (vars.starttime == true && current.load == 420420)
	{
		vars.starttime = false;
		return true;
	}
	else
	{
		return false;
	}
}

split
{
	return old.splitVar != current.splitVar && current.splitVar != 111;
}

isLoading
{
	return current.load == 6969;
}
