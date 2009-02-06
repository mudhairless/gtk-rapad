


#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGdkScreen
        id_ = gdk_screen_get_default()
    end constructor

    operator TGdkScreen.cast() as GdkScreen Pointer
        return id_
    end operator

    function TGdkScreen.GetHeight() as integer
        return gdk_screen_get_height( id_ )
    end function

    function TGdkScreen.GetWidth() as integer
        return gdk_screen_get_width( id_ )
    end function

end namespace
