

#include once "gtkrapad/gtkrapad.bi"

using GtkRapad

type TGtkFormSpace
    Form as TGtkWindow
    Active as ubyte
end type

dim shared GtkApp                   as TGtkApplication
dim shared GtkFormSpace(1 To 64)    as TGtkFormSpace

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

Function FindFreeGtkFormSpace() As ubyte
    Dim I As uByte

    For I = 1 to 64
        If ( GtkFormSpace( I ).Active = 0 ) Then
            Return I
        End If
    Next I

    'zero is returned if there are no more form spaces
    Return 0
End Function

'sub FormDestroy( obj as gtkwidget pointer )
sub FormDestroy cdecl( byval obj as any pointer )
    'dim i as ubyte
    dim f as tgtkwindow

    f.associate( obj )

    print "FormDestroy() Called on " & f.getname()

    gtk_widget_destroy( obj )
end sub

Sub FromCreate( Title as String )
    Dim I as uByte
    Dim F As TGtkWindow

    I = FindFreeGtkFormSpace()
    If ( I = 0 ) Then
        Return
    End If

    with GtkFormSpace( I )
        .Form.SetDestroyCallback( @FormDestroy() )
        .Form.SetName( Title + str( I ) )
        .Form.SetTitle( .Form.GetName() )
        .Form.Show()
    end with

    GtkFormSpace(I).Active = 1
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
