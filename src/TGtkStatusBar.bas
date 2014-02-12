#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkStatusBar)

    constructor TGtkStatusBar()
        id_ = gtk_statusbar_new()
        init()
    end constructor

    function TGtkStatusBar.getContextID( byref c as string ) as uinteger
        return gtk_statusbar_get_context_id(GTK_STATUSBAR(id_),c)
    end function

    function TGtkStatusBar.push( byref msg as string, byval cid as uinteger = 0 ) as uinteger
        return gtk_statusbar_push(GTK_STATUSBAR(id_),cid,msg)
    end function
    
    sub TGtkStatusBar.pop( byval cid as uinteger = 0 )
        gtk_statusbar_pop(GTK_STATUSBAR(id_),cid)
    end sub

    sub TGtkStatusBar.remove( byval mid_ as uinteger, byval cid as uinteger = 0 )
        gtk_statusbar_remove(GTK_STATUSBAR(id_),cid,mid_)
    end sub
    
    sub TGtkStatusBar.clear( byval cid as uinteger = 0 )
        gtk_statusbar_remove_all(GTK_STATUSBAR(id_),cid)
    end sub

    sub TGtkStatusBar.setHasResizeGrip( byval t as gboolean )
        gtk_statusbar_set_has_resize_grip(GTK_STATUSBAR(id_),t)
    end sub
    
    function TGtkStatusBar.getHasResizeGrip( ) as gboolean
        return gtk_statusbar_get_has_resize_grip(GTK_STATUSBAR(id_))
    end function

    function TGtkStatusBar.getMessageArea() as GtkWidget ptr
        return gtk_statusbar_get_message_area(GTK_STATUSBAR(id_))
    end function

    operator TGtkStatusBar.cast() as GtkWidget ptr
        return id_
    end operator


end namespace
