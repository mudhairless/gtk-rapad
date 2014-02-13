#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkInfoBar)

    constructor TGtkInfoBar
        id_ = gtk_info_bar_new()
        init()
    end constructor

    operator TGtkInfoBar.cast() as GtkWidget ptr
        return id_
    end operator

    sub TGtkInfoBar.addActionWidget( byval w as GtkWidget ptr, byval rid as integer )
        gtk_info_bar_add_action_widget(GTK_INFO_BAR(id_),w,rid)
    end sub

    function TGtkInfoBar.addButton( byref text as string, byval rid as integer ) as GtkWidget ptr
        return gtk_info_bar_add_button(GTK_INFO_BAR(id_),text,rid)
    end function

    sub TGtkInfoBar.setReponseSensitive( byval rid as integer, byval t as gboolean )
        gtk_info_bar_set_response_sensitive(GTK_INFO_BAR(id_),rid,t)
    end sub

    sub TGtkInfoBar.setDefaultResponse( byval rid as integer )
        gtk_info_bar_set_default_response(GTK_INFO_BAR(id_),rid)
    end sub

    sub TGtkInfoBar.response( byval rid as integer )
        gtk_info_bar_response(GTK_INFO_BAR(id_),rid)
    end sub

    property TGtkInfoBar.messageType() as GtkMessageType
        return gtk_info_bar_get_message_type(GTK_INFO_BAR(id_))
    end property

    property TGtkInfoBar.messageType( byval t as GtkMessageType )
        gtk_info_bar_set_message_type(GTK_INFO_BAR(id_),t)
    end property

    function TGtkInfoBar.getActionArea() as GtkWidget ptr
        return gtk_info_bar_get_action_area(GTK_INFO_BAR(id_))
    end function

    function TGtkInfoBar.getContentArea() as GtkWidget ptr
        return gtk_info_bar_get_content_area(GTK_INFO_BAR(id_))
    end function

end namespace
