#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
line = 0;
maxLines = 6;
sep = 40;
blocked = false;
text[0] = "Start";
text[1] = "Language";
text[2] = "Colorful sprites";
text[3] = "Mute sounds";
text[4] = "Funny mode";
text[5] = "No Hit mode";
startY = 288;
startX = 200;
diffX = 384;
dark = 0;
fadeSpd = 0.02;
if (!variable_global_exists("SettingE"))
    scrInitGlobalsE();
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (blocked)
    exit;
if (global.key_pressed[key_down])
{
    scrPlaySoundE("eMenuMove");
    line += 1;
    if (line >= maxLines)
        line = 0;
}
else if (global.key_pressed[key_up])
{
    scrPlaySoundE("eMenuMove");
    line -= 1;
    if (line < 0)
        line = maxLines - 1;
}
else if (global.key_pressed[key_shoot])
{
    scrPlaySoundE("eMenuConfirm");
    if (line > 0)
        global.SettingE[line - 1] = !global.SettingE[line - 1];
    else
        blocked = true;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (line == 0)
    draw_set_color(c_yellow);
else
    draw_set_color(c_white);

draw_set_font(fDetermination);
draw_set_halign(fa_center);
draw_text(400, startY - sep * 2, text[0]);
draw_set_halign(fa_left);

if (line == 1)
    draw_set_color(c_yellow);
else
    draw_set_color(c_white);
var val;
if (global.SettingE[0])
    val = "Russian";
else
    val = "English";
draw_text(startX, startY, text[1] + ":");
draw_set_halign(fa_right);
draw_text(startX + diffX, startY, val);

for (i = 1; i < 5; i += 1)
{
    if (line == i + 1)
        draw_set_color(c_yellow);
    else
        draw_set_color(c_white);
    if (global.SettingE[i])
        val = "ON";
    else
        val = "OFF";
    draw_set_halign(fa_left);
    draw_text(startX, startY + i * sep, text[i + 1] + ":");
    draw_set_halign(fa_right);
    draw_text(startX + diffX, startY + i * sep, val);
}

if (blocked)
{
    draw_set_color(c_black);
    draw_set_alpha(dark);
    if (dark < 1)
        dark = min(dark + fadeSpd, 1);
    else
        room_goto(rBattleE);
    draw_rectangle(0, 0, 800, 608, false);
    draw_set_alpha(1);
}
draw_set_halign(fa_left);
