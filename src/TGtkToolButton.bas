#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkToolButton)

    TOOL_ITEM_COMMON(TGtkToolButton)

    constructor TGtkToolButton( byval icon_w as GtkWidget ptr = 0, byref txt as string = "" )
        id_ = GTK_WIDGET(gtk_tool_button_new(icon_w,txt))
        init()
    end constructor

    constructor TGtkToolButton( byref stock_id as string )
        id_ = GTK_WIDGET(gtk_tool_button_new_from_stock(stock_id))
        init()
    end constructor

    property TGtkToolButton.label() as string
        return *gtk_tool_button_get_label(GTK_TOOL_BUTTON(id_))
    end property

    property TGtkToolButton.label( byref txt as string )
        gtk_tool_button_set_label(GTK_TOOL_BUTTON(id_),txt)
    end property

    property TGtkToolButton.useUnderline() as gboolean
        return gtk_tool_button_get_use_underline(GTK_TOOL_BUTTON(id_))
    end property

    property TGtkToolButton.useUnderline( byval t as gboolean )
        gtk_tool_button_set_use_underline(GTK_TOOL_BUTTON(id_),t)
    end property

    property TGtkToolButton.stockID() as string
        return *gtk_tool_button_get_stock_id(GTK_TOOL_BUTTON(id_))
    end property

    property TGtkToolButton.stockID( byref s as string )
        gtk_tool_button_set_stock_id(GTK_TOOL_BUTTON(id_),s)
    end property

    property TGtkToolButton.iconName() as string
        return *gtk_tool_button_get_icon_name(GTK_TOOL_BUTTON(id_))
    end property

    property TGtkToolButton.iconName( byref s as string )
        gtk_tool_button_set_icon_name(GTK_TOOL_BUTTON(id_),s)
    end property

    property TGtkToolButton.iconWidget() as GtkWidget ptr
        return gtk_tool_button_get_icon_widget(GTK_TOOL_BUTTON(id_))
    end property

    property TGtkToolButton.iconWidget( byval i as GtkWidget ptr )
        gtk_tool_button_set_icon_widget(GTK_TOOL_BUTTON(id_),i)
    end property

    property TGtkToolButton.labelWidget() as GtkWidget ptr
        return gtk_tool_button_get_label_widget(GTK_TOOL_BUTTON(id_))
    end property

    property TGtkToolButton.labelWidget( byval i as GtkWidget ptr )
        gtk_tool_button_set_label_widget(GTK_TOOL_BUTTON(id_),i)
    end property

end namespace
