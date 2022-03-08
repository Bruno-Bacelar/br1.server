//#pragma dynamic 32768    // Increase heap size
#pragma semicolon 1

public Plugin myinfo = {
    name        = "[INS] Yells Grenade",
    author        = "",
    description    = "Yells at nearby Grenades,Molotov and Gas",
    version        = "3.1",
    url            = "https://github.com/Bruno-Bacelar/br1.server/tree/main/scripting"
};

#include <sourcemod>
#include <sdktools>
#include <sdkhooks>
#include <insurgencydy>
#include <smlib>

#define INVALID_USERID 0

// Status

    float g_plyrGrenScreamCoolDown[MAXPLAYERS+1];
    float g_plyrFireScreamCoolDown[MAXPLAYERS+1];
    float g_plyrGasScreamCoolDown[MAXPLAYERS+1];


public OnMapStart()
{

    //Grenade Call Out
    PrecacheSound("player/voice/botsurvival/leader/incominggrenade9.ogg");
    PrecacheSound("player/voice/botsurvival/subordinate/incominggrenade9.ogg");
    PrecacheSound("player/voice/botsurvival/leader/incominggrenade4.ogg");
    PrecacheSound("player/voice/botsurvival/subordinate/incominggrenade4.ogg");
    PrecacheSound("player/voice/botsurvival/subordinate/incominggrenade35.ogg");
    PrecacheSound("player/voice/botsurvival/subordinate/incominggrenade34.ogg");
    PrecacheSound("player/voice/botsurvival/subordinate/incominggrenade33.ogg");
    PrecacheSound("player/voice/botsurvival/subordinate/incominggrenade23.ogg");
    PrecacheSound("player/voice/botsurvival/leader/incominggrenade2.ogg");
    PrecacheSound("player/voice/botsurvival/leader/incominggrenade13.ogg");
    PrecacheSound("player/voice/botsurvival/leader/incominggrenade12.ogg");
    PrecacheSound("player/voice/botsurvival/leader/incominggrenade11.ogg");
    PrecacheSound("player/voice/botsurvival/leader/incominggrenade10.ogg");
    PrecacheSound("player/voice/botsurvival/leader/incominggrenade18.ogg");

    //Molotov/Incen Callout
    PrecacheSound("player/voice/responses/security/subordinate/damage/molotov_incendiary_detonated7.ogg");
    PrecacheSound("player/voice/responses/security/leader/damage/molotov_incendiary_detonated6.ogg");
    PrecacheSound("player/voice/responses/security/subordinate/damage/molotov_incendiary_detonated6.ogg");
    PrecacheSound("player/voice/responses/security/leader/damage/molotov_incendiary_detonated5.ogg");
    PrecacheSound("player/voice/responses/security/leader/damage/molotov_incendiary_detonated4.ogg");

    //Gas/Toxic_Gas Call Out
    PrecacheSound("player/focus_gasp_01.wav");
    PrecacheSound("player/focus_gasp_02.wav");
    PrecacheSound("player/focus_gasp_03.wav");
    PrecacheSound("player/focus_gasp_04.wav");
    PrecacheSound("player/focus_gasp_05.wav");
    PrecacheSound("player/focus_gasp.wav");

}

public void OnClientDisconnect(int client)
{
    g_plyrFireScreamCoolDown[client] = 0.0;
    g_plyrGrenScreamCoolDown[client] = 0.0;
    g_plyrGasScreamCoolDown[client] = 0.0;
}

public OnEntityCreated(entity, const String:classname[])
{

    if (StrEqual(classname, "grenade_m67") || StrEqual(classname, "grenade_f1"))
        {
        CreateTimer(0.5, GrenadeScreamCheckTimer, entity, TIMER_REPEAT|TIMER_FLAG_NO_MAPCHANGE);
        }
    else if (StrEqual(classname, "grenade_molotov") || StrEqual(classname, "grenade_anm14"))
        {
        CreateTimer(0.2, FireScreamCheckTimer, entity, TIMER_REPEAT|TIMER_FLAG_NO_MAPCHANGE);
        }
    else if (StrEqual(classname, "grenade_riotgas"))
        {
        CreateTimer(0.5, GasScreamCheckTimer, entity, TIMER_REPEAT|TIMER_FLAG_NO_MAPCHANGE);
        }

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
        if (client <= 0 || !IsClientInGame(client) || !IsClientConnected(client))
            continue;
        if (owner <= 0 || !IsClientInGame(owner) || !IsClientConnected(owner))
            continue;
        if (IsFakeClient(client))
            continue;

        if (IsPlayerAlive(client) && GetClientTeam(client) == 2 && 1 <= owner <= MaxClients && IsClientInGame(owner) && GetClientTeam(owner) == 3)
        {

            GetClientEyePosition(client, fPlayerEyeOrigin);
            GetClientAbsOrigin(client,fPlayerOrigin);

            
            if (g_plyrFireScreamCoolDown[client] != 0.0 && GetGameTime() - g_plyrFireScreamCoolDown[client] < 17.0) // 15 seconds cooldown
                continue;


            if (GetVectorDistance(fPlayerOrigin, fGrenOrigin) <= 300)
            {
                //PrintToServer("SCREAM FIRE");
                PlayerFireScreamRand(client);
                g_plyrFireScreamCoolDown[client] = GetGameTime();
                //CloseHandle(trace);
            }
        }
    }

    if (!IsValidEntity(entity) || !(entity > 0))
        KillTimer(timer);
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
        if (client <= 0 || !IsClientInGame(client) || !IsClientConnected(client))
            continue;

        if (IsFakeClient(client))
            continue;

        if (IsPlayerAlive(client) && GetClientTeam(client) == 2 && 1 <= owner <= MaxClients && IsClientInGame(owner) && GetClientTeam(owner) == 3)
        {

            GetClientEyePosition(client, fPlayerEyeOrigin);
            GetClientAbsOrigin(client,fPlayerOrigin);
            

            if (g_plyrGrenScreamCoolDown[client] != 0.0 && GetGameTime() - g_plyrGrenScreamCoolDown[client] < 5.0) // 5 seconds cooldown
                continue;

            if (GetVectorDistance(fPlayerOrigin, fGrenOrigin) <= 340)
            {
                PlayerGrenadeScreamRand(client);
                g_plyrGrenScreamCoolDown[client] = GetGameTime();

            }
        }
    }

    if (!IsValidEntity(entity) || !(entity > 0))
        KillTimer(timer);
}
public Action:GasScreamCheckTimer(Handle:timer, any:entity)
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
        if (client <= 0 || !IsClientInGame(client) || !IsClientConnected(client))
            continue;
        if (owner <= 0 || !IsClientInGame(owner) || !IsClientConnected(owner))
            continue;
        if (IsFakeClient(client))
            continue;

        if (IsPlayerAlive(client) && GetClientTeam(client) == 2 && 1 <= owner <= MaxClients && IsClientInGame(owner) && GetClientTeam(owner) == 3)
        {

            GetClientEyePosition(client, fPlayerEyeOrigin);
            GetClientAbsOrigin(client,fPlayerOrigin);

            
            if (g_plyrGasScreamCoolDown[client] != 0.0 && GetGameTime() - g_plyrGasScreamCoolDown[client] < 3.0) // 5 seconds cooldown
                continue;


            if (GetVectorDistance(fPlayerOrigin, fGrenOrigin) <= 350)
            {
                //PrintToServer("SCREAM GAS");
                PlayerGasScreamRand(client);
                g_plyrGasScreamCoolDown[client] = GetGameTime();
                //CloseHandle(trace);
            }
        }
    }

    if (!IsValidEntity(entity) || !(entity > 0))
        KillTimer(timer);
}
