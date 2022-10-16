#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///https://www.dropbox.com/s/9uzyd5gsndsjiuu/CryptOfTomorrow.zip?dl=0
name = choose("The Kid", "Just", "Dumbass", "The Guy", "Teh", "Mokuteki", "You",
"PDPlayer", "Kamilia", "Boshy");
lv = "8";
nameX = 30;
nameY = 504;
//160
lvX = 660;
lvY = nameY;
hpX = 250;
hpY = nameY;
hp = 0;
maxHP = 0;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///https://www.dropbox.com/s/4uya0rbyv9w6pxy/marsneedscunnilingus.zip?dl=0
draw_set_color(c_white);
draw_set_font(fMars);
draw_text(nameX, nameY, name);
draw_text(lvX, lvY, "LV " + lv);
draw_set_font(fCrypt);
draw_text(hpX, hpY + 4, "HP");
if (instance_exists(objHeart))
{
    hp = objHeart.HP;
    maxHP = objHeart.maxHP;
}
draw_healthbar(hpX + 35, hpY, hpX + 30 + (2 * maxHP), hpY + 24, hp / maxHP * 100, c_red, c_yellow, c_yellow, 0, true, false);
draw_set_font(fMars);
draw_text(hpX + 40 + (2 * maxHP), hpY, string(hp) + "/" + string(maxHP));
