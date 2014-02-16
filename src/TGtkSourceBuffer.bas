#ifndef RAPAD_NO_SOURCEVIEW

#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkSourceBuffer
        var tt = gtk_text_tag_table_new()
        id_ = gtk_source_buffer_new(tt)
    end constructor

    constructor TGtkSourceBuffer( byval l as GtkSourceLanguage ptr )
        id_ = gtk_source_buffer_new_with_language(l)
    end constructor

    constructor TGtkSourceBuffer( byval i as GtkSourceBuffer ptr )
        id_ = i
    end constructor

    property TGtkSourceBuffer.language() as GtkSourceLanguage ptr
        return gtk_source_buffer_get_language(id_)
    end property

    property TGtkSourceBuffer.language( byval v as GtkSourceLanguage ptr )
        gtk_source_buffer_set_language(id_,v)
    end property

    property TGtkSourceBuffer.highlightSyntax() as gboolean
        return gtk_source_buffer_get_highlight_syntax(id_)
    end property

    property TGtkSourceBuffer.highlightSyntax( byval t as gboolean )
        gtk_source_buffer_set_highlight_syntax(id_,t)
    end property

    property TGtkSourceBuffer.highlightMatchingBrackets() as gboolean
        return gtk_source_buffer_get_highlight_matching_brackets(id_)
    end property

    property TGtkSourceBuffer.highlightMatchingBrackets( byval t as gboolean )
        gtk_source_buffer_set_highlight_matching_brackets(id_,t)
    end property

    property TGtkSourceBuffer.styleScheme() as GtkSourceStyleScheme ptr
        return gtk_source_buffer_get_style_scheme(id_)
    end property

    property TGtkSourceBuffer.styleScheme( byval b as GtkSourceStyleScheme ptr )
        gtk_source_buffer_set_style_scheme(id_,b)
    end property

    property TGtkSourceBuffer.maxUndoLevels() as integer
        return gtk_source_buffer_get_max_undo_levels(id_)
    end property

    property TGtkSourceBuffer.maxUndoLevels( byval i as integer )
        gtk_source_buffer_set_max_undo_levels(id_,i)
    end property

    sub TGtkSourceBuffer.redo()
        gtk_source_buffer_redo(id_)
    end sub

    sub TGtkSourceBuffer.undo()
        gtk_source_buffer_undo(id_)
    end sub

    property TGtkSourceBuffer.canRedo() as gboolean
        return gtk_source_buffer_can_redo(id_)
    end property

    property TGtkSourceBuffer.canUndo() as gboolean
        return gtk_source_buffer_can_undo(id_)
    end property

    operator TGtkSourceBuffer.cast() as GtkSourceBuffer ptr
        return id_
    end operator

end namespace

#endif
