#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkToolButton)

    TOOL_ITEM_COMMON(TGtkToolButton)

    TOOL_BUTTON_COMMON(TGtkToolButton)

    constructor TGtkToolButton( byval icon_w as GtkWidget ptr = 0, byref txt as string = "" )
        id_ = GTK_WIDGET(gtk_tool_button_new(icon_w,txt))
        init()
    end constructor

    constructor TGtkToolButton( byref stock_id as string )
        id_ = GTK_WIDGET(gtk_tool_button_new_from_stock(stock_id))
        init()
    end constructor

end namespace
