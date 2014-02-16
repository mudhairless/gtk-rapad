#macro DECLARE_TOOL_ITEM_COMMON()
    declare constructor( byval i as GtkToolItem ptr )
    declare operator cast() as GtkToolItem ptr
    declare operator cast() as GtkWidget ptr
    declare property expand() as gboolean
    declare property expand( byval t as gboolean )
    declare property homogeneous() as gboolean
    declare property homogeneous( byval t as gboolean )
    declare property isImportant() as gboolean
    declare property isImportant( byval t as gboolean )
    declare property visibleHorizontal() as gboolean
    declare property visibleHorizontal(byval t as gboolean)
    declare property visibleVertical() as gboolean
    declare property visibleVertical(byval t as gboolean)
#endmacro

#macro TOOL_ITEM_COMMON(cname)
    constructor cname (byval i as GtkToolItem ptr)
        id_ = GTK_WIDGET(i)
        init()
    end constructor

    property cname.isImportant() as gboolean
        return gtk_tool_item_get_is_important(GTK_TOOL_ITEM(id_))
    end property

    property cname.isImportant(byval t as gboolean)
        gtk_tool_item_set_is_important(GTK_TOOL_ITEM(id_),t)
    end property

    property cname.visibleHorizontal() as gboolean
        return gtk_tool_item_get_visible_horizontal(GTK_TOOL_ITEM(id_))
    end property

    property cname.visibleHorizontal(byval t as gboolean)
        gtk_tool_item_set_visible_horizontal(GTK_TOOL_ITEM(id_),t)
    end property

    property cname.visibleVertical() as gboolean
        return gtk_tool_item_get_visible_vertical(GTK_TOOL_ITEM(id_))
    end property

    property cname.visibleVertical(byval t as gboolean)
        gtk_tool_item_set_visible_vertical(GTK_TOOL_ITEM(id_),t)
    end property

    operator cname.cast() as GtkWidget ptr
        return id_
    end operator

    operator cname.cast() as GtkToolItem ptr
        return GTK_TOOL_ITEM(id_)
    end operator

    property cname.expand() as gboolean
        return gtk_tool_item_get_expand(GTK_TOOL_ITEM(id_))
    end property

    property cname.expand( byval t as gboolean )
        gtk_tool_item_set_expand(GTK_TOOL_ITEM(id_),t)
    end property

    property cname.homogeneous() as gboolean
        return gtk_tool_item_get_homogeneous(GTK_TOOL_ITEM(id_))
    end property

    property cname.homogeneous( byval t as gboolean )
        gtk_tool_item_set_homogeneous(GTK_TOOL_ITEM(id_),t)
    end property
#endmacro

namespace GtkRapad

type TGtkToolItem
    declare constructor

    declare sub addChild( byval x as GtkWidget ptr )

    DECLARE_COMMON_FUNCS()

    DECLARE_TOOL_ITEM_COMMON()

    COMMON_MEMBERS()
end type

end namespace
