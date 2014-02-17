#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkComboBox)

    constructor TGtkComboBox
        id_ = gtk_combo_box_new()
        init()
    end constructor

    constructor TGtkComboBox( byval w_entry as gboolean )
        id_ = gtk_combo_box_new_with_entry()
        init()
    end constructor

    constructor TGtkComboBox( byval model_ as GtkTreeModel ptr )
        id_ = gtk_combo_box_new_with_model(model_)
        init()
    end constructor

    constructor TGtkComboBox( byval model_ as GtkTreeModel ptr, byval w_entry as gboolean )
        id_ = gtk_combo_box_new_with_model_and_entry(model_)
        init()
    end constructor

    constructor TGtkComboBox( byval i as GtkComboBox ptr )
        id_ = GTK_WIDGET(i)
        init()
    end constructor

    property TGtkComboBox.activeText() as string
        if this.hasEntry = true then
            return *gtk_entry_get_text(GTK_ENTRY(gtk_bin_get_child(GTK_BIN(id_))))
        else
            return ""
        end if
    end property

    property TGtkComboBox.wrapWidth() as integer
        return gtk_combo_box_get_wrap_width(GTK_COMBO_BOX(id_))
    end property

    property TGtkComboBox.wrapWidth( byval i as integer )
        gtk_combo_box_set_wrap_width(GTK_COMBO_BOX(id_),i)
    end property

    property TGtkComboBox.rowSpanCol() as integer
        return gtk_combo_box_get_row_span_column(GTK_COMBO_BOX(id_))
    end property

    property TGtkComboBox.rowSpanCol( byval i as integer )
        gtk_combo_box_set_row_span_column(GTK_COMBO_BOX(id_),i)
    end property

    property TGtkComboBox.colSpanCol() as integer
        return gtk_combo_box_get_column_span_column(GTK_COMBO_BOX(id_))
    end property

    property TGtkComboBox.colSpanCol( byval i as integer )
        gtk_combo_box_set_column_span_column(GTK_COMBO_BOX(id_),i)
    end property

    property TGtkComboBox.active() as integer
        return gtk_combo_box_get_active(GTK_COMBO_BOX(id_))
    end property

    property TGtkComboBox.active( byval i as integer )
        gtk_combo_box_set_active(GTK_COMBO_BOX(id_),i)
    end property

    property TGtkComboBox.model() as GtkTreeModel ptr
        return gtk_combo_box_get_model(GTK_COMBO_BOX(id_))
    end property

    property TGtkComboBox.model( byval i as GtkTreeModel ptr )
        gtk_combo_box_set_model(GTK_COMBO_BOX(id_),i)
    end property

    property TGtkComboBox.addTearoffs() as gboolean
        return gtk_combo_box_get_add_tearoffs(GTK_COMBO_BOX(id_))
    end property

    property TGtkComboBox.addTearoffs( byval t as gboolean )
        gtk_combo_box_set_add_tearoffs(GTK_COMBO_BOX(id_),t)
    end property

    property TGtkComboBox.title() as string
        return *gtk_combo_box_get_title(GTK_COMBO_BOX(id_))
    end property

    property TGtkComboBox.title( byref t as string )
        gtk_combo_box_set_title(GTK_COMBO_BOX(id_),t)
    end property

    property TGtkComboBox.focusOnClick() as gboolean
        return gtk_combo_box_get_focus_on_click(GTK_COMBO_BOX(id_))
    end property

    property TGtkComboBox.focusOnClick( byval t as gboolean )
        gtk_combo_box_set_focus_on_click(GTK_COMBO_BOX(id_),t)
    end property

    property TGtkComboBox.hasEntry() as gboolean
        return gtk_combo_box_get_has_entry(GTK_COMBO_BOX(id_))
    end property

    property TGtkComboBox.entryTextColumn() as integer
        return gtk_combo_box_get_entry_text_column(GTK_COMBO_BOX(id_))
    end property

    property TGtkComboBox.entryTextColumn( byval i as integer )
        gtk_combo_box_set_entry_text_column(GTK_COMBO_BOX(id_),i)
    end property

    property TGtkComboBox.buttonSensitivity() as GtkSensitivityType
        return gtk_combo_box_get_button_sensitivity(GTK_COMBO_BOX(id_))
    end property

    property TGtkComboBox.buttonSensitivity( byval t as GtkSensitivityType )
        gtk_combo_box_set_button_sensitivity(GTK_COMBO_BOX(id_),t)
    end property

    operator TGtkComboBox.cast() as GtkWidget ptr
        return id_
    end operator

end namespace
