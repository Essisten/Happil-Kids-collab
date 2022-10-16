#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
last = true;
startX = x + 15;
startY = y + 10;
font = fDetermination12;
snd = "sndYoshiJump";
sep = 14;
image_speed = 0;
for (i = 0; i < 20; i += 1)
{
    color[i] = c_black;
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(1);
if (phrase >= maxPhrase and controlable)
{
    event_user(0);
    exit;
}
progress += 1;
if (string_char_at(text[phrase], progress) != " ")
    scrPlaySoundE(snd);
if (string_length(text[phrase]) > progress)
    alarm[0] = textSpd;
else
    finished = true;
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Text is over
execute_string(endCommand);
with (objBattleControllerE)
{
    with (attack)
        event_user(0);
}
instance_destroy();
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
///Fit text
switch (image_index)
{
    case 0:
    case 1:
    case 4:
        textW = 85;
        break;
    case 2:
        textW = 200;
        startX = x + 40;
        break;
    case 3:
        textW = 170;
        startX = x + 35;
        break;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (maxPhrase == 0)
    exit;
draw_self();
draw_set_color(color[phrase]);
draw_set_font(font);
if (shake)
{

}
else
{
    draw_text_ext(startX, startY, string_copy(text[phrase], 0, progress), sep, textW);
}
