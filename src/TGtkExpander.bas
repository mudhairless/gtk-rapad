#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkExpander)

    constructor TGtkExpander ( byref lbl as string = "" )
        id_ = gtk_expander_new_with_mnemonic(lbl)
        init()
    end constructor

    property TGtkExpander.expanded() as gboolean
        return gtk_expander_get_expanded(GTK_EXPANDER(id_))
    end property

    property TGtkExpander.expanded( byval t as gboolean )
        gtk_expander_set_expanded(GTK_EXPANDER(id_),t)
    end property

    property TGtkExpander.spacing() as integer
        return gtk_expander_get_spacing(GTK_EXPANDER(id_))
    end property

    property TGtkExpander.spacing( byval v as integer )
        gtk_expander_set_spacing(GTK_EXPANDER(id_),v)
    end property

    property TGtkExpander.text() as string
        return *gtk_expander_get_label(GTK_EXPANDER(id_))
    end property

    property TGtkExpander.text( byref t as string )
        gtk_expander_set_label(GTK_EXPANDER(id_),t)
    end property

    property TGtkExpander.useUnderline() as gboolean
        return gtk_expander_get_use_underline(GTK_EXPANDER(id_))
    end property

    property TGtkExpander.useUnderline( byval t as gboolean )
        gtk_expander_set_use_underline(GTK_EXPANDER(id_),t)
    end property

    property TGtkExpander.useMarkup() as gboolean
        return gtk_expander_get_use_markup(GTK_EXPANDER(id_))
    end property

    property TGtkExpander.useMarkup( byval t as gboolean )
        gtk_expander_set_use_markup(GTK_EXPANDER(id_),t)
    end property

    property TGtkExpander.label() as GtkWidget ptr
        return gtk_expander_get_label_widget(GTK_EXPANDER(id_))
    end property

    property TGtkExpander.label( byval l as GtkWidget ptr )
        gtk_expander_set_label_widget(GTK_EXPANDER(id_),l)
    end property

    property TGtkExpander.labelFill() as gboolean
        return gtk_expander_get_label_fill(GTK_EXPANDER(id_))
    end property

    property TGtkExpander.labelFill( byval t as gboolean )
        gtk_expander_set_label_fill(GTK_EXPANDER(id_),t)
    end property

    operator TGtkExpander.cast() as GtkWidget ptr
        return id_
    end operator

end namespace
