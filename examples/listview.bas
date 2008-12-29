'
'   treeview.bas
'
'   Testing for the TreeView/ListBox widgets
'

#include once "gtkrapad/gtkrapad.bi"

using GtkRapad

'Global object variables
dim shared GtkApp as TGtkApplication
dim shared frmMain as TGtkWindow

dim shared btnAC as TGTkButton
dim shared btnAT as TGTkButton

dim shared hPanel as TGtkVBox          'TGtkHBox
dim shared lstTest as TGtkListView     'TGtkListView

'Prototyping each function of our application
declare sub Main()

declare sub AC cdecl ( byval __ as any pointer )
declare sub AT cdecl ( byval __ as any pointer )

'------------+------------+------------+------------+------------+----------'
'   End the General Declarations ( if you speak Visual Basic )
'------------+------------+------------+------------+------------+----------'

sub Main()

    'Main function which will setup
    'the GUI and some system call backs. w00t.

    with frmMain
        .SetTitle( "TGtkListView Example")
        .SetKeepAbove( false )
        .SetSize( 300, 50 )
    end with

    with hPanel
        .SetParent( frmMain )
    end with

    with lstTest
        .SetParent( hPanel )
    end with

    with btnAC
        .SetCaption( "AC()" )
        .SetParent( hPanel )
        .SetMouseClick( @AC() )
    end with

    with btnAT
        .SetCaption( "AT()" )
        .SetParent( hPanel )
        .SetMouseClick( @AT() )
    end with

    frmMain.ShowAll()

    'the start line must be the last line when starting the application.
    'any gui framework will be setup by now, cause after the gtk library
    'has focus, no other lines of code will get called unless by callback.

    GtkApp.Start( frmMain )
end sub

sub AC cdecl ( byval __ as any pointer )
    print "AC()"

    lstTest.AddColumn( "AC()", lstTest.col_count_)

    lstTest.col_count_ = lstTest.col_count_ + 1
end sub

sub AT cdecl ( byval __ as any pointer )
    print "AT()"

    if lstTest.col_count_ > 0 then
        lstTest.AddString( "Line added @ " & time(), lstTest.col_count_ )
    else
        lstTest.AddString( "Line added @ " & time(), 0 )
    end if
end sub


'------------+------------+------------+------------+------------+----------'
'   Invoke the Main() function
'------------+------------+------------+------------+------------+----------'

Main()
