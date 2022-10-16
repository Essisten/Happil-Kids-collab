#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
weapon = 0; //0 - pistol, 1 - knife
playerAttack = 500;
phase = 1;
mercy = 0;
genocide = 0;
turn = 0;
comment = "Essisten blocks your way.";

blackInside = true; //box
boxW = 0;
boxH = 0;

selectedButton = 1;
usedButton = 0;
lastButton = 0;
maxButtons = 4;
btn[0] = objFightButton;
btn[1] = objActButton;
btn[2] = objItemsButton;
btn[3] = objMercyButton;
for (i = 1; i <= maxButtons; i += 1)
{
    instance_create(-100 + i * 200, 568, btn[i - 1]);
}
with (btn[selectedButton - 1])
    image_index = 1;
box = instance_create(400, 416, objBattleBox);
heart = instance_create(300, 500, objHeart);
stats = instance_create(0, 0, objPlayerStatE);
writer = instance_create(0, 0, objTextWriterE);
attack = noone;
heartFrozen = true; //when it's your turn
enemy[0] = instance_create(400, 192, objEssisten);
enemy[1] = 0;
enemy[2] = 0;
selectedEnemy = 0;
event_user(2);
event_user(3);
event_user(6);
event_user(8);
event_user(10);
maxAttacks = 4;
nextAttack = 0;
prevAttack = 0;
availableAttacks[0] = objAttack1A;
availableAttacks[1] = objAttack1B;
availableAttacks[2] = objAttack1C;
availableAttacks[3] = objAttack1D;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Attack ends
with (attack)
{
    instance_destroy();
}
attack = noone;
usedButton = 0;
event_user(5);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (usedButton == 0)
{
    if (global.key_pressed[key_left])
    {
        if (!heartFrozen)
            exit;
        scrPlaySoundE("eMenuMove");
        event_user(0);
        if (selectedButton == 1)
            selectedButton = maxButtons;
        else
            selectedButton -= 1;
        event_user(1);
    }
    else if (global.key_pressed[key_right])
    {
        if (!heartFrozen)
            exit;
        scrPlaySoundE("eMenuMove");
        event_user(0);
        if (selectedButton == maxButtons)
            selectedButton = 1;
        else
            selectedButton += 1;
        event_user(1);
    }
    else if (global.key_pressed[key_shoot])
    {
        scrPlaySoundE("eMenuConfirm");
        if (usedButton == 0)
            usedButton = selectedButton;
        lastButton = selectedButton;
        if (btn[selectedButton - 1] == objItemsButton)
        {
            if (ds_list_size(objItemsButton.item) == 0)
                return -1;
        }
        with (btn[selectedButton - 1])
        {
            line = 1;
            column = 1;
            selected = true;
            event_user(1);
        }
        with (objTextWriterE)
        {
            progress = 99;
        }
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Start of selecting button

if (btn[selectedButton - 1] == objFightButton and weapon)
    btn[selectedButton - 1].image_index = 2;
else
    btn[selectedButton - 1].image_index = 0;
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///End of changing button
with (btn[selectedButton - 1])
{
    image_index = 1;
    selected = false;
}
event_user(4);
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Huge size for box
with (box)
{
    size[0] = 712;
    size[1] = 152;
    alarm[0] = 1;
}
#define Other_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Activates selected button
with (btn[selectedButton - 1])
{
    image_index = 1;
}
event_user(4);
#define Other_14
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Moving heart to button
objHeart.x = btn[selectedButton - 1].x - 46;
objHeart.y = btn[selectedButton - 1].y;
#define Other_15
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Change turn
heartFrozen = !heartFrozen;
if (heartFrozen)
{
    turn += 1;
    event_user(2);
    event_user(3);
    event_user(10);
    with (heart)
        speed = 0;
    with (objAttackProjectileE)
        instance_destroy();
}
else
{
    btn[selectedButton - 1].selected = false;
    event_user(0);
    heart.x = box.x;
    heart.y = box.y;
}
#define Other_16
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Update list of enemies
for (i = 0; i < 2; i += 1)
{
    with (btn[i])
    {
        columnAmount = 1;
        lineAmount = 1;
        option[0, 0] = "Essisten";
    }
}
#define Other_17
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Choose an attack
var w, h, bx, by, command;
w = -1;
h = -1;
bx = -1;
by = -1;
command = "scrNextTurnE(";
if (turn >= maxAttacks)
{
    nextAttack = irandom(maxAttacks - 1);
    while (nextAttack == prevAttack)
        nextAttack = irandom(maxAttacks - 1);
}
else
    nextAttack = turn;
prevAttack = nextAttack;
//Figure out stuff for next attack
switch (nextAttack)
{
    case 0:
        w = 260;
        h = 90;
        break;
    case 1:
        w = 220;
        h = 200;
        break;
    case 2:
        w = 260;
        h = 80;
        break;
    case 3:
        w = 100;
        h = 100;
        break;
}

if (w != -1)
{
    command += string(w);
    if (h != -1)
    {
        command += "," + string(h);
        if (bx != -1)
        {
            command += "," + string(bx);
            if (by != -1)
                command += "," + string(by);
        }
    }
}
command += ");";
objTextWriterE.endCommand = command;
#define Other_18
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Update fight
switch (phase)
{
    case 1:
        play_bg_music("ePhase1", true);
        break;
}
#define Other_19
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Start new attack, for real
if (attack != noone)
    exit;
attack = instance_create(0, 0, availableAttacks[nextAttack]);
if (turn >= maxAttacks)
{
    with (attack)
        version = 2;
}




event_user(11);
#define Other_20
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Commentary
with (objTextWriterE)
{
    controlable = false;
    alarm[0] = 1;
    maxPhrase = 1;
    progress = 0;
    phrase = 0;
    text[0] = objBattleControllerE.comment;
}
#define Other_21
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Phrase
nothing = false;
switch (lastButton)
{
    case 1:
        genocide += 1;
        scrKillLines();
        break;
    case 4:
        mercy += 1;
        scrMercyLines();
        break;
    default:
        nothing = true;
        break;
}
if (nothing)
{

    with (attack)
        event_user(0);
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (objBattleBox)
{
    objBattleControllerE.boxW = box_width;
    objBattleControllerE.boxH = box_height;
    objBattleControllerE.boxX = x;
    objBattleControllerE.boxY = y;
}
if (blackInside)
{
    draw_set_color(c_black);
    draw_rectangle(boxX - boxW / 2, boxY - boxH / 2, boxX + boxW / 2, boxY + boxH / 2, false);
}
