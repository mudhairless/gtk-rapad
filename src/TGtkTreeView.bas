#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkTreeView)

    constructor TGtkTreeView()
        id_ = gtk_tree_view_new()
    end constructor

    property TGtkTreeView.store() as GtkTreeModel ptr
        return gtk_tree_view_get_model(GTK_TREE_VIEW(id_))
    end property

    sub TGtkTreeView.initWithModel( byval m as GtkTreeModel ptr, byval nc as uinteger )
        gtk_tree_view_set_model( GTK_TREE_VIEW(id_),m)
        for n as integer = 0 to nc -1
            var renderer = gtk_cell_renderer_text_new()
            var col = gtk_tree_view_column_new()
            gtk_tree_view_append_column(GTK_TREE_VIEW(id_),col)
        next
        init()
    end sub

    property TGtkTreeView.column( byval i as integer ) as TGtkTreeViewColumn
        return TGtkTreeViewColumn(gtk_tree_view_get_column(GTK_TREE_VIEW(id_),i))
    end property

    operator TGtkTreeView.cast() as GtkWidget ptr
        return id_
    end operator

end namespace
