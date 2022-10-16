#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
chosen = 1;
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
switch (state)
{
    case 1:
        state = 2;
        chosen = line;
        event_user(14);
        line = 1;
        column = 1;
        event_user(1);
        break;
    case 2:
        var ind;
        ind = line * 2 + column - 3;
        switch (chosen)
        {
            case 1:
                switch (ind)
                {
                    case 0:
                        scrWriteTextE("Essisten - 6 ATK 9 DEF");
                        break;
                    case 1:
                        scrWriteTextE("You tried to say something, but you failed.         #* You're not used to speak much...");
                        break;
                }
                break;
            case 2:
                switch (ind)
                {
                    case 0:
                        scrWriteTextE("Sans - 1 ATK 1 DEF          #* The easiest enemy.", "Can't dodge forever, keep attacking.");
                        break;
                    case 1:
                        scrWriteTextE("You spell a random joke...", "It was awful...          #* But... Seems like he like it...?");
                        break;
                }
                break;
        }
        with (objBattleControllerE)
        {
            event_user(7);
            event_user(6);
        }
        state = 1;
        break;
}
#define Other_24
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (state == 1)
    chosen = 0;
switch (chosen)
{
    case 0:
        with (objBattleControllerE)
        {
            event_user(6);
        }
        break;
    case 1:
        columnAmount = 2;
        lineAmount = 1;
        option[0, 0] = "Check";
        option[0, 1] = "Talk";
        break;
    case 2:
        columnAmount = 2;
        lineAmount = 1;
        option[0, 0] = "Check";
        option[0, 1] = "Joke";
        break;
}
