#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkLabel)

    constructor TGtkLabel()
        id_ = gtk_label_new( "" )
        init()
    end constructor

    constructor TGtkLabel( byref contents as string )
        id_ = gtk_label_new( contents )
        init()
    end constructor

    operator TGtkLabel.cast() as GtkWidget Pointer
        return id_
    end operator

    property TGtkLabel.Text( byref contents as string )
        gtk_label_set_label( GTK_LABEL(id_), contents )
    end property

    property TGtkLabel.Text( ) as string
        return *(gtk_label_get_label( GTK_LABEL(id_) ))
    end property

    property TGtkLabel.pattern( byref x as string )
        gtk_label_set_pattern(GTK_LABEL(id_),x)
    end property

    property TGtkLabel.justify() as GtkJustification
        return gtk_label_get_justify(GTK_LABEL(id_))
    end property

    property TGtkLabel.justify( byval t as GtkJustification )
        gtk_label_set_justify(GTK_LABEL(id_),t)
    end property

    property TGtkLabel.ellipsize() as PangoEllipsizeMode
        return gtk_label_get_ellipsize(GTK_LABEL(id_))
    end property

    property TGtkLabel.ellipsize( byval t as PangoEllipsizeMode )
        gtk_label_set_ellipsize(GTK_LABEL(id_),t)
    end property

    property TGtkLabel.width() as integer
        return gtk_label_get_width_chars(GTK_LABEL(id_))
    end property

    property TGtkLabel.width( byval i as integer )
        gtk_label_set_width_chars(GTK_LABEL(id_),i)
    end property

    property TGtkLabel.maxWidth() as integer
        return gtk_label_get_max_width_chars(GTK_LABEL(id_))
    end property

    property TGtkLabel.maxWidth( byval i as integer )
        gtk_label_set_max_width_chars(GTK_LABEL(id_),i)
    end property

    property TGtkLabel.lineWrap() as gboolean
        return gtk_label_get_line_wrap(GTK_LABEL(id_))
    end property

    property TGtkLabel.lineWrap( byval t as gboolean )
        gtk_label_set_line_wrap(GTK_LABEL(id_),t)
    end property

    property TGtkLabel.lineWrapMode() as PangoWrapMode
        return gtk_label_get_line_wrap_mode(GTK_LABEL(id_))
    end property

    property TGtkLabel.lineWrapMode( byval t as PangoWrapMode )
        gtk_label_set_line_wrap_mode(GTK_LABEL(id_),t)
    end property

    property TGtkLabel.selectable() as gboolean
        return gtk_label_get_selectable(GTK_LABEL(id_))
    end property

    property TGtkLabel.selectable( byval t as gboolean )
        gtk_label_set_selectable(GTK_LABEL(id_),t)
    end property

    property TGtkLabel.useMarkup() as gboolean
        return gtk_label_get_use_markup(GTK_LABEL(id_))
    end property

    property TGtkLabel.useMarkup( byval t as gboolean )
        gtk_label_set_use_markup(GTK_LABEL(id_),t)
    end property

    property TGtkLabel.useUnderline() as gboolean
        return gtk_label_get_use_underline(GTK_LABEL(id_))
    end property

    property TGtkLabel.useUnderline( byval t as gboolean )
        gtk_label_set_use_underline(GTK_LABEL(id_),t)
    end property

    property TGtkLabel.angle() as double
        return gtk_label_get_angle(GTK_LABEL(id_))
    end property

    property TGtkLabel.angle( byval i as double )
        gtk_label_set_angle(GTK_LABEL(id_),i)
    end property

    property TGtkLabel.singleLineMode() as gboolean
        return gtk_label_get_single_line_mode(GTK_LABEL(id_))
    end property

    property TGtkLabel.singleLineMode( byval t as gboolean )
        gtk_label_set_single_line_mode(GTK_LABEL(id_),t)
    end property

    property TGtkLabel.currentURI() as string
        return *gtk_label_get_current_uri(GTK_LABEL(id_))
    end property

    property TGtkLabel.trackVisitedLinks() as gboolean
        return gtk_label_get_track_visited_links(GTK_LABEL(id_))
    end property

    property TGtkLabel.trackVisitedLinks( byval t as gboolean )
        gtk_label_set_track_visited_links(GTK_LABEL(id_),t)
    end property

end namespace
