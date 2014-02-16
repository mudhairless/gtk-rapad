#include once "gtkrapad/gtkrapad.bi"
using GtkRapad

dim GtkApp as TGtkApplication

dim svlm as TGtkSourceLanguageManager

var x = svlm.langIDs

var cnt = 0

? "Supported Languages for Syntax Highlighting:"
while x[cnt] <> 0
    ? *(x[cnt])
    cnt += 1
wend
