#include once "gtkrapad/gtkrapad.bi"
using GtkRapad

dim GtkApp as TGtkApplication

if __FB_ARGC__ < 4 then
    ? "FreeBASIC GTK Prompting Utility"
    ? "Usage: prompt args"
    ? "Recognized commands:"
    ? "    prompt --message title message"
    ? "    prompt --confirm title yes-or-no-question"
    ? "    prompt title message default-value"
    ?
    end 43
end if

if command(1) = "--message" then
    GtkApp.messageBox(command(2),command(3))
    ? "Message Recieved"
elseif command(1) <> "--confirm" then
    ? GtkApp.prompt(command(1),command(2),command(3))
else
    var ret = GtkApp.confirm(command(2),command(3))
    if ret = true then
        ? "Yes"
    else
        ? "No"
    end if
end if
