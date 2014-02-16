#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkToolPalette)

    constructor TGtkToolPalette
        id_ = gtk_tool_palette_new()
        init()
    end constructor

    function TGtkToolPalette.getExclusive( byval t as TGtkToolItemGroup ) as gboolean
        return gtk_tool_palette_get_exclusive(GTK_TOOL_PALETTE(id_),cast(GtkToolItemGroup ptr,cast(GtkWidget ptr,t)))
    end function

    sub TGtkToolPalette.setExclusive(byval t as TGtkToolItemGroup, byval b as gboolean )
        gtk_tool_palette_set_exclusive(GTK_TOOL_PALETTE(id_),cast(GtkToolItemGroup ptr,cast(GtkWidget ptr,t)),b)
    end sub

    function TGtkToolPalette.getExpand( byval t as TGtkToolItemGroup ) as gboolean
        return gtk_tool_palette_get_expand(GTK_TOOL_PALETTE(id_),cast(GtkToolItemGroup ptr,cast(GtkWidget ptr,t)))
    end function

    sub TGtkToolPalette.setExpand( byval t as TGtkToolItemGroup, byval b as gboolean )
        gtk_tool_palette_set_expand(GTK_TOOL_PALETTE(id_),cast(GtkToolItemGroup ptr,cast(GtkWidget ptr,t)),b)
    end sub

    function TGtkToolPalette.getGroupPos( byval t as TGtkToolItemGroup ) as integer
        return gtk_tool_palette_get_group_position(GTK_TOOL_PALETTE(id_),cast(GtkToolItemGroup ptr,cast(GtkWidget ptr,t)))
    end function

    sub TGtkToolPalette.setGroupPos( byval t as TGtkToolItemGroup, byval i as integer )
        gtk_tool_palette_set_group_position(GTK_TOOL_PALETTE(id_),cast(GtkToolItemGroup ptr,cast(GtkWidget ptr,t)),i)
    end sub

    property TGtkToolPalette.iconSize() as GtkIconSize
        return gtk_tool_palette_get_icon_size(GTK_TOOL_PALETTE(id_))
    end property

    property TGtkToolPalette.iconSize( byval t as GtkIconSize )
        gtk_tool_palette_set_icon_size(GTK_TOOL_PALETTE(id_),t)
    end property

    sub TGtkToolPalette.resetIconSize()
        gtk_tool_palette_unset_icon_size(GTK_TOOL_PALETTE(id_))
    end sub

    property TGtkToolPalette.style() as GtkToolbarStyle
        return gtk_tool_palette_get_style(GTK_TOOL_PALETTE(id_))
    end property

    property TGtkToolPalette.style( byval t as GtkToolbarStyle )
        gtk_tool_palette_set_style(GTK_TOOL_PALETTE(id_),t)
    end property

    sub TGtkToolPalette.resetStyle()
        gtk_tool_palette_unset_style(GTK_TOOL_PALETTE(id_))
    end sub

end namespace
