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
