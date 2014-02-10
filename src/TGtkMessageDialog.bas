
#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkMessageDialog
        id_ = gtk_message_dialog_new_with_markup( 0, GTK_DIALOG_MODAL, GTK_MESSAGE_INFO, GTK_BUTTONS_OK, "" )
    end constructor

    destructor TGtkMessageDialog
    end destructor

    sub TGtkMessageDialog.Show()
        gtk_dialog_run(GTK_DIALOG( id_ ))
        gtk_widget_destroy(GTK_WIDGET( id_ ))
    end sub

    sub TGtkMessageDialog.SetTitle( byref nwTitle as string )
        title_ = nwTitle
        gtk_window_set_title(GTK_WINDOW(id_), title_)
    end sub

    function TGtkMessageDialog.GetTitle() as string
        return title_
    end function

    sub TGtkMessageDialog.SetText( byref nwText as string )
        text_ = nwText
        gtk_message_dialog_set_markup( GTK_MESSAGE_DIALOG(id_), text_ )
    end sub

    function TGtkMessageDialog.GetText() as string
        return text_
    end function

end namespace
