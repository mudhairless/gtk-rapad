

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

Declare Sub InitApp()

Declare Sub FromCreate( Title as String )
Declare Sub FromDestroy( byval obj as GtkWidget pointer )

Declare Sub tbToolbar_Button1_OnClick( ByVal Obj As GtkObject Pointer, ByVal user_data As GPointer )
Declare Sub tbToolbar_Button2_OnClick( ByVal Obj As GtkObject Pointer, ByVal user_data As GPointer )

Declare Function FindFreeGtkFormSpace() As uByte


' ----- '


Sub tbToolbar_Button1_OnClick( ByVal Obj As GtkObject Pointer, ByVal user_data As GPointer )
    FromCreate( "Form" )
End Sub

Sub tbToolbar_Button2_OnClick( ByVal Obj As GtkObject Pointer, ByVal user_data As GPointer )
    Print "Event tbToolbar_Button2_OnClick() Raised"
End Sub

function fx() as integer
    dim i as integer

    for i = 1 to 64
        if GtkFormSpace(i).Active = 0 then return i
    next i
end function

sub FormDestroy cdecl( byval objp as any pointer )
    dim f as TGtkWindow
    dim x as integer

    f.associate( objp )

    for x = 1 to 64
        if GtkFormSpace(x).Form.GetName() = f.GetName() then
            'erase GtkFormSpace(x)
            exit for
        end if
    next x
end sub

Sub FromCreate( Title as String )
    dim x as integer

    x = fx()

    with GtkFormSpace(x)
        .Active = 1

        .Form.SetDestroyCallback( @FormDestroy() )
        .Form.SetName( Title + str( x ) )
        .Form.SetTitle( .Form.GetName() )
        .Form.Show()
    end with
End Sub

Sub Main()

    with frmMain
        .SetTitle( "Scribe" )
        .SetSize( 480, 20 )
        .SetName( "frmMain" )
    end with

    hPanel.SetParent( frmMain )

    with tbToolbar_Button1
        .SetCaption( "Form" )
        .SetMouseClick( @tbToolbar_Button1_OnClick() )
        .SetParent( hPanel )
    end with

    with tbToolbar_Button2
        .SetCaption( "Button" )
        .SetMouseClick( @tbToolbar_Button2_OnClick() )
        .SetParent( hPanel )
    end with

    frmMain.ShowAll()
    GtkApp.Start( frmMain )
End Sub


Main()
