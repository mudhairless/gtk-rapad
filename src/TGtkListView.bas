#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkListView)

    constructor TGtkListView()
        var m = TGtkListStore()
        dim cols(0) as integer
        cols(0) = G_TYPE_STRING
        m.setColumnTypes(cols())
        id_ = gtk_tree_view_new_with_model( GTK_TREE_MODEL(cast(GtkListStore ptr,m)) )
        init()
    end constructor

    property TGtkListView.store() as TGtkListStore
        return TGtkListStore(gtk_tree_view_get_model(GTK_TREE_VIEW(id_)))
    end property

    sub TGtkListView.initWithModel( byval m as TGtkListStore )
        gtk_tree_view_set_model( GTK_TREE_VIEW(id_),GTK_TREE_MODEL(cast(GtkListStore ptr,m)))
        for n as integer = 0 to m.numColumns -1
            var renderer = gtk_cell_renderer_text_new()
            var col = gtk_tree_view_column_new()
            gtk_tree_view_append_column(GTK_TREE_VIEW(id_),col)
        next
    end sub

    property TGtkListView.column( byval i as integer ) as TGtkTreeViewColumn
        return TGtkTreeViewColumn(gtk_tree_view_get_column(GTK_TREE_VIEW(id_),i))
    end property

    operator TGtkListView.cast() as GtkWidget Pointer
        return id_
    end operator

end namespace
