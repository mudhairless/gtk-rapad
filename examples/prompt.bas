#include once "gtkrapad/gtkrapad.bi"
using GtkRapad

dim GtkApp as TGtkApplication

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
