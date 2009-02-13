'
'   Concept testing
'

#include once "gtkrapad/gtkrapad.bi"

using GtkRapad

type TGtkFormSpace
    Form as TGtkWindow
    Active as ubyte
end type

dim shared GtkApp                   as TGtkApplication
dim shared GtkFormSpace(1 to 64)    as TGtkFormSpace

dim shared frmMain                  as TGtkWindow

dim shared hPanel                   as TGtkHBox

dim shared tbToolbar_Button1        as TGtkButton
dim shared tbToolbar_Button2        as TGtkButton

dim shared GScreen                  as TGdkScreen


' ----- '


declare sub Main()

declare sub FromCreate cdecl ( byval title as string )
declare sub FromDestroy cdecl ( byval obj as any pointer )

declare sub tbToolbar_Button1_OnClick cdecl ( byval objp as any pointer )
declare sub tbToolbar_Button2_OnClick cdecl ( byval objp as any pointer )

declare function fx() as ubyte


' ----- '


sub tbToolbar_Button1_OnClick cdecl ( byval objp as any pointer )
    FromCreate( "Form" )
end sub

sub tbToolbar_Button2_OnClick cdecl ( byval objp as any pointer )
    Print "Event tbToolbar_Button2_OnClick() Raised"
end sub

function fx() as ubyte
    dim i as integer

    for i = 1 to 64
        if GtkFormSpace(i).Active = 0 then return i
    next i
end function

sub FormDestroy cdecl ( byval objp as any pointer )
    dim f as TGtkWindow
    dim b as TGtkFormSpace
    dim x as integer

    f.associate( objp )

    for x = 1 to 64
        if lcase(GtkFormSpace(x).Form.GetName()) = lcase(f.GetName()) then
            GtkFormSpace(x) = b 're-initialize (erase) this space
            return
        end if
    next x
end sub

sub FromCreate cdecl ( byval Title as string )
    dim x as ubyte

    x = fx()

    with GtkFormSpace(x)
        .Active = 1

        .Form.SetDestroyCallback( @FormDestroy() )
        .Form.SetName( Title + str( x ) )
        .Form.SetTitle( .Form.GetName() )
        .Form.Show()
    end with
end sub

sub Main()

    with frmMain
        .SetKeepAbove( true )
        .SetName( "frmMain" )
        .SetTitle( "Scribe" )

        .Move( 0, 0 )
        .SetSize( GScreen.GetWidth(), 32 )
    end with

    hPanel.SetParent( frmMain )

    with tbToolbar_Button1
        .SetCaption( "Create Form" )
        .SetMouseClick( @tbToolbar_Button1_OnClick() )
        .SetParent( hPanel )
    end with

    with tbToolbar_Button2
        .SetCaption( "(future) Create Button" )
        .SetMouseClick( @tbToolbar_Button2_OnClick() )
        .SetParent( hPanel )
    end with

    frmMain.ShowAll()
    GtkApp.Start( frmMain )
end sub


Main()
