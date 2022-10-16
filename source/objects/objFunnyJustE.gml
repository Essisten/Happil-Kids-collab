#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale = 8;
image_yscale = image_xscale;
d = 0;
oldY = y;
instance_create(x, y, objLightIntroE);
oldMusic = global.music;
oldPos = sound_get_pos(global.music_instance);
music = play_bg_music("eIntroJust", false);
//add achievement here
camera_shake(16, 50);
alarm[0] = 50;
alarm[1] = 50;
alarm[2] = 600;
timer = 0;
freezeDelay = false;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Colorful fruits
with (instance_create(random(800), 0, objJustFruitE))
{
    image_index = choose(1, 2, 10, 11, 12);
    hspeed = random_range(-1, 1);
    vspeed = random_range(6, 10);
}
alarm[0] = 2;
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Gray fruits
direction = 190 + random(160);
for (i = 0; i < 4; i += 1)
{
    fruit = instance_create(x, y, objJustFruitE);
    fruit.direction = direction;
    fruit.speed = 9 - i;
    fruit.image_index = 13;
}
alarm[1] = 10;
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Final
alarm[0] = -1;
alarm[1] = -1;
alarm[3] = 50;
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Disappearing
visible = false;
instance_create(x, y, objLightIntroE);
with (objJustFruitE)
{
    if (instance_exists(Player))
        direction = point_direction(x, y, Player.x, Player.y) + 180;
    speed = 4 + random(10);
}
alarm[5] = 50;
#define Alarm_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Epilepsy
if (!instance_exists(objLightIntroE))
    instance_create(x, y, objLightIntroE);
else
{
    with (objLightIntroE)
        instance_destroy();
}
if (freezeDelay)
    alarm[4] = 2;
#define Alarm_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Return normal music
instance_destroy();
if (instance_exists(Player))
{
    play_bg_music(oldMusic, true);
    sound_set_pos(global.music_instance, oldPos);
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!visible or alarm[3] > -1)
    exit;
y = oldY + sin(degtorad(d)) * 8;
image_alpha = 0.6 + random(0.4);
d += 8;
timer = sound_get_pos(music) * 12.75;
if ((timer > 2 and timer < 2.6) or
    (timer > 3.9 and timer < 4.1) or
    (timer > 5 and timer < 6.4) or
    (timer > 8 and timer < 9.2) or
    (timer > 9.8 and timer < 10) or
    (timer > 10.4 and timer < 10.8))
{
    if (!freezeDelay)
    {
        alarm[4] = 2;
        event_user(0);
        freezeDelay = true;
    }
}
else
{
    freezeDelay = false;
}
if (!instance_exists(Player) or !sound_isplaying(music))
{
    sound_stop(music);
    alarm[2] = 1;
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Freezing
with (objJustFruitE)
{
    if (image_index != 13)
        speed = 0;
}
