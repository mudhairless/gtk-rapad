#macro DECLARE_TOOL_BUTTON_COMMON()
    declare property label() as string
    declare property label( byref txt as string )

    declare property useUnderline() as gboolean
    declare property useUnderline( byval t as gboolean )

    declare property stockID() as string
    declare property stockID( byref s as string )

    declare property iconName() as string
    declare property iconName( byref s as string )

    declare property iconWidget() as GtkWidget ptr
    declare property iconWidget( byval i as GtkWidget ptr )

    declare property labelWidget() as GtkWidget ptr
    declare property labelWidget( byval i as GtkWidget ptr )
#endmacro

#macro TOOL_BUTTON_COMMON(cname)
    property cname.label() as string
        return *gtk_tool_button_get_label(GTK_TOOL_BUTTON(id_))
    end property

    property cname.label( byref txt as string )
        gtk_tool_button_set_label(GTK_TOOL_BUTTON(id_),txt)
    end property

    property cname.useUnderline() as gboolean
        return gtk_tool_button_get_use_underline(GTK_TOOL_BUTTON(id_))
    end property

    property cname.useUnderline( byval t as gboolean )
        gtk_tool_button_set_use_underline(GTK_TOOL_BUTTON(id_),t)
    end property

    property cname.stockID() as string
        return *gtk_tool_button_get_stock_id(GTK_TOOL_BUTTON(id_))
    end property

    property cname.stockID( byref s as string )
        gtk_tool_button_set_stock_id(GTK_TOOL_BUTTON(id_),s)
    end property

    property cname.iconName() as string
        return *gtk_tool_button_get_icon_name(GTK_TOOL_BUTTON(id_))
    end property

    property cname.iconName( byref s as string )
        gtk_tool_button_set_icon_name(GTK_TOOL_BUTTON(id_),s)
    end property

    property cname.iconWidget() as GtkWidget ptr
        return gtk_tool_button_get_icon_widget(GTK_TOOL_BUTTON(id_))
    end property

    property cname.iconWidget( byval i as GtkWidget ptr )
        gtk_tool_button_set_icon_widget(GTK_TOOL_BUTTON(id_),i)
    end property

    property cname.labelWidget() as GtkWidget ptr
        return gtk_tool_button_get_label_widget(GTK_TOOL_BUTTON(id_))
    end property

    property cname.labelWidget( byval i as GtkWidget ptr )
        gtk_tool_button_set_label_widget(GTK_TOOL_BUTTON(id_),i)
    end property
#endmacro
namespace GtkRapad

type TGtkToolButton

    declare constructor( byval icon_w as GtkWidget ptr = 0, byref txt as string = "" )
    declare constructor( byref stock_id as string )

    DECLARE_TOOL_BUTTON_COMMON()
    DECLARE_TOOL_ITEM_COMMON()
    DECLARE_COMMON_FUNCS()
    COMMON_MEMBERS()
end type

end namespace
