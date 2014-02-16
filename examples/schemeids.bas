#include once "gtkrapad/gtkrapad.bi"
using GtkRapad

dim GtkApp as TGtkApplication

dim svlm as TGtkSourceStyleSchemeManager

var x = svlm.schemeIDs

var cnt = 0

? "Supported Styles for Syntax Highlighting:"
while x[cnt] <> 0
    ? *(x[cnt])
    cnt += 1
wend
