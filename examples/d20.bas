

'
'   radio_example.bas
'
'   functional radio buttons, however they are still kind of clumsy.
'

#include once "gtkrapad/gtkrapad.bi"

using GtkRapad

'Global object variables
dim shared GtkApp as TGtkApplication
dim shared frmMain as TGtkWindow
dim shared cmdRoll as TGtkButton
dim shared hPanel as TGtkVBox 'TGtkHBox

'Prototyping each function of our application
declare sub Main()

declare sub Roll cdecl ( byval __ as any pointer )

'------------+------------+------------+------------+------------+----------'
'   End the General Declarations ( if you speak Visual Basic )
'------------+------------+------------+------------+------------+----------'

sub Main()

    'Main function which will setup
    'the GUI and some system call backs. w00t.

    with frmMain
        .SetTitle( "D20 Roller" )
        .SetKeepAbove( false )
        .SetSize( 300, 50 )
    end with

    with hPanel
        .SetParent( frmMain )
    end with


    with cmdRoll
        .SetCaption("Roll!")
        .SetMouseClick( @Roll() )
        .SetParent( hPanel )
    end with

    frmMain.ShowAll()

    'the start line must be the last line when starting the application.
    'any gui framework be setup by now, cause after the gtk library has
    'focus, no other lines of code will get called unless by callback.

    GtkApp.Start( frmMain )
end sub


sub Roll cdecl ( byval __ as any pointer )

    print "Test!"

end sub

'------------+------------+------------+------------+------------+----------'
'   Invoke the Main() function
'------------+------------+------------+------------+------------+----------'

Main()
