#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkVBox)

    constructor TGtkVBox( )
        id_ = gtk_vbox_new( 0, 0 )
        init()
    end constructor

    constructor TGtkVBox( byval homog as gboolean, byval spacing_ as integer )
        id_ = gtk_vbox_new( homog, spacing_ )
        init()
    end constructor

    operator TGtkVBox.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkVBox.AddChild( byval child_ as GtkWidget pointer, byval expand_ as gboolean, byval fill_ as gboolean, byval pad_ as integer)
        gtk_box_pack_start( GTK_BOX( id_ ), child_, expand_, fill_, pad_ )
    end sub

    sub TGtkVBox.AddChildEnd( byval child_ as GtkWidget pointer, byval expand_ as gboolean, byval fill_ as gboolean, byval pad_ as integer)
        gtk_box_pack_end( GTK_BOX( id_ ), child_, expand_, fill_, pad_ )
    end sub

end namespace
