#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkStatusIcon
        _s = gtk_status_icon_new()
    end constructor

    constructor TGtkStatusIcon( byref ico_fn as string )
        _s = gtk_status_icon_new_from_file(ico_fn)
    end constructor

    sub TGtkStatusIcon.setIconFromPixbuf( byval pb as GdkPixbuf ptr )
        gtk_status_icon_set_from_pixbuf(_s,pb)
    end sub

    sub TGtkStatusIcon.setIconFromFile( byref ico_fn as string )
        gtk_status_icon_set_from_file(_s,ico_fn)
    end sub

    sub TGtkStatusIcon.setIconFromStock( byref s as string )
        gtk_status_icon_set_from_stock(_s,s)
    end sub

    sub TGtkStatusIcon.setIconFromIconName( byref i as string )
        gtk_status_icon_set_from_icon_name(_s,i)
    end sub

    sub TGtkStatusIcon.setIconFromIcon( byval i as GIcon ptr )
        gtk_status_icon_set_from_gicon(_s,i)
    end sub

    function TGtkStatusIcon.storageType() as GtkImageType
        return gtk_status_icon_get_storage_type(_s)
    end function

    function TGtkStatusIcon.getPixbuf() as GdkPixbuf ptr
        return gtk_status_icon_get_pixbuf(_s)
    end function

    function TGtkStatusIcon.getStock() as string
        return *gtk_status_icon_get_stock(_s)
    end function

    function TGtkStatusIcon.getIconName() as string
        return *gtk_status_icon_get_icon_name(_s)
    end function

    function TGtkStatusIcon.getIcon() as GIcon ptr
        return gtk_status_icon_get_gicon(_s)
    end function

    property TGtkStatusIcon.screen() as GdkScreen ptr
        return gtk_status_icon_get_screen(_s)
    end property

    property TGtkStatusIcon.screen( byval s as GdkScreen ptr )
        gtk_status_icon_set_screen(_s,s)
    end property

    property TGtkStatusIcon.title() as string
        return *gtk_status_icon_get_title(_s)
    end property

    property TGtkStatusIcon.title( byref t as string )
        gtk_status_icon_set_title(_s,t)
    end property

    property TGtkStatusIcon.name( byref t as string )
        gtk_status_icon_set_name(_s,t)
    end property

    property TGtkStatusIcon.visible() as gboolean
        return gtk_status_icon_get_visible(_s)
    end property

    property TGtkStatusIcon.visible( byval t as gboolean )
        gtk_status_icon_set_visible(_s,t)
    end property

end namespace
