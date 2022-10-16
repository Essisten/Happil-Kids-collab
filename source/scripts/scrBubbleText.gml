///scrBubbleText(type, x, y, text1, text2...)
///Creates a new bubble and fills it with text
bubble = instance_create(argument1, argument2, objSpeechBubble);
with (bubble)
{
    image_index = argument0;
    maxPhrase = argument_count - 3;
    for (i = 3; i < argument_count; i += 1)
    {
        text[i - 3] = argument[i];
    }
    alarm[0] = 1;
}
