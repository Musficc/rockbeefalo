name = "Rock Beefalo"
version = "1.0.0"

description = "Change look and sound that beefalo makes when you approach"
author = "Temort"

api_version = 10

dst_compatible = true
all_clients_require_mod = false
client_only_mod = true

icon_atlas = "modicon.xml"
icon = "modicon.tex"

configuration_options =
{
    {
        name = "VANILLA_SOUND",
        label = "Change Sound",
        options =
        {
            { description = "Default", data = true },
            { description = "Meme", data = false },
        },
        default = false,
        hover = "You can turn off meme sound if you want.",
    },
}