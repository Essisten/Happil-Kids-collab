///scrGetSpikeSkin(direction, type)
///direction - direction of the spike(1 - up, 2 - down, 3 - left, 4 - right)
///type - normal or mini
///setting proper skin for spikes

switch (room)
{
    case rmIntroE:
        if (argument1)
        {
            skins[0] = sprMiniSpikeUpIntroE;
            skins[1] = sprMiniSpikeDownIntroE
            skins[2] = sprMiniSpikeLeftIntroE;
            skins[3] = sprMiniSpikeRightIntroE;
        }
        else
        {
            skins[0] = sprSpikeUpIntroE;
            skins[1] = sprSpikeDownIntroE
            skins[2] = sprSpikeLeftIntroE;
            skins[3] = sprSpikeRightIntroE;
        }
        sprite_index = skins[argument0 - 1];
        break;
}
