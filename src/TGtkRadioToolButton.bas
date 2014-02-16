#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkRadioToolButton)

    TOOL_ITEM_COMMON(TGtkRadioToolButton)

    TOOL_BUTTON_COMMON(TGtkRadioToolButton)

    constructor TGtkRadioToolButton
        id_ = GTK_WIDGET(gtk_radio_tool_button_new(0))
        init()
    end constructor

    constructor TGtkRadioToolButton( byref stock_id as string )
        id_ = GTK_WIDGET(gtk_radio_tool_button_new_from_stock(0,stock_id))
        init()
    end constructor

    constructor TGtkRadioToolButton( byref g as TGtkRadioToolButton )
        id_ = GTK_WIDGET(gtk_radio_tool_button_new_from_widget(cast(GtkRadioToolButton ptr,cast(GtkWidget ptr,g))))
        init()
    end constructor

    constructor TGtkRadioToolButton( byval g as TGtkRadioToolButton, byref stock_id as string )
        id_ = GTK_WIDGET(gtk_radio_tool_button_new_with_stock_from_widget(cast(GtkRadioToolButton ptr,cast(GtkWidget ptr,g)),stock_id))
        init()
    end constructor

    property TGtkRadioToolButton.group() as GSList ptr
        return gtk_radio_tool_button_get_group(GTK_RADIO_TOOL_BUTTON(id_))
    end property

    property TGtkRadioToolButton.group( byval g as GSList ptr )
        gtk_radio_tool_button_set_group(GTK_RADIO_TOOL_BUTTON(id_),g)
    end property

end namespace
