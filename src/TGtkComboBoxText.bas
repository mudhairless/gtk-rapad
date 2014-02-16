#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkComboBoxText)

    constructor TGtkComboBoxText
        id_ = gtk_combo_box_text_new()
        init()
    end constructor

    constructor TGtkComboBoxText ( byval with_entry as gboolean )
        id_ = gtk_combo_box_text_new_with_entry()
        init()
    end constructor

    sub TGtkComboBoxText.appendText( byref txt as string )
        gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(id_),txt)
    end sub

    sub TGtkComboBoxText.insertText( byval p as integer, byref txt as string )
        gtk_combo_box_text_insert_text(GTK_COMBO_BOX_TEXT(id_),p,txt)
    end sub

    sub TGtkComboBoxText.prependText( byref txt as string )
        gtk_combo_box_text_prepend_text(GTK_COMBO_BOX_TEXT(id_),txt)
    end sub

    sub TGtkComboBoxText.remove( byval p as integer )
        gtk_combo_box_text_remove(GTK_COMBO_BOX_TEXT(id_),p)
    end sub

    property TGtkComboBoxText.activeText() as string
        return *gtk_combo_box_text_get_active_text(GTK_COMBO_BOX_TEXT(id_))
    end property

end namespace
