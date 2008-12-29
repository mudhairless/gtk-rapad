
'somehow this code should help me call the listview creation method with
'a varible list of types.

#include once "gtk/gtk.bi"

enum Constants
    a, b, c, d, e
end enum

sub f ( byref array as const string )
    for elem as integer = 0 to len(array) - 1
        print array[elem] & !"\t" ;
    next
    print
end sub

f( chr(a,b) )        ' 01
f( chr(b,c,d) )      ' 123
f( chr(a,b,d,e) )    ' 0134

f( chr(G_TYPE_STRING, G_TYPE_BOOLEAN) )        ' 01
