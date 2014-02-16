#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkToolItem)

    TOOL_ITEM_COMMON(TGtkToolItem)

    constructor TGtkToolItem
        id_ = GTK_WIDGET(gtk_tool_item_new())
        init()
    end constructor

    sub TGtkToolItem.addChild( byval x as GtkWidget ptr )
        gtk_container_add(GTK_CONTAINER(id_),x)
    end sub

end namespace
