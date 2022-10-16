#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
type = 1;   //1 - no effect, 2 - miss, 3 - numeric
dmg = 0;
space = 32;
image_speed = 0;
vspeed = -4;
gravity = 0.1;
fade = false;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (fade)
{
    image_alpha = max(image_alpha - 0.05, 0);
    if (image_alpha <= 0)
        instance_destroy();
}
else if (vspeed > 0)
    fade = true;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (type == 3)
{
    str = string(dmg);
    for (i = 0; i < string_length(str); i += 1)
    {
        draw_sprite(sprDamageNum, real(string_char_at(str, i)), x + i * space, y);
    }
}
else
    draw_sprite(sprite_index, type, x, y);
