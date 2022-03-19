//#pragma dynamic 32768    // Increase heap size
#pragma semicolon 1

public Plugin myinfo = {
    name        = "[INS] Bot Version of Yells Grenade",
    author        = "",
    description    = "Bot yells at nearby Grenades",
    version        = "1.0",
    url            = "https://github.com/Bruno-Bacelar/br1.server/tree/main/scripting"
};

#include <sourcemod>
#include <sdktools>
#include <sdkhooks>
#include <insurgencydy>
#include <smlib>
#include <callouts>

#define INVALID_USERID 0

// Status

    float g_plyrGrenScreamCoolDown[MAXPLAYERS+1];


public OnMapStart()
{

    //BOT Grenade Call Outs

    PrecacheSound("player/voice/bot/leader/incominggrenade11.ogg");
    PrecacheSound("player/voice/bot/leader/incominggrenade12.ogg");
    PrecacheSound("player/voice/bot/leader/incominggrenade13.ogg");
    PrecacheSound("player/voice/bot/leader/incominggrenade17.ogg");
    PrecacheSound("player/voice/bot/subordinate/incominggrenade1.ogg");
    PrecacheSound("player/voice/bot/subordinate/incominggrenade11.ogg");
    PrecacheSound("player/voice/bot/subordinate/incominggrenade13.ogg");    
    PrecacheSound("player/voice/bot/leader/incominggrenade22.ogg");
    PrecacheSound("player/voice/bot/leader/incominggrenade23.ogg");
    PrecacheSound("player/voice/bot/leader/incominggrenade3.ogg");
    PrecacheSound("player/voice/bot/leader/incominggrenade6.ogg");
    PrecacheSound("player/voice/bot/leader/incominggrenade7.ogg");
    PrecacheSound("player/voice/bot/leader/incominggrenade9.ogg");
    PrecacheSound("player/voice/bot/subordinate/incominggrenade15.ogg");
    PrecacheSound("player/voice/bot/subordinate/incominggrenade16.ogg");
    PrecacheSound("player/voice/bot/subordinate/incominggrenade19.ogg");
    PrecacheSound("player/voice/bot/subordinate/incominggrenade2.ogg");
    PrecacheSound("player/voice/bot/subordinate/incominggrenade3.ogg");
    PrecacheSound("player/voice/bot/subordinate/incominggrenade5.ogg");
    PrecacheSound("player/voice/bot/leader/incominggrenade26.ogg");
    PrecacheSound("player/voice/bot/leader/incominggrenade11.ogg");  

	//BOT Fire Call Outs
	
    PrecacheSound("player/voice/responses/insurgent/leader/damage/molotov_incendiary_detonated5.ogg");
    PrecacheSound("player/voice/responses/insurgent/subordinate/damage/molotov_incendiary_detonated3.ogg");
    PrecacheSound("player/voice/responses/insurgent/leader/damage/molotov_incendiary_detonated6.ogg");
    PrecacheSound("player/voice/responses/insurgent/subordinate/damage/molotov_incendiary_detonated4.ogg");
    PrecacheSound("player/voice/responses/insurgent/leader/damage/molotov_incendiary_detonated7.ogg");

}

public void OnClientDisconnect(int client)
{
	
    g_plyrGrenScreamCoolDown[client] = 0.0;
    g_plyrFireScreamCoolDown[client] = 0.0;
	
}

public OnEntityCreated(entity, const String:classname[])
{

    if (StrEqual(classname, "grenade_m67") || StrEqual(classname, "grenade_ex_impact") || StrEqual(classname, "grenade_f1"))
        {
        CreateTimer(0.5, GrenadeScreamCheckTimer, entity, TIMER_REPEAT|TIMER_FLAG_NO_MAPCHANGE);
        }
    else if (StrEqual(classname, "grenade_molotov") || StrEqual(classname, "grenade_anm14"))
        {
        CreateTimer(0.5, FireScreamCheckTimer, entity, TIMER_REPEAT|TIMER_FLAG_NO_MAPCHANGE);
        }
}

public Action:GrenadeScreamCheckTimer(Handle:timer, any:entity)
{
    new Float:fGrenOrigin[3];
    new Float:fPlayerOrigin[3];
    new Float:fPlayerEyeOrigin[3];
    new owner;
    if (IsValidEntity(entity) && entity > 0)
    {
        GetEntPropVector(entity, Prop_Send, "m_vecOrigin", fGrenOrigin);
        owner = GetEntPropEnt(entity, Prop_Send, "m_hOwnerEntity");
    }
    else
        KillTimer(timer);

    for (new client = 1;client <= MaxClients;client++)
    {
        if (!IsClientInGame(client))
            continue;

        if (!IsFakeClient(client))
            continue;

        if (IsPlayerAlive(client) && GetClientTeam(client) == 3 && IsClientInGame(owner) && GetClientTeam(owner) == 2) // 1 <= owner <= MaxClients &&
        {

            GetClientEyePosition(client, fPlayerEyeOrigin);
            GetClientAbsOrigin(client,fPlayerOrigin);
            

            if (g_plyrGrenScreamCoolDown[client] != 0.0 && GetGameTime() - g_plyrGrenScreamCoolDown[client] < 6.0) // 6 seconds cooldown
                continue;

            if (GetVectorDistance(fPlayerOrigin, fGrenOrigin) <= 220)
            {
                BotGrenadeScreamRand(client);
                g_plyrGrenScreamCoolDown[client] = GetGameTime();

            }
        }
    }

    if (!IsValidEntity(entity) || !(entity > 0))
        KillTimer(timer);
}

public Action:FireScreamCheckTimer(Handle:timer, any:entity)
{
    new Float:fGrenOrigin[3];
    new Float:fPlayerOrigin[3];
    new Float:fPlayerEyeOrigin[3];
    new owner;
    if (IsValidEntity(entity) && entity > 0)
    {
        GetEntPropVector(entity, Prop_Send, "m_vecOrigin", fGrenOrigin);
        owner = GetEntPropEnt(entity, Prop_Send, "m_hOwnerEntity");
    }
    else
        KillTimer(timer);

    for (new client = 1;client <= MaxClients;client++)
    {
        if (!IsClientInGame(client))
            continue;

        if (!IsFakeClient(client))
            continue;

        if (IsPlayerAlive(client) && GetClientTeam(client) == 3 && IsClientInGame(owner) && GetClientTeam(owner) == 2) // 1 <= owner <= MaxClients &&
        {

            GetClientEyePosition(client, fPlayerEyeOrigin);
            GetClientAbsOrigin(client,fPlayerOrigin);
            

            if (g_plyrFireScreamCoolDown[client] != 0.0 && GetGameTime() - g_plyrFireScreamCoolDown[client] < 16.0) // 16 seconds cooldown
                continue;

            if (GetVectorDistance(fPlayerOrigin, fGrenOrigin) <= 150)
            {
                BotFireScreamRand(client);
                g_plyrFireScreamCoolDown[client] = GetGameTime();

            }
        }
    }

    if (!IsValidEntity(entity) || !(entity > 0))
        KillTimer(timer);
}
