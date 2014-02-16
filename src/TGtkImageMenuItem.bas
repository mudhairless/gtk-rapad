#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkImageMenuItem)

    constructor TGtkImageMenuItem( byref lbl as string = "" )
        id_ = gtk_image_menu_item_new_with_mnemonic(lbl)
        init()
    end constructor

    operator TGtkImageMenuItem.cast() as GtkWidget ptr
        return id_
    end operator

    property TGtkImageMenuItem.image() as GtkWidget ptr
        return gtk_image_menu_item_get_image(GTK_IMAGE_MENU_ITEM(id_))
    end property

    property TGtkImageMenuItem.image( byval i as GtkWidget ptr )
        gtk_image_menu_item_set_image(GTK_IMAGE_MENU_ITEM(id_),i)
    end property

    property TGtkImageMenuItem.alwaysShowImage() as gboolean
        return gtk_image_menu_item_get_always_show_image(GTK_IMAGE_MENU_ITEM(id_))
    end property

    property TGtkImageMenuItem.alwaysShowImage( byval t as gboolean )
        gtk_image_menu_item_set_always_show_image(GTK_IMAGE_MENU_ITEM(id_),t)
    end property

    MENU_ITEM_COMMON(TGtkImageMenuItem)

end namespace
