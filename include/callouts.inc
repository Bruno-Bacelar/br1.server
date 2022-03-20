stock BotFireScreamRand(client)
{                                                                                                                                                                  
        //PrintToServer("SCREAM FIRE");

        switch(GetRandomInt(1, 5))
        {
                case 1: EmitSoundToAll("player/voice/responses/insurgent/leader/damage/molotov_incendiary_detonated5.ogg", client, SNDCHAN_VOICE, _, _, 1.0);
                case 2: EmitSoundToAll("player/voice/responses/insurgent/subordinate/damage/molotov_incendiary_detonated3.ogg", client, SNDCHAN_VOICE, _, _, 1.0);
                case 3: EmitSoundToAll("player/voice/responses/insurgent/leader/damage/molotov_incendiary_detonated5.ogg", client, SNDCHAN_VOICE, _, _, 1.0);
                case 4: EmitSoundToAll("player/voice/responses/insurgent/subordinate/damage/molotov_incendiary_detonated3.ogg", client, SNDCHAN_VOICE, _, _, 1.0);
                case 5: EmitSoundToAll("player/voice/responses/insurgent/leader/damage/molotov_incendiary_detonated5.ogg", client, SNDCHAN_VOICE, _, _, 1.0);
        }
}
stock PlayerBurnScreamRand(client)
{
        //PrintToServer("SCREAM BURN");

        switch(GetRandomInt(1, 11))
        {
                case 1: EmitSoundToAll("player/voice/botsurvival/subordinate/flashbanged15.ogg", client, SNDCHAN_VOICE, _, _, 1.0);
                case 2: EmitSoundToAll("player/voice/botsurvival/subordinate/flashbanged4.ogg", client, SNDCHAN_VOICE, _, _, 1.0);
                case 3: EmitSoundToAll("player/voice/botsurvival/subordinate/flashbanged8.ogg", client, SNDCHAN_VOICE, _, _, 1.0);
                case 4: EmitSoundToAll("player/voice/botsurvival/subordinate/incominggrenade21.ogg", client, SNDCHAN_VOICE, _, _, 1.0);
                case 5: EmitSoundToAll("player/voice/botsurvival/leader/flashbanged10.ogg", client, SNDCHAN_VOICE, _, _, 1.0);
                case 6: EmitSoundToAll("player/voice/botsurvival/leader/flashbanged11.ogg", client, SNDCHAN_VOICE, _, _, 1.0);
                case 7: EmitSoundToAll("player/voice/botsurvival/subordinate/flashbanged12.ogg", client, SNDCHAN_VOICE, _, _, 1.0);
                case 8: EmitSoundToAll("player/voice/botsurvival/subordinate/flashbanged21.ogg", client, SNDCHAN_VOICE, _, _, 1.0);
                case 9: EmitSoundToAll("player/voice/botsurvival/leader/incomminggrenade17.ogg", client, SNDCHAN_VOICE, _, _, 1.0);
                case 10: EmitSoundToAll("player/voice/botsurvival/leader/incomminggrenade26.ogg", client, SNDCHAN_VOICE, _, _, 1.0);
                case 11: EmitSoundToAll("player/voice/botsurvival/leader/incomminggrenade32.ogg", client, SNDCHAN_VOICE, _, _, 1.0);
        }
}

stock BotBragRand(attacker)
{
        
        switch(GetRandomInt(1, 20))
        {
                case 1: EmitSoundToAll("player/voice/responses/insurgent/leader/suppressed/target1.ogg", attacker, SNDCHAN_VOICE, _, _, 1.0);
                case 2: EmitSoundToAll("player/voice/responses/insurgent/leader/suppressed/target10.ogg", attacker, SNDCHAN_VOICE, _, _, 1.0);
                case 3: EmitSoundToAll("player/voice/responses/insurgent/leader/suppressed/target2.ogg", attacker, SNDCHAN_VOICE, _, _, 1.0);
                case 4: EmitSoundToAll("player/voice/responses/insurgent/leader/suppressed/target3.ogg", attacker, SNDCHAN_VOICE, _, _, 1.0);
                case 5: EmitSoundToAll("player/voice/responses/insurgent/leader/suppressed/target4.ogg", attacker, SNDCHAN_VOICE, _, _, 1.0);
                case 6: EmitSoundToAll("player/voice/responses/insurgent/leader/suppressed/target5.ogg", attacker, SNDCHAN_VOICE, _, _, 1.0);
                case 7: EmitSoundToAll("player/voice/responses/insurgent/leader/suppressed/target6.ogg", attacker, SNDCHAN_VOICE, _, _, 1.0);
                case 8: EmitSoundToAll("player/voice/responses/insurgent/leader/suppressed/target7.ogg", attacker, SNDCHAN_VOICE, _, _, 1.0);
                case 9: EmitSoundToAll("player/voice/responses/insurgent/leader/suppressed/target8.ogg", attacker, SNDCHAN_VOICE, _, _, 1.0);
                case 10: EmitSoundToAll("player/voice/responses/insurgent/leader/suppressed/target9.ogg", attacker, SNDCHAN_VOICE, _, _, 1.0);
                case 11: EmitSoundToAll("player/voice/responses/insurgent/subordinate/suppressed/target1.ogg", attacker, SNDCHAN_VOICE, _, _, 1.0);
                case 12: EmitSoundToAll("player/voice/responses/insurgent/subordinate/suppressed/target10.ogg", attacker, SNDCHAN_VOICE, _, _, 1.0);
                case 13: EmitSoundToAll("player/voice/responses/insurgent/subordinate/suppressed/target2.ogg", attacker, SNDCHAN_VOICE, _, _, 1.0);
                case 14: EmitSoundToAll("player/voice/responses/insurgent/subordinate/suppressed/target3.ogg", attacker, SNDCHAN_VOICE, _, _, 1.0);
                case 15: EmitSoundToAll("player/voice/responses/insurgent/subordinate/suppressed/target4.ogg", attacker, SNDCHAN_VOICE, _, _, 1.0);
                case 16: EmitSoundToAll("player/voice/responses/insurgent/subordinate/suppressed/target5.ogg", attacker, SNDCHAN_VOICE, _, _, 1.0);
                case 17: EmitSoundToAll("player/voice/responses/insurgent/subordinate/suppressed/target6.ogg", attacker, SNDCHAN_VOICE, _, _, 1.0);
                case 18: EmitSoundToAll("player/voice/responses/insurgent/subordinate/suppressed/target7.ogg", attacker, SNDCHAN_VOICE, _, _, 1.0);
                case 19: EmitSoundToAll("player/voice/responses/insurgent/subordinate/suppressed/target8.ogg", attacker, SNDCHAN_VOICE, _, _, 1.0);
                case 20: EmitSoundToAll("player/voice/responses/insurgent/subordinate/suppressed/target9.ogg", attacker, SNDCHAN_VOICE, _, _, 1.0);

        }
}
