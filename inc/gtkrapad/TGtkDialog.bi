
#macro DECLARE_DIALOG_COMMON()
    declare function run() as integer
    declare sub response( byval as integer )
    declare function addButton( byref label_ as string, byval rid as integer ) as GtkWidget ptr
    declare sub addActionWidget( byval x as GtkWidget ptr, byval rid as integer )
    declare property hasSeparator() as gboolean
    declare property hasSeparator( byval t as gboolean )
    declare property default( byval i as integer )
    declare property actionArea() as GtkWidget ptr
    declare property contentArea() as GtkWidget ptr
#endmacro

#macro DIALOG_COMMON(cname)
    function cname.run() as integer
        return gtk_dialog_run(GTK_DIALOG(id_))
    end function

    sub cname.response( byval i as integer )
        gtk_dialog_response(GTK_DIALOG(id_),i)
    end sub

    function cname.addButton( byref label_ as string, byval rid as integer ) as GtkWidget ptr
        return gtk_dialog_add_button(GTK_DIALOG(id_),label_,rid)
    end function

    sub cname.addActionWidget( byval x as GtkWidget ptr, byval rid as integer )
        gtk_dialog_add_action_widget(GTK_DIALOG(id_),x,rid)
    end sub

    property cname.hasSeparator() as gboolean
        return gtk_dialog_get_has_separator(GTK_DIALOG(id_))
    end property

    property cname.hasSeparator( byval t as gboolean )
        gtk_dialog_set_has_separator(GTK_DIALOG(id_),t)
    end property

    property cname.default( byval i as integer )
        gtk_dialog_set_default_response(GTK_DIALOG(id_),i)
    end property

    property cname.actionArea() as GtkWidget ptr
        return gtk_dialog_get_action_area(GTK_DIALOG(id_))
    end property

    property cname.contentArea() as GtkWidget ptr
        return gtk_dialog_get_content_area(GTK_DIALOG(id_))
    end property
#endmacro

namespace GtkRapad

type TGtkDialog

    declare constructor
    declare operator cast() as GtkWidget ptr

    DECLARE_DIALOG_COMMON()

    DECLARE_COMMON_FUNCS()
    COMMON_MEMBERS()
end type

end namespace
