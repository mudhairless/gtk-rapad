#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkHBox( )
        id_ = gtk_hbox_new( 0, 0 )
        gtype_ = GetGtkWidgetType( id_ )
    end constructor

    constructor TGtkHBox( byval homog as gboolean, byval spacing_ as integer )
        id_ = gtk_hbox_new( homog, spacing_ )
        gtype_ = GetGtkWidgetType( id_ )
    end constructor

    operator TGtkHBox.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkHBox.Associate( byval p as GtkWidget pointer )
        'Will assign a new pointer for this class to reference so long
        'as the pointer type is appropriate for this class.

        if ( GetGtkWidgetType( p ) = gtype_ ) then
            id_ = p
        else
            RuntimeError( "Associate() failed - pointer type mismatch" )
        end if
    end sub

    sub TGtkHBox.Show()
        gtk_widget_show( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkHBox.Hide()
        gtk_widget_hide( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkHBox.ShowAll()
        gtk_widget_show_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkHBox.HideAll()
        gtk_widget_hide_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkHBox.Destroy()
        gtk_widget_destroy( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkHBox.SetParent( byval p as GtkWidget Pointer )
        parent_ = p
        gtk_container_add( GTK_CONTAINER(parent_), GTK_WIDGET(id_) )
    end sub

    function TGtkHBox.GetParent() as GtkWidget Pointer
        return parent_
    end function

    '-----------------------------------------------
end namespace
