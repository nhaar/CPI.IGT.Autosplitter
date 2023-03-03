state("ClubPenguinIsland")
{
    int load : "mono.dll", 0x001F56AC, 0x80, 0xFA0;
	int splitVar : "mono.dll", 0x0020913C, 0x23C, 0x9C, 0x0, 0x8C, 0x158, 0x28;
	int startVar: "mono.dll", 0x001F56AC, 0x80, 0xFA4;
}

startup
{
    refreshRate = 60;
}

init
{
	vars.splitref = current.splitVar;
	vars.startref = current.startVar;
	vars.starttime = false;
}

update
{
	print(vars.starttime.ToString());
}

start
{
	if(vars.startref != current.startVar)
	{
		vars.starttime = true;
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
	if(vars.splitref != current.splitVar)
	{
		vars.splitref = current.splitVar;
		return true;
	}
	else
	{
		return false;
	}
}

isLoading
{
	return current.load == 6969;
}
