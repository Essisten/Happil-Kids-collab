///scrSkinForBlock()
///Setting proper skin for current room

switch (room)
{
    case rmIntroE:
        image_index = choose(0, 2);
        if (y <= 32 or place_meeting(x, y - 1, objBlockE))
            image_index += 1;
        break;
}
