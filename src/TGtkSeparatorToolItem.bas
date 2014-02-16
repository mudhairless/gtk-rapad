#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkSeparatorToolItem)

    TOOL_ITEM_COMMON(TGtkSeparatorToolItem)

    constructor TGtkSeparatorToolItem
        id_ = GTK_WIDGET(gtk_separator_tool_item_new())
        init()
    end constructor

    property TGtkSeparatorToolItem.drawn() as gboolean
        return gtk_separator_tool_item_get_draw(GTK_SEPARATOR_TOOL_ITEM(id_))
    end property

    property TGtkSeparatorToolItem.drawn( byval t as gboolean )
        gtk_separator_tool_item_set_draw(GTK_SEPARATOR_TOOL_ITEM(id_),t)
    end property

end namespace
