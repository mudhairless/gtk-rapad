#ifndef RAPAD_NO_SOURCEVIEW

#include "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkSourceView)

    constructor TGtkSourceView
        id_ = gtk_source_view_new()
        setParent(cast(GtkWidget ptr,_s))
        init()
    end constructor

    property TGtkSourceView.Text( byval text_ as string )
        gtk_text_buffer_set_text( cast(GtkTextBuffer ptr,cast(GtkSourceBuffer ptr,this.buffer)), @text_, len(text_) )
    end property

    property TGtkSourceView.Text() as string
        dim as GtkTextIter text_s, text_e

        gtk_text_buffer_get_bounds( cast(GtkTextBuffer ptr,cast(GtkSourceBuffer ptr,this.buffer)), @text_s, @text_e)

        return *(gtk_text_buffer_get_text( cast(GtkTextBuffer ptr,cast(GtkSourceBuffer ptr,this.buffer)), @text_s, @text_e, false ))
    end property

    property TGtkSourceView.Font( byval font_ as string )
        if (not (font_ = "" )) then
            gtk_widget_modify_font( GTK_WIDGET( id_ ), pango_font_description_from_string( font_ ) )
        end if
    end property

    property TGtkSourceView.modified() as gboolean
        return gtk_text_buffer_get_modified(cast(GtkTextBuffer ptr,cast(GtkSourceBuffer ptr,this.buffer)))
    end property

    property TGtkSourceView.modified( byval t as gboolean )
        gtk_text_buffer_set_modified(cast(GtkTextBuffer ptr,cast(GtkSourceBuffer ptr,this.buffer)),t)
    end property

    property TGtkSourceView.lineCount() as integer
        return gtk_text_buffer_get_line_count(cast(GtkTextBuffer ptr,cast(GtkSourceBuffer ptr,this.buffer)))
    end property

    property TGtkSourceView.charCount() as integer
        return gtk_text_buffer_get_char_count(cast(GtkTextBuffer ptr,cast(GtkSourceBuffer ptr,this.buffer)))
    end property

    property TGtkSourceView.autoIndent() as gboolean
        return gtk_source_view_get_auto_indent(GTK_SOURCE_VIEW(id_))
    end property

    property TGtkSourceView.autoIndent( byval t as gboolean )
        gtk_source_view_set_auto_indent(GTK_SOURCE_VIEW(id_),t)
    end property

    property TGtkSourceView.indentOnTab() as gboolean
        return gtk_source_view_get_indent_on_tab(GTK_SOURCE_VIEW(id_))
    end property

    property TGtkSourceView.indentOnTab( byval t as gboolean )
        gtk_source_view_set_indent_on_tab(GTK_SOURCE_VIEW(id_),t)
    end property

    property TGtkSourceView.indentWidth() as integer
        return gtk_source_view_get_indent_width(GTK_SOURCE_VIEW(id_))
    end property

    property TGtkSourceView.indentWidth( byval v as integer )
        gtk_source_view_set_indent_width(GTK_SOURCE_VIEW(id_),v)
    end property

    property TGtkSourceView.spacesInsteadOfTabs() as gboolean
        return gtk_source_view_get_insert_spaces_instead_of_tabs(GTK_SOURCE_VIEW(id_))
    end property

    property TGtkSourceView.spacesInsteadOfTabs( byval t as gboolean )
        gtk_source_view_set_insert_spaces_instead_of_tabs(GTK_SOURCE_VIEW(id_),t)
    end property

    property TGtkSourceView.smartHomeEnd() as GtkSourceSmartHomeEndType
        return gtk_source_view_get_smart_home_end(GTK_SOURCE_VIEW(id_))
    end property

    property TGtkSourceView.smartHomeEnd( byval t as GtkSourceSmartHomeEndType )
        gtk_source_view_set_smart_home_end(GTK_SOURCE_VIEW(id_),t)
    end property

    property TGtkSourceView.highlightCurrentLine() as gboolean
        return gtk_source_view_get_highlight_current_line(GTK_SOURCE_VIEW(id_))
    end property

    property TGtkSourceView.highlightCurrentLine( byval t as gboolean )
        gtk_source_view_set_highlight_current_line(GTK_SOURCE_VIEW(id_),t)
    end property

    property TGtkSourceView.showLineMarks() as gboolean
        return gtk_source_view_get_show_line_marks(GTK_SOURCE_VIEW(id_))
    end property

    property TGtkSourceView.showLineMarks( byval t as gboolean )
        gtk_source_view_set_show_line_marks(GTK_SOURCE_VIEW(id_),t)
    end property

    property TGtkSourceView.showLineNumbers() as gboolean
        return gtk_source_view_get_show_line_numbers(GTK_SOURCE_VIEW(id_))
    end property

    property TGtkSourceView.showLineNumbers( byval t as gboolean )
        gtk_source_view_set_show_line_numbers(GTK_SOURCE_VIEW(id_),t)
    end property

    property TGtkSourceView.showRightMargin() as gboolean
        return gtk_source_view_get_show_right_margin(GTK_SOURCE_VIEW(id_))
    end property

    property TGtkSourceView.showRightMargin( byval t as gboolean )
        gtk_source_view_set_show_right_margin(GTK_SOURCE_VIEW(id_),t)
    end property

    property TGtkSourceView.rightMargin() as uinteger
        return gtk_source_view_get_right_margin_position(GTK_SOURCE_VIEW(id_))
    end property

    property TGtkSourceView.rightMargin( byval v as uinteger )
        gtk_source_view_set_right_margin_position(GTK_SOURCE_VIEW(id_),v)
    end property

    property TGtkSourceView.tabWidth() as uinteger
        return gtk_source_view_get_tab_width(GTK_SOURCE_VIEW(id_))
    end property

    property TGtkSourceView.tabWidth( byval v as uinteger )
        gtk_source_view_set_tab_width(GTK_SOURCE_VIEW(id_),v)
    end property

    property TGtkSourceView.drawSpaces() as GtkSourceDrawSpacesFlags
        return gtk_source_view_get_draw_spaces(GTK_SOURCE_VIEW(id_))
    end property

    property TGtkSourceView.drawSpaces( byval t as GtkSourceDrawSpacesFlags )
        gtk_source_view_set_draw_spaces(GTK_SOURCE_VIEW(id_),t)
    end property

    property TGtkSourceView.buffer() as TGtkSourceBuffer
        return TGtkSourceBuffer(cast(GtkSourceBuffer ptr,gtk_text_view_get_buffer(GTK_TEXT_VIEW(id_))))
    end property

    property TGtkSourceView.buffer( byval p as TGtkSourceBuffer )
        gtk_text_view_set_buffer(GTK_TEXT_VIEW(id_),GTK_TEXT_BUFFER(cast(GtkSourceBuffer ptr,p)))
    end property

    'property TGtkSourceView.completion() as GtkSourceCompletion ptr
    '    return gtk_source_view_get_completion(GTK_SOURCE_VIEW(id_))
    'end property

    'property TGtkSourceView.gutter() as GtkSourceGutter ptr
    '    return gtk_source_view_get_gutter(GTK_SOURCE_VIEW(id_))
    'end property

    property TGtkSourceView.sourceview() as GtkSourceView ptr
        return GTK_SOURCE_VIEW(id_)
    end property

    property TGtkSourceView.scollwindow() as TGtkScrollable
        return _s
    end property

    operator TGtkSourceView.cast() as GtkWidget ptr
        return cast(GtkWidget ptr,_s)
    end operator

end namespace

#endif
