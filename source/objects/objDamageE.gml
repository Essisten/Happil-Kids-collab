#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
type = 1;   //1 - no effect, 2 - miss, 3 - numeric
dmg = objHitAnimE.dmg;
space = 32;
image_speed = 0;
vspeed = -4;
gravity = 0.1;
fade = false;
target = objBattleControllerE.enemy[objBattleControllerE.selectedEnemy];
if (target.dodge or dmg == 0)
    type = 2;
else if (!target.god)
    type = 3;
if (!target.dodge)
    x = target.x;
y = target.y;
dmg *= objBattleControllerE.playerAttack * target.DEF;
if (type == 3)
    target.HP -= dmg;
str = string(ceil(dmg));
chars = string_length(str);
shiftX = chars * space / 2;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (fade)
{
    image_alpha = max(image_alpha - 0.02, 0);
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
    for (i = 1; i <= chars; i += 1)
    {
        draw_sprite_ext(sprDamageNum, real(string_char_at(str, i)), x + i * space - shiftX, y, 1, 1, 0, c_white, image_alpha);
    }
}
else
    draw_sprite_ext(sprite_index, type - 1, x, y, 1, 1, 0, c_white, image_alpha);
