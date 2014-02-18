#ifndef RAPAD_NO_WEBKIT
#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkWebView)

    constructor TGtkWebView
        id_ = webkit_web_view_new()
        init()
    end constructor

    operator TGtkWebView.cast() as GtkWidget ptr
        return id_
    end operator

    property TGtkWebView.uri() as string
        return *webkit_web_view_get_uri(cast(WebKitWebView ptr,id_))
    end property

    property TGtkWebView.uri( byref t as string )
        webkit_web_view_load_uri(cast(WebKitWebView ptr,id_),t)
    end property

end namespace

#endif
