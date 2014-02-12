#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkListView()
        model_ = gtk_list_store_new(N_COL, G_TYPE_STRING)
        id_ = gtk_tree_view_new_with_model( model_ )
        gtype_ = GetGtkWidgetType( id_ )
        objname_ = str( (gtype_ & "-" & id_) )
        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end constructor

    sub TGtkListView.setColumnTypes( columns() as integer )
        gtk_widget_destroy(id_)
        model_ = gtk_list_store_newv(ubound(columns)+1,@columns(0))
        id_ = gtk_tree_view_new_with_model( model_ )
        for n as integer = lbound(columns) to ubound(columns)
            var renderer = gtk_cell_renderer_text_new()
            var col = gtk_tree_view_column_new_with_attributes("Column " & n,renderer,"text",n,0)
            gtk_tree_view_append_column(id_,col)
        next
        gtype_ = GetGtkWidgetType( id_ )
        objname_ = str( (gtype_ & "-" & id_) )
        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end sub

    sub TGtkListView.setColumnTitle( byval col_n as integer, byref sText as string )
        var col = gtk_tree_view_get_column(id_,col_n)
        if col = 0 then
            print "Could not set title"
        else
            gtk_tree_view_column_set_title(col,sText)
        end if
    end sub

    function TGtkListView.getColumnTitle( byval col_n as integer ) as string
        var col = gtk_tree_view_get_column(id_,col_n)
        dim ret as string
        ret = *gtk_tree_view_column_get_title(col)
        return ret
    end function

    operator TGtkListView.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkListView.appendRow( )
        gtk_list_store_append (model_, @iter_)
    end sub

    sub TGtkListView.AddString( byval sText as string, byval col_n as integer )
        gtk_list_store_set (model_, @iter_, col_n, sText, -1)
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

    sub TGtkListView.SetName( byref newName as string )
        objname_ = newName
        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end sub

    function TGtkListView.GetName() as string
        dim p as string pointer
        dim s as string

        p = g_object_get_data( G_OBJECT( id_ ), "rapad.name" )
        s = *p

        return s
    end function

    sub TGtkListView.SetParent( byval p as GtkWidget Pointer )
        parent_ = p
        gtk_container_add( GTK_CONTAINER(parent_), GTK_WIDGET(id_) )
    end sub

    function TGtkListView.GetParent() as GtkWidget Pointer
        return parent_
    end function

    '-----------------------------------------------
end namespace
