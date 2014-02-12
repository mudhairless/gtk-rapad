#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkHBox)

    constructor TGtkHBox( )
        id_ = gtk_hbox_new( 0, 0 )
        init()
    end constructor

    constructor TGtkHBox( byval homog as gboolean, byval spacing_ as integer )
        id_ = gtk_hbox_new( homog, spacing_ )
        init()
    end constructor

    operator TGtkHBox.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkHBox.AddChild( byval child_ as GtkWidget pointer, byval expand_ as gboolean, byval fill_ as gboolean, byval pad_ as integer)
        gtk_box_pack_start( GTK_BOX( id_ ), child_, expand_, fill_, pad_ )
    end sub

    sub TGtkHBox.AddChildEnd( byval child_ as GtkWidget pointer, byval expand_ as gboolean, byval fill_ as gboolean, byval pad_ as integer)
        gtk_box_pack_end( GTK_BOX( id_ ), child_, expand_, fill_, pad_ )
    end sub

end namespace
