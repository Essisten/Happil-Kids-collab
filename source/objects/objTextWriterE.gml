#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
text[0] = "";
font = fDetermination;
startX = 64;
startY = 352;
textW = 700;
sep = 42;
shake = false;
finished = false;
skipable = true;
controlable = true;
progress = 0;
phrase = 0;
maxPhrase = 0;
textSpd = 2;
endCommand = "";
snd = "eUIvoice";
for (i = 0; i < 20; i += 1)
{
    color[i] = c_white;
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (phrase >= maxPhrase and controlable)
{
    event_user(0);
    exit;
}
if (objBattleBox.alarm[0] != -1)
{
    alarm[0] = textSpd;
    exit;
}
progress += 1;
if (string_char_at(text[phrase], progress) != " ")
    scrPlaySoundE(snd);
if (string_length(text[phrase]) > progress)
    alarm[0] = textSpd;
else
    finished = true;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if (maxPhrase == 0 or !controlable)
    exit;
if (global.key_pressed[key_jump] and !finished and skipable)
{
    alarm[0] = -1;
    progress = string_length(text[phrase]);
    finished = true;
}
if (global.key_pressed[key_shoot] and finished)
{
    finished = false;
    phrase += 1;
    progress = 0;
    if (phrase >= maxPhrase)
        event_user(0);
    alarm[0] = textSpd;
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Text is over
text = 0;
phrase = 0;
progress = 0;
maxPhrase = 0;
text[0] = "";
for (i = 0; i < 20; i += 1)
{
    color[i] = c_white;
}
with (objHeart)
{
    if (hideHeart and !visible)
    {
        visible = true;
        froz = false;
    }
}
with (objBattleControllerE)
{
    event_user(9);
}
execute_string(endCommand);
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Make text fit the box
if (instance_exists(objBattleBox))
{
    textW = objBattleBox.box_width - 12;
    startX = objBattleBox.x - objBattleBox.box_width / 2 + 14;
    startY = objBattleBox.y - objBattleBox.box_height / 2 + 12;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ((maxPhrase == 0 and controlable) or (objBattleControllerE.usedButton > 0 and !controlable) or
(objBattleBox.alarm[0] != -1))
    exit;
draw_set_color(color[phrase]);
draw_set_font(font);
if (shake)
{

}
else
{
    draw_text_ext(startX, startY, "* " + string_copy(text[phrase], 0, progress), sep, textW);
}
