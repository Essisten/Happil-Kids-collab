#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
foodAmount = 6;
lineAmount = 4;
columnAmount = 2;
for (i = 0; i < foodAmount; i += 1)
{
    food[i] = instance_create(0, 0, objFood);
}

food[0].name = "Knife";
food[0].text = "You equiped the knife.#* You started feeling unusual strength in your arms."

food[1].name = "Pie";
food[1].heal = 999;
food[1].text = "You ate the pie.#";

food[2].name = "Snowman piece";
food[2].heal = 45;
food[2].text = "You ate a snowball.#";

food[3].name = "L. Hero";
food[3].heal = 40;
food[3].text = "You ate a Legendary Hero.#* Your attack increased by 4.#";

food[4].name = "I. Noodle";
food[4].heal = 90;
food[4].text = "They're better dry.#";

food[5].name = "Spike";
food[5].heal = 33;
food[5].text = "You ate a Choco Spike.#* Better than fruit.#";

item = ds_list_create();
for (i = 0; i < foodAmount; i += 1)
{
    ds_list_add(item, food[i]);
}
event_user(3);
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//var temp;
temp = ds_list_find_value(item, (line - 1) * 2 + (column - 1));
if (temp == 0)
    exit;
if (temp.name == "Knife" or temp.name == "The Gun")
{
    scrWriteTextE(temp.text);
    if (objBattleControllerE.weapon == 0)
    {
        temp.name = "The Gun";
        temp.text = "You equiped your gun back.#* Good old one...";
        scrSetColorPhrase(0, c_red);
        objFightButton.image_index = 2;
    }
    else
    {
        temp.name = "Knife";
        temp.text = "You equiped the knife.#* For some reason, you feel weird...";
        objFightButton.image_index = 0;
    }
    with (objBattleControllerE)
    {
        weapon = !weapon;
    }
}
else
{
    temp.text += scrGetHealPhrase(temp.heal);
    scrHealHeartE(temp.heal);
    ds_list_delete(item, (line - 1) * 2 + (column - 1));
    scrWriteTextE(temp.text);
    with (temp)
    {
        instance_destroy();
    }
}
with (objBattleControllerE)
{
    event_user(7);
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
event_user(3);
#define Other_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Updating list of items
tmp = ds_list_size(item);
event_user(15);
for (i = 0; i < tmp; i += 1)
{
    var t;
    t  = ds_list_find_value(item, i);
    option[i div 2, i mod 2] = t.name;
}
