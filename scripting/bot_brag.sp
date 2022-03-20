#include <sourcemod>
#include <sdktools>
#include <callouts>

#define PLUGIN_VERSION "1.1"

public Plugin:myinfo =
{
        name = "Bot Brag",
        author = "BCL4RS",  
        description = "Bot brags after killing players.",    
        version = PLUGIN_VERSION,
        url = ""
} 

new Handle:bot_brag_enabled = INVALID_HANDLE                                                                                                                 

public OnPluginStart()      
{
	bot_brag_enabled = CreateConVar("bot_brag_enabled", "1", "<1/0> enable/disable Enable/Disable Braging Bot!", _, true, 0.0, true, 1.0)
}     

public OnMapStart()
{
		    HookEventEx("player_death", OnPlayerDeath, EventHookMode_Post)
		    PrecacheSound("player/voice/responses/insurgent/leader/suppressed/target1.ogg");
        PrecacheSound("player/voice/responses/insurgent/leader/suppressed/target10.ogg");
        PrecacheSound("player/voice/responses/insurgent/leader/suppressed/target9.ogg");
        PrecacheSound("player/voice/responses/insurgent/leader/suppressed/target8.ogg");
        PrecacheSound("player/voice/responses/insurgent/leader/suppressed/target7.ogg");
        PrecacheSound("player/voice/responses/insurgent/leader/suppressed/target6.ogg");
        PrecacheSound("player/voice/responses/insurgent/leader/suppressed/target5.ogg");
        PrecacheSound("player/voice/responses/insurgent/leader/suppressed/target4.ogg");
        PrecacheSound("player/voice/responses/insurgent/leader/suppressed/target3.ogg");
        PrecacheSound("player/voice/responses/insurgent/leader/suppressed/target2.ogg");
        PrecacheSound("player/voice/responses/insurgent/subordinate/suppressed/target1.ogg");
        PrecacheSound("player/voice/responses/insurgent/subordinate/suppressed/target10.ogg");
        PrecacheSound("player/voice/responses/insurgent/subordinate/suppressed/target9.ogg");
        PrecacheSound("player/voice/responses/insurgent/subordinate/suppressed/target8.ogg");
        PrecacheSound("player/voice/responses/insurgent/subordinate/suppressed/target7.ogg");
        PrecacheSound("player/voice/responses/insurgent/subordinate/suppressed/target6.ogg");
        PrecacheSound("player/voice/responses/insurgent/subordinate/suppressed/target5.ogg");
        PrecacheSound("player/voice/responses/insurgent/subordinate/suppressed/target4.ogg");
        PrecacheSound("player/voice/responses/insurgent/subordinate/suppressed/target3.ogg");
        PrecacheSound("player/voice/responses/insurgent/subordinate/suppressed/target2.ogg");
}

public OnMapEnd()
{
		UnhookEvent("player_death", OnPlayerDeath, EventHookMode_Post)
}

public Action:OnPlayerDeath(Handle:event, const String:name[], bool:dontBroadcast)
{
		if(GetConVarInt(bot_brag_enabled) == 1)                                                                                                              
		{
				new victim = GetClientOfUserId(GetEventInt(event, "userid"))
				new attacker = GetClientOfUserId(GetEventInt(event, "attacker"))
				if(IsClientInGame(victim) && IsFakeClient(attacker))
				{
          BotBragRand(attacker)
				}
		}
		return Plugin_Continue
}
