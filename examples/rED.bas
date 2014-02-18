'
'   rED.bas
'
'   Simple text editor, like notepad
'

#include once "gtkrapad/gtkrapad.bi"

using GtkRapad

'Global object variables
dim shared GtkApp as TGtkApplication
dim shared frmMain              as TGtkWindow
dim shared vPanel               as TGtkVBox
dim shared txtTextView          as TGtkSourceView
dim shared langManager          as TGtkSourceLanguageManager
dim shared btnOk                as TGtkButton

dim shared mnuMenuBox           as TGtkVBox
dim shared mnuMenuBar           as TGtkMenuBar
dim shared mnuMainFile          as TGtkMenu
dim shared mnuMainFileNew       as TGtkMenuItem
dim shared mnuMainFileOpen      as TGtkMenuItem
dim shared mnuMainFileSave      as TGtkMenuItem
dim shared mnuMainFileSaveAs    as TGtkMenuItem
dim shared mnuMainFileExit      as TGtkMenuItem

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

    frmMain.KeepAbove = false 
    frmMain.SetSize( 500, 500 )
    frmMain.Title = GtkApp.GetName() & " :: []"

    mnuMainFileNew.Label = "_New"
    mnuMainFileOpen.Label = "_Open ..."
    mnuMainFileSave.Label = "_Save"
    mnuMainFileSaveAs.Label = "Save _As ..."
    mnuMainFileExit.Label = "E_xit"

    mnuMainFileNew.Activate( @mnuMainFileNew_Click() )
    mnuMainFileOpen.Activate( @mnuMainFileOpen_Click() )
    mnuMainFileSave.Activate( @mnuMainFileSave_Click() )
    mnuMainFileSaveAs.Activate( @mnuMainFileSaveAs_Click() )
    mnuMainFileExit.Activate( @mnuMainFileExit_Click() )

    mnuMainFile.AddChild( mnuMainFileNew )
    mnuMainFile.AddChild( mnuMainFileOpen )
    mnuMainFile.AddChild( mnuMainFileSave )
    mnuMainFile.AddChild( mnuMainFileSaveAs )
    mnuMainFile.AddChild( mnuMainFileExit )

    vPanel.SetParent( frmMain )

    vPanel.AddChild( mnuMenuBox, false, false, 0 )
    vPanel.AddChild( txtTextView, true, true, 0 )
    vPanel.AddChild( btnOk, false, false, 0 )

    mnuMenuBar.SetParent( mnuMenuBox )

    mnuMenuBar.AddMenu( "_File", mnuMainFile )

    'with mnuMenuBar
        '.AddMenuMain( "mnuFile", "_File" )
        '.AddMenuSub( "mnuFile", "mnuFileNew", "_New", @mnuMainFileNew_Click() )
    'end with

    with txtTextView
        .Text = ""
        .showLineNumbers = true
    end with

    btnOk.label = "Change Font"
    btnOk.SetMouseClick( @btnOk_Click() )
    btnOk.SetName( "btnOk" )

    frmMain.ShowAll()

    GtkApp.Start( frmMain )
end sub


sub btnOk_Click cdecl( byval __ as any pointer )
    dim x as string

    x = GtkApp.SelectFont()

    txtTextView.Font = x
end sub


sub mnuMainFileNew_Click cdecl( byval __ as any pointer)
    G_FILENAME = "newfile"
    txtTextView.Text = ""
end sub


sub mnuMainFileOpen_Click cdecl( byval __ as any pointer)
    dim fn as string

    fn = GtkApp.FileOpen()

    if ( not ( fn = "" ) ) then
        G_FILENAME = fn
        var l = langManager.guessLanguage(fn,"")
        (txtTextView.buffer).language = l
        (txtTextView.buffer).highlightSyntax = true
        txtTextView.Text = ReadFile( G_FILENAME )
    end if

    frmMain.Title = GtkApp.GetName() & " :: [" & G_FILENAME & "]"
end sub


sub mnuMainFileSave_Click cdecl( byval __ as any pointer)
    if (G_FILENAME = "") then
        mnuMainFileSaveAs_Click( 0 )
    else
        var l = langManager.guessLanguage(G_FILENAME)
        with txtTextView.buffer
            .language = l
            .highlightSyntax = true
        end with
        WriteFile( G_FILENAME, txtTextView.Text )
    end if

    frmMain.Title = GtkApp.GetName() & " :: [" & G_FILENAME & "]"
end sub


sub mnuMainFileSaveAs_Click cdecl( byval __ as any pointer)
    dim fn as string

    fn = GtkApp.FileSave( , , G_FILENAME )

    if ( not ( fn = "" ) ) then
        G_FILENAME = fn
        frmMain.Title = GtkApp.GetName() & " :: [" & G_FILENAME & "]"
        mnuMainFileSave_Click( 0 )
        var l = langManager.guessLanguage(G_FILENAME)
        with txtTextView.buffer
            .language = l
            .highlightSyntax = true
        end with
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
