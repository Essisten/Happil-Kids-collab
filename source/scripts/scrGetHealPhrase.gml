///scrGetHealPhrase(heal)
///Determines if you fully restored your HP or not

var tmpText;
tmpText = "* ";
if (argument0 == 0)
    tmpText = "";
else if (argument0 < 0)
{
    scrPlaySoundE("eHurt");
    tmpText += "You lost " + string(abs(argument0)) + " HP!";
}
else if (objHeart.HP + argument0 < objHeart.maxHP)
{
    tmpText += "You restored " + string(argument0) + " HP!";
    scrPlaySoundE("eHeal");
}
else
{
    tmpText += "Your HP was maxed out!";
    show_debug_message(objHeart.HP);
    show_debug_message(argument0);
    show_debug_message(objHeart.maxHP);
    scrPlaySoundE("eHeal");
}
return tmpText;
