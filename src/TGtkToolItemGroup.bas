#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkToolItemGroup)

    constructor TGtkToolItemGroup( byref txt as string = "" )
        id_ = gtk_tool_item_group_new(txt)
        init()
    end constructor

    operator TGtkToolItemGroup.cast() as GtkWidget ptr
        return id_
    end operator

    property TGtkToolItemGroup.length() as integer
        return gtk_tool_item_group_get_n_items(GTK_TOOL_ITEM_GROUP(id_))
    end property

    function TGtkToolItemGroup.at( byval i as uinteger ) as TGtkToolItem
        return TGtkToolItem(gtk_tool_item_group_get_nth_item(GTK_TOOL_ITEM_GROUP(id_),i))
    end function

    property TGtkToolItemGroup.label() as string
        return *gtk_tool_item_group_get_label(GTK_TOOL_ITEM_GROUP(id_))
    end property

    property TGtkToolItemGroup.label( byref txt as string )
        gtk_tool_item_group_set_label(GTK_TOOL_ITEM_GROUP(id_),txt)
    end property

    property TGtkToolItemGroup.labelWidget() as GtkWidget ptr
        return gtk_tool_item_group_get_label_widget(GTK_TOOL_ITEM_GROUP(id_))
    end property

    property TGtkToolItemGroup.labelWidget( byval i as GtkWidget ptr )
        gtk_tool_item_group_set_label_widget(GTK_TOOL_ITEM_GROUP(id_),i)
    end property

    property TGtkToolItemGroup.collapsed() as gboolean
        return gtk_tool_item_group_get_collapsed(GTK_TOOL_ITEM_GROUP(id_))
    end property

    property TGtkToolItemGroup.collapsed( byval t as gboolean )
        gtk_tool_item_group_set_collapsed(GTK_TOOL_ITEM_GROUP(id_),t)
    end property

    property TGtkToolItemGroup.headerRelief() as GtkReliefStyle
        return gtk_tool_item_group_get_header_relief(GTK_TOOL_ITEM_GROUP(id_))
    end property

    property TGtkToolItemGroup.headerRelief( byval t as GtkReliefStyle )
        gtk_tool_item_group_set_header_relief(GTK_TOOL_ITEM_GROUP(id_),t)
    end property

    property TGtkToolItemGroup.ellipsize() as PangoEllipsizeMode
        return gtk_tool_item_group_get_ellipsize(GTK_TOOL_ITEM_GROUP(id_))
    end property

    property TGtkToolItemGroup.ellipsize( byval t as PangoEllipsizeMode )
        gtk_tool_item_group_set_ellipsize(GTK_TOOL_ITEM_GROUP(id_),t)
    end property

    sub TGtkToolItemGroup.prepend( byval i as TGtkToolItem )
        this.insert(i,0)
    end sub

    sub TGtkToolItemGroup.insert( byval i as TGtkToolItem, byval p as integer )
        gtk_tool_item_group_insert(GTK_TOOL_ITEM_GROUP(id_),cast(GtkToolItem ptr,i),p)
    end sub

    sub TGtkToolItemGroup.append( byval i as TGtkToolItem )
        this.insert(i,-1)
    end sub

end namespace
