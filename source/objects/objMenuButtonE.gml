#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
selected = false;
textX = 92;
textY = 356;
textOffsetX = 332;
textOffsetY = 40;
line = 1;
column = 1;
lineAmount = 1;
columnAmount = 1;
state = 1;
prevPosX[0] = 1;
prevPosY[0] = 1;
image_speed = 0;
image_xscale = 1.2;
image_yscale = image_xscale;
event_user(15);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!selected)
    exit;
if (global.key_pressed[key_up])
{
    if (line > 1)
    {
        scrPlaySoundE("eMenuMove");
        line -= 1;
        event_user(1);
    }
}
else if (global.key_pressed[key_down])
{
    if (line < lineAmount and option[line, column - 1] != "")
    {
        scrPlaySoundE("eMenuMove");
        line += 1;
        event_user(1);
    }
}
else if (global.key_pressed[key_left])
{
    if (column > 1)
    {
        scrPlaySoundE("eMenuMove");
        column -= 1;
        event_user(1);
    }
}
else if (global.key_pressed[key_right])
{
    if (column < columnAmount and option[line - 1, column] != "")
    {
        scrPlaySoundE("eMenuMove");
        column += 1;
        event_user(1);
    }
}
else if (global.key_pressed[key_shoot])
{
    event_user(0);
    scrPlaySoundE("eMenuConfirm");
}
else if (global.key_pressed[key_jump])
{
    if (state > 1)
    {
        state -= 1;
        event_user(13);
        event_user(1);
    }
    else
    {
        with (objBattleControllerE)
        {
            if (heartFrozen)
            {
                usedButton = 0;
                event_user(0);
                event_user(4);
                event_user(1);
                event_user(10);
            }
        }
    }
    scrPlaySoundE("eMenuMove");
    event_user(14);
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Reaction
prevPosX[state] = line;
prevPosY[state] = column;
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Moving heart to selected option
objHeart.x = textX + (column - 1) * textOffsetX - 16;
objHeart.y = textY + line * textOffsetY - 20;
#define Other_23
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Restore last position
line = prevPosX[state];
column = prevPosY[state];
#define Other_24
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Update options due to state change
#define Other_25
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Clean up options
for (i = 0; i < 4; i += 1)
{
    for (k = 0; k < 3; k += 1)
    {
        option[i, k] = "";
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self();
if (!selected)
    exit;
draw_set_color(c_white);
draw_set_font(fDetermination);
for (i = 0; i < lineAmount; i += 1)
{
    for (k = 0; k < columnAmount; k += 1)
    {
        if (option[i, k] != "")
            draw_text(textX + k * textOffsetX, textY + i * textOffsetY, "* " + option[i, k]);
    }
}
