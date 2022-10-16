///scrNextTurnE(box_w, box_h, box_x, box y)
///Switches battle to next turn


with (objBattleBox)
{
    size[0] = argument[0];
    size[1] = argument[1];
    if (argument_count > 2)
    {
        x = argument[2];
        y = argument[3];
    }
    alarm[0] = 1;
}
