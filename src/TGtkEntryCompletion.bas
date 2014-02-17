#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkEntryCompletion
        id_ = gtk_entry_completion_new()
    end constructor

    constructor TGtkEntryCompletion( byval i as GtkEntryCompletion ptr )
        id_ = i
    end constructor

    property TGtkEntryCompletion.entry() as GtkWidget ptr
        return gtk_entry_completion_get_entry(id_)
    end property

    property TGtkEntryCompletion.model() as GtkTreeModel ptr
        return gtk_entry_completion_get_model(id_)
    end property

    property TGtkEntryCompletion.model( byval x as GtkTreeModel ptr )
        gtk_entry_completion_set_model(id_,x)
    end property

    property TGtkEntryCompletion.minKeyLength() as integer
        return gtk_entry_completion_get_minimum_key_length(id_)
    end property

    property TGtkEntryCompletion.minKeyLength( byval i as integer )
        gtk_entry_completion_set_minimum_key_length(id_,i)
    end property

    property TGtkEntryCompletion.textColumn() as integer
        return gtk_entry_completion_get_text_column(id_)
    end property

    property TGtkEntryCompletion.textColumn( byval i as integer )
        gtk_entry_completion_set_text_column(id_,i)
    end property

    property TGtkEntryCompletion.inlineCompletion() as gboolean
        return gtk_entry_completion_get_inline_completion(id_)
    end property

    property TGtkEntryCompletion.inlineCompletion( byval t as gboolean )
        gtk_entry_completion_set_inline_completion(id_,t)
    end property

    property TGtkEntryCompletion.inlineSelection() as gboolean
        return gtk_entry_completion_get_inline_selection(id_)
    end property

    property TGtkEntryCompletion.inlineSelection( byval t as gboolean )
        gtk_entry_completion_set_inline_selection(id_,t)
    end property

    property TGtkEntryCompletion.popupCompletion() as gboolean
        return gtk_entry_completion_get_popup_completion(id_)
    end property

    property TGtkEntryCompletion.popupCompletion( byval t as gboolean )
        gtk_entry_completion_set_popup_completion(id_,t)
    end property

    property TGtkEntryCompletion.widthOfEntry() as gboolean
        return gtk_entry_completion_get_popup_set_width(id_)
    end property

    property TGtkEntryCompletion.widthOfEntry( byval t as gboolean )
        gtk_entry_completion_set_popup_set_width(id_,t)
    end property

    property TGtkEntryCompletion.popupSingleMatch() as gboolean
        return gtk_entry_completion_get_popup_single_match(id_)
    end property

    property TGtkEntryCompletion.popupSingleMatch( byval t as gboolean )
        gtk_entry_completion_set_popup_single_match(id_,t)
    end property

    operator TGtkEntryCompletion.cast() as GtkEntryCompletion ptr
        return id_
    end operator

end namespace
