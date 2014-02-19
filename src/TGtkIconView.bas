#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkIconView)

    sub TGtkIconView.freeSelectedItemList( byval l as GList ptr )
        g_list_foreach(l,cast(GFunc,@gtk_tree_path_free),0)
        g_list_free(l)
    end sub

    constructor TGtkIconView
        id_ = gtk_icon_view_new()
        init()
    end constructor

    constructor TGtkIconView( byval i as GtkTreeModel ptr )
        id_ = gtk_icon_view_new_with_model(i)
        init()
    end constructor

    operator TGtkIconView.cast() as GtkWidget ptr
        return id_
    end operator

    property TGtkIconView.model() as GtkTreeModel ptr
        return gtk_icon_view_get_model(GTK_ICON_VIEW(id_))
    end property

    property TGtkIconView.model( byval i as GtkTreeModel ptr )
        gtk_icon_view_set_model(GTK_ICON_VIEW(id_),i)
    end property

    property TGtkIconView.textColumn() as integer
        return gtk_icon_view_get_text_column(GTK_ICON_VIEW(id_))
    end property

    property TGtkIconView.textColumn( byval i as integer )
        gtk_icon_view_set_text_column(GTK_ICON_VIEW(id_),i)
    end property

    property TGtkIconView.markupColumn() as integer
        return gtk_icon_view_get_markup_column(GTK_ICON_VIEW(id_))
    end property

    property TGtkIconView.markupColumn( byval i as integer )
        gtk_icon_view_set_markup_column(GTK_ICON_VIEW(id_),i)
    end property

    property TGtkIconView.pixbufColumn() as integer
        return gtk_icon_view_get_pixbuf_column(GTK_ICON_VIEW(id_))
    end property

    property TGtkIconView.pixbufColumn( byval i as integer )
        gtk_icon_view_set_pixbuf_column(GTK_ICON_VIEW(id_),i)
    end property

    property TGtkIconView.tooltipColumn() as integer
        return gtk_icon_view_get_tooltip_column(GTK_ICON_VIEW(id_))
    end property

    property TGtkIconView.tooltipColumn( byval i as integer )
        gtk_icon_view_set_tooltip_column(GTK_ICON_VIEW(id_),i)
    end property

    property TGtkIconView.selectedItems() as GList ptr
        return gtk_icon_view_get_selected_items(GTK_ICON_VIEW(id_))
    end property

    property TGtkIconView.itemOrientation() as GtkOrientation
        return gtk_icon_view_get_item_orientation(GTK_ICON_VIEW(id_))
    end property

    property TGtkIconView.itemOrientation( byval i as GtkOrientation )
        gtk_icon_view_set_item_orientation(GTK_ICON_VIEW(id_),i)
    end property

    property TGtkIconView.selectionMode() as GtkSelectionMode
        return gtk_icon_view_get_selection_mode(GTK_ICON_VIEW(id_))
    end property

    property TGtkIconView.selectionMode( byval i as GtkOrientation )
        gtk_icon_view_set_selection_mode(GTK_ICON_VIEW(id_),i)
    end property

    property TGtkIconView.columns() as integer
        return gtk_icon_view_get_columns(GTK_ICON_VIEW(id_))
    end property

    property TGtkIconView.columns( byval i as integer )
        gtk_icon_view_set_columns(GTK_ICON_VIEW(id_),i)
    end property

    property TGtkIconView.itemWidth() as integer
        return gtk_icon_view_get_item_width(GTK_ICON_VIEW(id_))
    end property

    property TGtkIconView.itemWidth( byval i as integer )
        gtk_icon_view_set_item_width(GTK_ICON_VIEW(id_),i)
    end property

    property TGtkIconView.spacing() as integer
        return gtk_icon_view_get_spacing(GTK_ICON_VIEW(id_))
    end property

    property TGtkIconView.spacing( byval i as integer )
        gtk_icon_view_set_spacing(GTK_ICON_VIEW(id_),i)
    end property

    property TGtkIconView.rowSpacing() as integer
        return gtk_icon_view_get_row_spacing(GTK_ICON_VIEW(id_))
    end property

    property TGtkIconView.rowSpacing( byval i as integer )
        gtk_icon_view_set_row_spacing(GTK_ICON_VIEW(id_),i)
    end property

    property TGtkIconView.columnSpacing() as integer
        return gtk_icon_view_get_column_spacing(GTK_ICON_VIEW(id_))
    end property

    property TGtkIconView.columnSpacing( byval i as integer )
        gtk_icon_view_set_column_spacing(GTK_ICON_VIEW(id_),i)
    end property

    property TGtkIconView.margin() as integer
        return gtk_icon_view_get_margin(GTK_ICON_VIEW(id_))
    end property

    property TGtkIconView.margin( byval i as integer )
        gtk_icon_view_set_margin(GTK_ICON_VIEW(id_),i)
    end property

    property TGtkIconView.itemPadding() as integer
        return gtk_icon_view_get_item_padding(GTK_ICON_VIEW(id_))
    end property

    property TGtkIconView.itemPadding( byval i as integer )
        gtk_icon_view_set_item_padding(GTK_ICON_VIEW(id_),i)
    end property

end namespace
