#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkListView)

    constructor TGtkListView()
        model_ = gtk_list_store_new(N_COL, G_TYPE_STRING)
        id_ = gtk_tree_view_new_with_model( GTK_TREE_MODEL(model_) )
        init()
    end constructor

    sub TGtkListView.setColumnTypes( columns() as integer )
        gtk_widget_destroy(id_)
        model_ = gtk_list_store_newv(ubound(columns)+1,@columns(0))
        id_ = gtk_tree_view_new_with_model( GTK_TREE_MODEL(model_) )
        for n as integer = lbound(columns) to ubound(columns)
            var renderer = gtk_cell_renderer_text_new()
            var col = gtk_tree_view_column_new_with_attributes("Column " & n,renderer,"text",n,0)
            gtk_tree_view_append_column(GTK_TREE_VIEW(id_),col)
        next
        init()
    end sub

    sub TGtkListView.setColumnTitle( byval col_n as integer, byref sText as string )
        var col = gtk_tree_view_get_column(GTK_TREE_VIEW(id_),col_n)
        if col = 0 then
            print "Could not set title"
        else
            gtk_tree_view_column_set_title(col,sText)
        end if
    end sub

    function TGtkListView.getColumnTitle( byval col_n as integer ) as string
        var col = gtk_tree_view_get_column(GTK_TREE_VIEW(id_),col_n)
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

end namespace
