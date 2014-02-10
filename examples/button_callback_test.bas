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

declare sub btnOk_Click cdecl ( byval __ as any pointer )

'------------+------------+------------+------------+------------+----------'
'   End the General Declarations ( if you speak Visual Basic )
'------------+------------+------------+------------+------------+----------'

sub Main()

    frmMain.SetKeepAbove( false )
    frmMain.SetSize( 400, 100 )
    frmMain.SetTitle( "Simple Window w/ Buttons")

    hPanel.SetParent( frmMain )

    btnClose.SetCaption( "Close Me" )
    btnClose.SetMouseClick( @btnOk_Click() )
    btnClose.SetName( "btnClose" )
    btnClose.SetParent( hPanel )

    btnOk.SetCaption( "Click Here" )
    btnOk.SetMouseClick( @btnOk_Click() )
    btnOk.SetName( "btnOk" )
    btnOk.SetParent( hPanel )

    frmMain.ShowAll()

    GtkApp.Start( frmMain )
end sub

sub btnOk_Click cdecl( byval __ as any pointer )
    dim btnTemp as TGtkButton

    btnTemp.Associate( __ )

    print "You clicked: " & btnTemp.GetName()
end sub

Main()
