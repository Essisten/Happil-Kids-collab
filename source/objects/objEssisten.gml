#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
head = 0;
body = 0;
arms = 0;
legs = 0;
bodyY = y + 4;
headY = y + 4;
meme = 0;
spd = 2;
alarm[0] = 1;
anim = true;
dodge = true;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Slight delay from the body position
headY = bodyY;
alarm[0] = 2;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
if (!anim)
    exit;
meme += spd;
bodyY = sin(degtorad(meme)) * 4 + y + 4;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprLegsE, legs, x, y);
draw_sprite(sprHeadE, head, x, headY);
draw_sprite(sprBodyE, body, x, bodyY);
draw_sprite(sprArmsE, arms, x, bodyY);
