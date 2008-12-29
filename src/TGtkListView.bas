#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkListView()
        model_ = gtk_list_store_new(N_COL, G_TYPE_STRING)
        id_ = gtk_tree_view_new_with_model( model_ )
        gtype_ = GetGtkWidgetType( id_ )
    end constructor

    operator TGtkListView.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkListView.AddString( byval sText as string, byval col_n as integer )
        gtk_list_store_append (model_, @iter_)
        gtk_list_store_set (model_, @iter_, COLUMN_SINGLE, sText, -1)
    end sub

    sub TGtkListView.AddColumn( byval sTitle as string, byval col_n as integer )
        dim renderer as GtkCellRenderer pointer
        dim column as GtkTreeViewColumn pointer

        renderer = gtk_cell_renderer_text_new()
        column = gtk_tree_view_column_new_with_attributes( sTitle & " " & col_n, renderer, "text", col_n, 0)
        gtk_tree_view_append_column ( id_, column )
    end sub

    sub TGtkListView.Associate( byval p as GtkWidget pointer )
        'Will assign a new pointer for this class to reference so long
        'as the pointer type is appropriate for this class.

        if ( GetGtkWidgetType( p ) = gtype_ ) then
            id_ = p
        else
            RuntimeError( "Associate() failed - pointer type mismatch" )
        end if
    end sub

    sub TGtkListView.Show()
        gtk_widget_show( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkListView.Hide()
        gtk_widget_hide( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkListView.ShowAll()
        gtk_widget_show_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkListView.HideAll()
        gtk_widget_hide_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkListView.Destroy()
        gtk_widget_destroy( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkListView.SetParent( byval p as GtkWidget Pointer )
        parent_ = p
        gtk_container_add( GTK_CONTAINER(parent_), GTK_WIDGET(id_) )
    end sub

    function TGtkListView.GetParent() as GtkWidget Pointer
        return parent_
    end function

    '-----------------------------------------------
end namespace
