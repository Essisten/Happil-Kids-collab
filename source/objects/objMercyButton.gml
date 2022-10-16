#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
lineAmount = 2;
columnAmount = 2
option[0, 0] = "Spare";
option[1, 0] = "Flee";
option[0, 1] = "Reset";
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
switch (line)
{
    case 1:
        if (column == 2)
            room_restart();
        else
        {
            scrWriteTextE("You did nothing.");
            with (objBattleControllerE)
            {
                event_user(7);
            }
        }
        break;
    case 2:
        room_goto(rmHub);
        break;
}
