///scrWriteTextE(phrase1, phrase2, ...)
///Sends phrase lines to text writer

if (!instance_exists(objTextWriterE))
    return -1;
with (objBattleControllerE)
{
    event_user(5);
}
with (objTextWriterE)
{
    controlable = true;
    finished = false;
    maxPhrase = argument_count;
    phrase = 0;
    progress = 0;
    for (i = 0; i < maxPhrase; i += 1)
    {
        text[i] = argument[i];
    }
    alarm[0] = textSpd;
    event_user(1);
    if (argument_count == 0)
        event_user(0);
}
with (objHeart)
{
    if (hideHeart and visible)
    {
        visible = false;
        froz = true;
    }
}
