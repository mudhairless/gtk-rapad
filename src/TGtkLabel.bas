#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkLabel()
        id_ = gtk_label_new( "" )
        gtype_ = GetGtkWidgetType( id_ )
        objname_ = str( (gtype_ & "-" & id_) )


        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end constructor

    constructor TGtkLabel( byref contents as string )
        id_ = gtk_label_new( contents )
        gtype_ = GetGtkWidgetType( id_ )
    end constructor

    operator TGtkLabel.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkLabel.Associate( byval p as GtkWidget pointer )
        'Will assign a new pointer for this class to reference so long
        'as the pointer type is appropriate for this class.

        if ( GetGtkWidgetType( p ) = gtype_ ) then
            g_free( id_ )
            id_ = p
        else
            RuntimeError( "Associate() failed - pointer type mismatch" )
        end if
    end sub

    sub TGtkLabel.Show()
        gtk_widget_show( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkLabel.Hide()
        gtk_widget_hide( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkLabel.ShowAll()
        gtk_widget_show_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkLabel.HideAll()
        gtk_widget_hide_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkLabel.Destroy()
        gtk_widget_destroy( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkLabel.SetName( byref newName as string )
        objname_ = newName
        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end sub

    function TGtkLabel.GetName() as string
        dim p as string pointer
        dim s as string

        p = g_object_get_data( G_OBJECT( id_ ), "rapad.name" )
        s = *p

        return s
    end function

    sub TGtkLabel.SetParent( byval p as GtkWidget Pointer )
        parent_ = p
        gtk_container_add( GTK_CONTAINER(parent_), GTK_WIDGET(id_) )
    end sub

    function TGtkLabel.GetParent() as GtkWidget Pointer
        return parent_
    end function

    '-----------------------------------------------


    sub TGtkLabel.SetText( byref contents as string )
        gtk_label_set_text( GTK_LABEL(id_), contents )
    end sub

    function TGtkLabel.GetText( ) as string
        return *(gtk_label_get_text( GTK_LABEL(id_) ))
    end function

end namespace
