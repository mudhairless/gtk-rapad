#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkTreeViewColumn
        id_ = gtk_tree_view_column_new()
    end constructor

    constructor TGtkTreeViewColumn( byval c as GtkTreeViewColumn ptr )
        id_ = c
    end constructor

    sub TGtkTreeViewColumn.packStart( byval r as GtkCellRenderer ptr, byval e as gboolean )
        gtk_tree_view_column_pack_start(id_,r,e)
    end sub

    sub TGtkTreeViewColumn.packEnd( byval r as GtkCellRenderer ptr, byval e as gboolean )
        gtk_tree_view_column_pack_end(id_,r,e)
    end sub

    sub TGtkTreeViewColumn.clear()
        gtk_tree_view_column_clear(id_)
    end sub

    property TGtkTreeViewColumn.cellRenderers() as GList ptr
        return gtk_tree_view_column_get_cell_renderers(id_)
    end property

    sub TGtkTreeViewColumn.addAttribute( byval r as GtkCellRenderer ptr, _
                                byref attr_ as string, _
                                byval col_n as integer )
        gtk_tree_view_column_add_attribute(id_,r,attr_,col_n)
    end sub

    sub TGtkTreeViewColumn.clearAttributes( byval r as GtkCellRenderer ptr )
        gtk_tree_view_column_clear_attributes(id_,r)
    end sub

    property TGtkTreeViewColumn.spacing() as integer
        return gtk_tree_view_column_get_spacing(id_)
    end property

    property TGtkTreeViewColumn.spacing( byval i as integer )
        gtk_tree_view_column_set_spacing(id_,i)
    end property

    property TGtkTreeViewColumn.visible( byval t as gboolean )
        gtk_tree_view_column_set_visible(id_,t)
    end property

    property TGtkTreeViewColumn.visible() as gboolean
        return gtk_tree_view_column_get_visible(id_)
    end property

    property TGtkTreeViewColumn.resizable() as gboolean
        return gtk_tree_view_column_get_resizable(id_)
    end property

    property TGtkTreeViewColumn.resizable( byval t as gboolean )
        gtk_tree_view_column_set_resizable(id_,t)
    end property

    property TGtkTreeViewColumn.sizing() as GtkTreeViewColumnSizing
        return gtk_tree_view_column_get_sizing(id_)
    end property

    property TGtkTreeViewColumn.sizing( byval t as GtkTreeViewColumnSizing )
        gtk_tree_view_column_set_sizing(id_,t)
    end property

    property TGtkTreeViewColumn.width() as integer
        return gtk_tree_view_column_get_width(id_)
    end property

    property TGtkTreeViewColumn.fixedWidth() as integer
        return gtk_tree_view_column_get_fixed_width(id_)
    end property

    property TGtkTreeViewColumn.fixedWidth( byval i as integer )
        gtk_tree_view_column_set_fixed_width(id_,i)
    end property

    property TGtkTreeViewColumn.minWidth() as integer
        return gtk_tree_view_column_get_min_width(id_)
    end property

    property TGtkTreeViewColumn.minWidth( byval i as integer )
        gtk_tree_view_column_set_min_width(id_,i)
    end property

    property TGtkTreeViewColumn.maxWidth() as integer
        return gtk_tree_view_column_get_max_width(id_)
    end property

    property TGtkTreeViewColumn.maxWidth( byval i as integer )
        gtk_tree_view_column_set_max_width(id_,i)
    end property

    property TGtkTreeViewColumn.title() as string
        return *gtk_tree_view_column_get_title(id_)
    end property

    property TGtkTreeViewColumn.title( byref t as string )
        gtk_tree_view_column_set_title(id_,t)
    end property

    property TGtkTreeViewColumn.expand() as gboolean
        return gtk_tree_view_column_get_expand(id_)
    end property

    property TGtkTreeViewColumn.expand( byval t as gboolean )
        gtk_tree_view_column_set_expand(id_,t)
    end property

    property TGtkTreeViewColumn.clickable() as gboolean
        return gtk_tree_view_column_get_clickable(id_)
    end property

    property TGtkTreeViewColumn.clickable( byval t as gboolean )
        gtk_tree_view_column_set_clickable(id_,t)
    end property

    property TGtkTreeViewColumn.widget() as GtkWidget ptr
        return gtk_tree_view_column_get_widget(id_)
    end property

    property TGtkTreeViewColumn.widget( byval w as GtkWidget ptr )
        gtk_tree_view_column_set_widget(id_,w)
    end property

    property TGtkTreeViewColumn.alignment() as single
        return gtk_tree_view_column_get_alignment(id_)
    end property

    property TGtkTreeViewColumn.alignment( byval xalign as single )
        gtk_tree_view_column_set_alignment(id_,xalign)
    end property

    property TGtkTreeViewColumn.reorderable() as gboolean
        return gtk_tree_view_column_get_reorderable(id_)
    end property

    property TGtkTreeViewColumn.reorderable( byval t as gboolean )
        gtk_tree_view_column_set_reorderable(id_,t)
    end property

    property TGtkTreeViewColumn.sortColumn() as integer
        return gtk_tree_view_column_get_sort_column_id(id_)
    end property

    property TGtkTreeViewColumn.sortColumn( byval i as integer )
        gtk_tree_view_column_set_sort_column_id(id_,i)
    end property

    property TGtkTreeViewColumn.sortIndicator() as gboolean
        return gtk_tree_view_column_get_sort_indicator(id_)
    end property

    property TGtkTreeViewColumn.sortIndicator( byval t as gboolean )
        gtk_tree_view_column_set_sort_indicator(id_,t)
    end property

    property TGtkTreeViewColumn.sortOrder() as GtkSortType
        return gtk_tree_view_column_get_sort_order(id_)
    end property

    property TGtkTreeViewColumn.sortOrder( byval t as GtkSortType )
        gtk_tree_view_column_set_sort_order(id_,t)
    end property

    operator TGtkTreeViewColumn.cast() as GtkTreeViewColumn ptr
        return id_
    end operator

end namespace
