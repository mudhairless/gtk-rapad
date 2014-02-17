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

    property TGtkTreeView.indentationLevel() as integer
        return gtk_tree_view_get_level_indentation(GTK_TREE_VIEW(id_))
    end property

    property TGtkTreeView.indentationLevel( byval i as integer )
        gtk_tree_view_set_level_indentation(GTK_TREE_VIEW(id_),i)
    end property

    property TGtkTreeView.showExpanders() as gboolean
        return gtk_tree_view_get_show_expanders(GTK_TREE_VIEW(id_))
    end property

    property TGtkTreeView.showExpanders( byval t as gboolean )
        gtk_tree_view_set_show_expanders(GTK_TREE_VIEW(id_),t)
    end property

    property TGtkTreeView.headersVisible() as gboolean
        return gtk_tree_view_get_headers_visible(GTK_TREE_VIEW(id_))
    end property

    property TGtkTreeView.headersVisible( byval t as gboolean )
        gtk_tree_view_set_headers_visible(GTK_TREE_VIEW(id_),t)
    end property

    sub TGtkTreeView.autosizeColumns()
        gtk_tree_view_columns_autosize(GTK_TREE_VIEW(id_))
    end sub

    property TGtkTreeView.headersClickable() as gboolean
        return gtk_tree_view_get_headers_clickable(GTK_TREE_VIEW(id_))
    end property

    property TGtkTreeView.headersClickable( byval t as gboolean )
        gtk_tree_view_set_headers_clickable(GTK_TREE_VIEW(id_),t)
    end property

    property TGtkTreeView.alternateRowsHint() as gboolean
        return gtk_tree_view_get_rules_hint(GTK_TREE_VIEW(id_))
    end property

    property TGtkTreeView.alternateRowsHint( byval t as gboolean )
        gtk_tree_view_set_rules_hint(GTK_TREE_VIEW(id_),t)
    end property

    sub TGtkTreeView.expandAll()
        gtk_tree_view_expand_all(GTK_TREE_VIEW(id_))
    end sub

    sub TGtkTreeView.collapseAll()
        gtk_tree_view_collapse_all(GTK_TREE_VIEW(id_))
    end sub

    property TGtkTreeView.enableSearch() as gboolean
        return gtk_tree_view_get_enable_search(GTK_TREE_VIEW(id_))
    end property

    property TGtkTreeView.enableSearch( byval t as gboolean )
        gtk_tree_view_set_enable_search(GTK_TREE_VIEW(id_),t)
    end property

    property TGtkTreeView.searchColumn() as integer
        return gtk_tree_view_get_search_column(GTK_TREE_VIEW(id_))
    end property

    property TGtkTreeView.searchColumn( byval i as integer )
        gtk_tree_view_set_search_column(GTK_TREE_VIEW(id_),i)
    end property

    property TGtkTreeView.searchEntry() as TGtkEntry
        return TGtkEntry(gtk_tree_view_get_search_entry(GTK_TREE_VIEW(id_)))
    end property

    property TGtkTreeView.searchEntry( byval i as TGtkEntry )
        gtk_tree_view_set_search_entry(GTK_TREE_VIEW(id_),GTK_ENTRY(cast(GtkWidget ptr,i)))
    end property

    property TGtkTreeView.fixedHeightMode() as gboolean
        return gtk_tree_view_get_fixed_height_mode(GTK_TREE_VIEW(id_))
    end property

    property TGtkTreeView.fixedHeightMode( byval t as gboolean )
        gtk_tree_view_set_fixed_height_mode(GTK_TREE_VIEW(id_),t)
    end property

    property TGtkTreeView.hoverSelection() as gboolean
        return gtk_tree_view_get_hover_selection(GTK_TREE_VIEW(id_))
    end property

    property TGtkTreeView.hoverSelection( byval t as gboolean )
        gtk_tree_view_set_hover_selection(GTK_TREE_VIEW(id_),t)
    end property

    property TGtkTreeView.hoverExpand() as gboolean
        return gtk_tree_view_get_hover_expand(GTK_TREE_VIEW(id_))
    end property

    property TGtkTreeView.hoverExpand( byval t as gboolean )
        gtk_tree_view_set_hover_expand(GTK_TREE_VIEW(id_),t)
    end property

    property TGtkTreeView.rubberBanding() as gboolean
        return gtk_tree_view_get_rubber_banding(GTK_TREE_VIEW(id_))
    end property

    property TGtkTreeView.rubberBanding( byval t as gboolean )
        gtk_tree_view_set_rubber_banding(GTK_TREE_VIEW(id_),t)
    end property

    property TGtkTreeView.treeLines() as gboolean
        return gtk_tree_view_get_enable_tree_lines(GTK_TREE_VIEW(id_))
    end property

    property TGtkTreeView.treeLines( byval t as gboolean )
        gtk_tree_view_set_enable_tree_lines(GTK_TREE_VIEW(id_),t)
    end property

    property TGtkTreeView.gridLines() as GtkTreeViewGridLines
        return gtk_tree_view_get_grid_lines(GTK_TREE_VIEW(id_))
    end property

    property TGtkTreeView.gridLines( byval t as GtkTreeViewGridLines )
        gtk_tree_view_set_grid_lines(GTK_TREE_VIEW(id_),t)
    end property

    property TGtkTreeView.tooltipColumn() as integer
        return gtk_tree_view_get_tooltip_column(GTK_TREE_VIEW(id_))
    end property

    property TGtkTreeView.tooltipColumn( byval i as integer )
        gtk_tree_view_set_tooltip_column(GTK_TREE_VIEW(id_),i)
    end property

end namespace
