#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkMenuToolButton)

    TOOL_ITEM_COMMON(TGtkMenuToolButton)

    TOOL_BUTTON_COMMON(TGtkMenuToolButton)

    constructor TGtkMenuToolButton( byval icon_w as GtkWidget ptr = 0, byref txt as string = "" )
        id_ = GTK_WIDGET(gtk_menu_tool_button_new(icon_w,txt))
        init()
    end constructor

    constructor TGtkMenuToolButton( byref stock_id as string )
        id_ = GTK_WIDGET(gtk_menu_tool_button_new_from_stock(stock_id))
        init()
    end constructor

    property TGtkMenuToolButton.menu() as GtkWidget ptr
        return gtk_menu_tool_button_get_menu(GTK_MENU_TOOL_BUTTON(id_))
    end property

    property TGtkMenuToolButton.menu( byval i as GtkWidget ptr )
        gtk_menu_tool_button_set_menu(GTK_MENU_TOOL_BUTTON(id_),i)
    end property

    property TGtkMenuToolButton.arrowTooltip( byref txt as string )
        gtk_menu_tool_button_set_arrow_tooltip_markup(GTK_MENU_TOOL_BUTTON(id_),txt)
    end property

end namespace
