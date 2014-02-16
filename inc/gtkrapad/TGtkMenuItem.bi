
#macro DECLARE_MENU_ITEM_COMMON()
    declare property label() as string
    declare property label( byref txt as string )

    declare property useUnderline() as gboolean
    declare property useUnderline( byval t as gboolean )

    declare property submenu() as GtkWidget ptr
    declare property submenu( byval s as GtkWidget ptr )

    declare property accelPath() as string
    declare property accelPath( byref a as string )
#endmacro

#macro MENU_ITEM_COMMON(cname)
    property cname.label() as string
        return *gtk_menu_item_get_label(GTK_MENU_ITEM(id_))
    end property

    property cname.label( byref txt as string )
        gtk_menu_item_set_label(GTK_MENU_ITEM(id_),txt)
    end property

    property cname.submenu() as GtkWidget ptr
        return gtk_menu_item_get_submenu(GTK_MENU_ITEM(id_))
    end property

    property cname.submenu( byval s as GtkWidget ptr )
        gtk_menu_item_set_submenu(GTK_MENU_ITEM(id_),s)
    end property

    property cname.accelPath() as string
        return *gtk_menu_item_get_accel_path(GTK_MENU_ITEM(id_))
    end property

    property cname.accelPath( byref a as string )
        gtk_menu_item_set_accel_path(GTK_MENU_ITEM(id_),a)
    end property

    property cname.useUnderline() as gboolean
        return gtk_menu_item_get_use_underline(GTK_MENU_ITEM(id_))
    end property

    property cname.useUnderline( byval t as gboolean )
        gtk_menu_item_set_use_underline(GTK_MENU_ITEM(id_),t)
    end property
#endmacro

namespace GtkRapad

    type TGtkMenuItem
        public:
            declare constructor( )
            declare constructor( byref _label_ as string )

            declare operator cast() as GtkWidget pointer
            declare sub Activate( byval aMethod as GtkGenericCallback )

            DECLARE_MENU_ITEM_COMMON()

            DECLARE_COMMON_FUNCS()

            COMMON_MEMBERS()

    end type


end namespace
