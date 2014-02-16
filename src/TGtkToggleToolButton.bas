#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkToggleToolButton)

    TOOL_ITEM_COMMON(TGtkToggleToolButton)

    TOOL_BUTTON_COMMON(TGtkToggleToolButton)

    constructor TGtkToggleToolButton
        id_ = GTK_WIDGET(gtk_toggle_tool_button_new())
        init()
    end constructor

    constructor TGtkToggleToolButton( byref stock_id as string )
        id_ = GTK_WIDGET(gtk_toggle_tool_button_new_from_stock(stock_id))
        init()
    end constructor

    property TGtkToggleToolButton.active() as gboolean
        return gtk_toggle_tool_button_get_active(GTK_TOGGLE_TOOL_BUTTON(id_))
    end property

    property TGtkToggleToolButton.active( byval t as gboolean )
        gtk_toggle_tool_button_set_active(GTK_TOGGLE_TOOL_BUTTON(id_),t)
    end property

end namespace
