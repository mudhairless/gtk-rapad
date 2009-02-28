'
'   textview.bas
'
'   I simple textview demo
'

#include once "gtkrapad/gtkrapad.bi"

using GtkRapad

'Global object variables

dim shared GtkApp           as TGtkApplication

dim shared frmMain          as TGtkWindow
dim shared vPanel           as TGtkVBox
dim shared txtTextView      as TGtkTextView
dim shared btnOk            as TGtkButton

dim shared mnuMenuBar       as TGtkMenuBar
dim shared mnuMenuBox       as TGtkVBox
dim shared mnuMainFile      as TGtkMenu
dim shared mnuMainFileNew   as TGtkMenuItem
dim shared mnuMainFileOpen  as TGtkMenuItem
dim shared mnuMainFileSave  as TGtkMenuItem
dim shared mnuMainFileExit  as TGtkMenuItem

dim shared G_FILENAME       as string

'Prototyping each function of our application

declare sub Main()
declare sub btnOk_Click cdecl ( byval __ as any pointer )

declare function ReadFile( byval file_ as string ) as string

declare sub mnuMainFileNew_Click cdecl( byval __ as any pointer)
declare sub mnuMainFileOpen_Click cdecl( byval __ as any pointer)
declare sub mnuMainFileSave_Click cdecl( byval __ as any pointer)
declare sub mnuMainFileExit_Click cdecl( byval __ as any pointer)

'--------------------------------------------------------------------

sub Main()

    GtkApp.SetName( "FreeED" )

    frmMain.SetKeepAbove( false )
    frmMain.SetSize( 400, 100 )
    frmMain.SetTitle( GtkApp.GetName() & " :: []")

    mnuMainFileNew.SetLabel( "_New" )
    mnuMainFileOpen.SetLabel( "_Open ..." )
    mnuMainFileSave.SetLabel( "_Save ..." )
    mnuMainFileExit.SetLabel( "E_xit" )

    mnuMainFileNew.Activate( @mnuMainFileNew_Click(), 0 )
    mnuMainFileOpen.Activate( @mnuMainFileOpen_Click(), 0 )
    mnuMainFileSave.Activate( @mnuMainFileSave_Click(), 0 )
    mnuMainFileExit.Activate( @mnuMainFileExit_Click(), 0 )

    mnuMainFile.AddChild( mnuMainFileNew )
    mnuMainFile.AddChild( mnuMainFileOpen )
    mnuMainFile.AddChild( mnuMainFileSave )
    mnuMainFile.AddChild( mnuMainFileExit )

    vPanel.SetParent( frmMain )

    vPanel.AppendChild( mnuMenuBox, false, false, 0 )
    vPanel.AppendChild( txtTextView, true, true, 0 )
    vPanel.AppendChild( btnOk, false, false, 0 )

    'mnuMenuBox.SetParent( vPanel )

    mnuMenuBar.SetParent( mnuMenuBox )

    mnuMenuBar.AddMenu( "_File", mnuMainFile )

    'txtTextView.SetParent( vPanel )
    txtTextView.SetText("")

    btnOk.SetCaption( "Change Font" )
    btnOk.SetMouseClick( @btnOk_Click() )
    btnOk.SetName( "btnOk" )

    'btnOk.SetParent( vPanel )

    frmMain.ShowAll()

    GtkApp.Start( frmMain )
end sub


sub btnOk_Click cdecl( byval __ as any pointer )
    dim x as string

    x = GtkApp.SelectFont()

    txtTextView.SetFont( x )
end sub

sub mnuMainFileNew_Click cdecl( byval __ as any pointer)
    G_FILENAME = "newfile"
    txtTextView.SetText( "" )
end sub

sub mnuMainFileOpen_Click cdecl( byval __ as any pointer)
    dim f as string

    f = GtkApp.FileOpen()

    if ( not ( f = "" ) ) then
        G_FILENAME = f
        frmMain.SetTitle( GtkApp.GetName() & " :: [" & G_FILENAME & "]" )
        txtTextView.SetText( ReadFile( G_FILENAME ) )
    end if
end sub

sub mnuMainFileSave_Click cdecl( byval __ as any pointer)
end sub

sub mnuMainFileExit_Click cdecl( byval __ as any pointer)
    GtkApp.Quit()
end sub


function ReadFile( byval file_ as string ) as string
    dim f as integer
    dim r as string
    dim s as string

    f = freefile()

    open file_ for input as #f
        do
            line input #f, s
            r = r & s & !"\n"
        loop until eof(f)
    close #1

    return r
end function


Main()
