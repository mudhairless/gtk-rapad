#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkRecentChooserDialog)

    RECENT_CHOOSER_COMMON(TGtkRecentChooserDialog)

    constructor TGtkRecentChooserDialog( byref title_ as string = "Recent Documents" )
        id_ = gtk_recent_chooser_dialog_new_for_manager(title_,0,gtk_recent_manager_get_default(),0,0)
        init()
    end constructor

    function TGtkRecentChooserDialog.addButton( byref btext as string, byval rid as integer ) as GtkWidget ptr
        return gtk_dialog_add_button(GTK_DIALOG(id_),btext,rid)
    end function

    property TGtkRecentChooserDialog.defaultResponse( byval r as integer )
        gtk_dialog_set_default_response(GTK_DIALOG(id_),r)
    end property

    function TGtkRecentChooserDialog.run() as integer
        return gtk_dialog_run(GTK_DIALOG(id_))
    end function

end namespace
