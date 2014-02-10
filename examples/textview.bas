'
'   textview.bas
'
'   I simple textview demo
'

#include once "gtkrapad/gtkrapad.bi"

using GtkRapad

'Global object variables

dim shared GtkApp as TGtkApplication

dim shared frmMain as TGtkWindow
dim shared vPanel as TGtkVBox
dim shared txtTextView as TGtkTextView
dim shared btnOk as TGtkButton

'Prototyping each function of our application

declare sub Main()
declare sub btnOk_Click cdecl ( byval __ as any pointer )

' ---------------------


sub Main()

    frmMain.SetKeepAbove( false )
    frmMain.SetSize( 400, 100 )
    frmMain.SetTitle( "Simple TextView Demo")

    vPanel.SetParent( frmMain )

    txtTextView.SetParent( vPanel )
    txtTextView.SetText("Please type something here...")

    btnOk.SetCaption( "Change Font" )
    btnOk.SetMouseClick( @btnOk_Click() )
    btnOk.SetName( "btnOk" )
    btnOk.SetParent( vPanel )

    frmMain.ShowAll()

    GtkApp.Start( frmMain )
end sub


sub btnOk_Click cdecl( byval __ as any pointer )
    dim x as string

    x = GtkApp.SelectFont()

    print x

    txtTextView.SetFont( x )
end sub



Main()
