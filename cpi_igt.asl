state("ClubPenguinIsland")
{
	int load : "mono.dll", 0x001F76E0, 0x0, 0xA8, 0x4, 0x8C, 0x1D4, 0x28;
	int splitVar : "mono.dll", 0x001F50AC, 0x14, 0x60, 0xD0, 0x274, 0x4, 0x64, 0x28;
}

startup
{
	refreshRate = 200;
}

isLoading
{
 	return current.load == 6969;
}

split
{
	return old.splitVar != current.splitVar;
}
