'
'   simple_demo.bas
'
'   This is the test application I use to test and debug the library.
'

#include once "gtkrapad/gtkrapad.bi"

using GtkRapad

'Global object variables
dim shared GtkApp as TGtkApplication
dim shared frmMain as TGtkWindow
dim shared hPanel as TGtkHBox
dim shared btnOk as TGtkButton

'Prototyping each function of our application
declare sub Main()
declare sub btnOk_Click cdecl ( byval __ as any pointer )

'------------+------------+------------+------------+------------+----------'
'   End the General Declarations ( if you speak Visual Basic )
'------------+------------+------------+------------+------------+----------'

sub Main()
    frmMain.SetTitle( "Simple Window w/ Button")
    frmMain.SetKeepAbove( false )
    frmMain.SetSize( 400, 100 )

    hPanel.SetParent( frmMain )

    btnOk.SetName( "btnOk" )
    btnOk.SetCaption( "Click Here!" )
    btnOk.SetMouseClick( @btnOk_Click() )
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
