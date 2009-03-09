
'
'   rED.bas
'
'   Simple text editor, like notepad
'

#include once "gtkrapad/gtkrapad.bi"

using GtkRapad

'Global object variables

dim shared GtkApp               as TGtkApplication

dim shared frmMain              as TGtkWindow
dim shared vPanel               as TGtkVBox
dim shared txtTextView          as TGtkTextView
dim shared btnOk                as TGtkButton

dim shared mnuRapadBar          as TGtkRapadBar

dim shared G_FILENAME           as string

'Prototyping each function of our application

declare sub Main()
declare sub btnOk_Click cdecl ( byval __ as any pointer )

declare function ReadFile( byval file_ as string ) as string
declare sub WriteFile( byval file_ as string, byval data_ as string )

declare sub mnuMainFileNew_Click cdecl( byval __ as any pointer)
declare sub mnuMainFileOpen_Click cdecl( byval __ as any pointer)
declare sub mnuMainFileSave_Click cdecl( byval __ as any pointer)
declare sub mnuMainFileSaveAs_Click cdecl( byval __ as any pointer)
declare sub mnuMainFileExit_Click cdecl( byval __ as any pointer)

'--------------------------------------------------------------------

sub Main()

    GtkApp.SetName( "rED" )

    frmMain.SetKeepAbove( false )
    frmMain.SetSize( 500, 500 )
    frmMain.SetTitle( GtkApp.GetName() & " :: []")

    vPanel.SetParent( frmMain )

    vPanel.AddChild( mnuRapadBar, false, false, 0 )
    vPanel.AddChild( txtTextView, true, true, 0 )
    vPanel.AddChild( btnOk, false, false, 0 )

    mnuRapadBar.CreateMenu( "mnuFile", "_File" )
    mnuRapadBar.CreateMenuChild( "mnuFile", "mnuFileNew", "_New", null )

    print mnuRapadBar.GetName()

    txtTextView.SetText("")

    btnOk.SetCaption( "Change Font" )
    btnOk.SetMouseClick( @btnOk_Click() )
    btnOk.SetName( "btnOk" )

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
    dim fn as string

    fn = GtkApp.FileOpen()

    if ( not ( fn = "" ) ) then
        G_FILENAME = fn
        txtTextView.SetText( ReadFile( G_FILENAME ) )
    end if

    frmMain.SetTitle( GtkApp.GetName() & " :: [" & G_FILENAME & "]" )
end sub


sub mnuMainFileSave_Click cdecl( byval __ as any pointer)
    if (G_FILENAME = "") then
        mnuMainFileSaveAs_Click( 0 )
    else
        WriteFile( G_FILENAME, txtTextView.GetText() )
    end if

    frmMain.SetTitle( GtkApp.GetName() & " :: [" & G_FILENAME & "]" )
end sub


sub mnuMainFileSaveAs_Click cdecl( byval __ as any pointer)
    dim fn as string

    fn = GtkApp.FileSave( , , G_FILENAME )

    if ( not ( fn = "" ) ) then
        G_FILENAME = fn
        frmMain.SetTitle( GtkApp.GetName() & " :: [" & G_FILENAME & "]" )
        mnuMainFileSave_Click( 0 )
    end if
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


sub WriteFile( byval file_ as string, byval data_ as string )
    dim f as integer

    f = freefile()

    open file_ for output as #f
        print #f, data_
    close #f
end sub


Main()
