'
'   button_callback_test.bas
'
'   This demo is very important because it shows how two buttons are
'   able to use the same callback function, yet its possible to tell
'   which object called initiated the call.
'

#include once "gtkrapad/gtkrapad.bi"

using GtkRapad

'Global object variables

dim shared GtkApp as TGtkApplication

dim shared frmMain as TGtkWindow
dim shared hPanel as TGtkHBox
dim shared btnClose as TGtkButton
dim shared btnOk as TGtkButton

'Prototyping each function of our application
declare sub Main()

declare CALLBACK(button_click)

'------------+------------+------------+------------+------------+----------'
'   End the General Declarations ( if you speak Visual Basic )
'------------+------------+------------+------------+------------+----------'

sub Main()

    frmMain.SetKeepAbove( false )
    frmMain.SetSize( 400, 100 )
    frmMain.SetTitle( "Simple Window w/ Buttons")

    hPanel.SetParent( frmMain )

    btnClose.SetCaption( "Close Me" )
    btnClose.SetMouseClick( @button_click )
    btnClose.SetName( "btnClose" )
    btnClose.SetParent( hPanel )

    btnOk.SetCaption( "Click Here" )
    btnOk.SetMouseClick( @button_click )
    btnOk.SetName( "btnOk" )
    btnOk.SetParent( hPanel )

    frmMain.ShowAll()

    GtkApp.Start( frmMain )
end sub

CALLBACK(button_click)
    dim btnTemp as TGtkButton
    btnTemp.Associate( _data_ )
    print "You clicked: " & btnTemp.GetName()
ENDCALLBACK

Main()
