///scrHealHeartE(heal)
///Heals player

with (objHeart)
{
    HP += argument0;
    if (HP > maxHP)
        HP = maxHP;
    else if (HP <= 0)
        event_user(0);
}
