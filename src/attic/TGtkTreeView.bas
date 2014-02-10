#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkTreeView( )
        'store_ = gtk_list_store_new (NUM_COLS, G_TYPE_STRING, G_TYPE_UINT);
        'store_ = gtk_list_store_newv (3, *({ G_TYPE_STRING, G_TYPE_STRING, G_TYPE_UINT }) );

        id_ = gtk_tree_view_new()
        gtype_ = GetGtkWidgetType( id_ )
    end constructor

    operator TGtkTreeView.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkTreeView.Test()
        store_ = gtk_list_store_new(0)

    end sub


    sub TGtkTreeView.Associate( byval p as GtkWidget pointer )
        'Will assign a new pointer for this class to reference so long
        'as the pointer type is appropriate for this class.

        if ( GetGtkWidgetType( p ) = gtype_ ) then
            id_ = p
        else
            RuntimeError( "Associate() failed - pointer type mismatch" )
        end if
    end sub

    sub TGtkTreeView.Show()
        gtk_widget_show( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkTreeView.Hide()
        gtk_widget_hide( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkTreeView.ShowAll()
        gtk_widget_show_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkTreeView.HideAll()
        gtk_widget_hide_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkTreeView.Destroy()
        gtk_widget_destroy( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkTreeView.SetParent( byval p as GtkWidget Pointer )
        parent_ = p
        gtk_container_add( GTK_CONTAINER(parent_), GTK_WIDGET(id_) )
    end sub

    function TGtkTreeView.GetParent() as GtkWidget Pointer
        return parent_
    end function

    '-----------------------------------------------
end namespace
