#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkAspectFrame)

    constructor TGtkAspectFrame( byref lbl as string, _
                         byval xalign as single, _
                         byval yalign as single, _
                         byval ratio as single, _
                         byval obey_c as gboolean )
        id_ = gtk_aspect_frame_new(lbl,xalign,yalign,ratio,obey_c)
        init()
    end constructor

    sub TGtkAspectFrame.set( _
                     byval xalign as single, _
                     byval yalign as single, _
                     byval ratio as single, _
                     byval obey_c as gboolean )
        gtk_aspect_frame_set(GTK_ASPECT_FRAME(id_),xalign,yalign,ratio,obey_c)
    end sub

end namespace
