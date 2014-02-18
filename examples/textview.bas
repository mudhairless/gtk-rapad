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

    frmMain.KeepAbove = false 
    frmMain.SetSize( 400, 100 )
    frmMain.Title = "Simple TextView Demo"

    vPanel.SetParent( frmMain )

    txtTextView.SetParent( vPanel )
    txtTextView.Text = "Please type something here..."

    btnOk.label = "Change Font"
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

    txtTextView.Font = x
end sub



Main()
