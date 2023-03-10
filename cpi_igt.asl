state("ClubPenguinIsland")
{
    int load : "mono.dll", 0x001F50AC, 0xE4, 0x3C, 0x0, 0x8, 0x54, 0x7F8, 0x2C;
    int splitVar :"mono.dll", 0x001F50AC, 0x49C, 0x8, 0x18, 0x1C, 0x0, 0xC, 0x34;
    int startVar: "mono.dll", 0x001F7730, 0x0, 0x4, 0xA8, 0x4, 0x8C, 0x1D4, 0x2C;
}

startup
{
    // Adjust to your own (I put high because CPI adjusts to monitor refresh rate)
    refreshRate = 160;
}

init
{
    // Variables to keep track of when time starts
    vars.startref = current.startVar;
    vars.starttime = false;
}

start
{

    // If startVar changes, get ready to start
    if(vars.startref != current.startVar)
    {
        vars.starttime = current.startVar != 999;
        vars.startref = current.startVar;
    }
    
    // Start when ready to start, when not in a load screen and startVar is a valid variable
    if (vars.starttime == true && current.load == 420420 && (current.startVar == 888 || current.startVar == 777))
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
    // Split when splitVar changes and splitVar is a valid variable
    return old.splitVar != current.splitVar && (current.splitVar == 222 || current.splitVar == 333);
}

isLoading
{
    return current.load == 6969;
}
