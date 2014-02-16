#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkToolbar)

    constructor TGtkToolbar
        id_ = gtk_toolbar_new()
        init()
    end constructor

    operator TGtkToolbar.cast() as GtkWidget ptr
        return id_
    end operator

    sub TGtkToolbar.insert(byval i as TGtkToolItem, byval p as integer )
        gtk_toolbar_insert(GTK_TOOLBAR(id_),cast(GtkToolItem ptr,i),p)
    end sub

    sub TGtkToolbar.prepend( byval i as TGtkToolItem )
        this.insert(i,0)
    end sub

    sub TGtkToolbar.append( byval i as TGtkToolItem )
        this.insert(i,-1)
    end sub

    property TGtkToolbar.length() as integer
        return gtk_toolbar_get_n_items(GTK_TOOLBAR(id_))
    end property

    function TGtkToolbar.at( byval i as integer ) as TGtkToolItem
        return TGtkToolItem(gtk_toolbar_get_nth_item(GTK_TOOLBAR(id_),i))
    end function

    property TGtkToolbar.showOverflowMenu() as gboolean
        return gtk_toolbar_get_show_arrow(GTK_TOOLBAR(id_))
    end property

    property TGtkToolbar.showOverflowMenu( byval t as gboolean )
        gtk_toolbar_set_show_arrow(GTK_TOOLBAR(id_),t)
    end property

    property TGtkToolbar.orientation() as GtkOrientation
        return gtk_orientable_get_orientation(GTK_ORIENTABLE(id_))
    end property

    property TGtkToolbar.orientation( byval t as GtkOrientation )
        gtk_orientable_set_orientation(GTK_ORIENTABLE(id_),t)
    end property

    property TGtkToolbar.style() as GtkToolbarStyle
        return gtk_toolbar_get_style(GTK_TOOLBAR(id_))
    end property

    property TGtkToolbar.style( byval t as GtkToolbarStyle )
        gtk_toolbar_set_style(GTK_TOOLBAR(id_),t)
    end property

    sub TGtkToolbar.resetStyle()
        gtk_toolbar_unset_style(GTK_TOOLBAR(id_))
    end sub

    property TGtkToolbar.iconSize() as GtkIconSize
        return gtk_toolbar_get_icon_size(GTK_TOOLBAR(id_))
    end property

    property TGtkToolbar.iconSize( byval t as GtkIconSize )
        gtk_toolbar_set_icon_size(GTK_TOOLBAR(id_),t)
    end property

end namespace
