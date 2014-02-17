#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkListView)

    constructor TGtkListView()
        model_ = gtk_list_store_new(1, G_TYPE_STRING)
        id_ = gtk_tree_view_new_with_model( GTK_TREE_MODEL(model_) )
        init()
    end constructor

    property TGtkListView.store() as TGtkListStore
        return TGtkListStore(gtk_tree_view_get_model(GTK_TREE_VIEW(id_)))
    end property

    sub TGtkListView.initWithModel( byval m as TGtkListStore )
        gtk_widget_destroy(id_)
        id_ = gtk_tree_view_new_with_model( GTK_TREE_MODEL(cast(GtkListStore ptr,m)))
        for n as integer = 0 to m.numColumns -1
            var renderer = gtk_cell_renderer_text_new()
            var col = gtk_tree_view_column_new_with_attributes("Column " & n,renderer,"text",n,0)
            gtk_tree_view_append_column(GTK_TREE_VIEW(id_),col)
        next
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

end namespace
