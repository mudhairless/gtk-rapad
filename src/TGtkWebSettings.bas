#ifndef RAPAD_NO_WEBVIEW

#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    OBJECT_FUNCS(TGtkWebSettings)

    constructor TGtkWebSettings
        id_ = webkit_web_settings_new()
    end constructor

    constructor TGtkWebSettings( byval i as WebKitWebSettings ptr )
        id_ = webkit_web_settings_copy(i)
    end constructor

    operator TGtkWebSettings.cast() as WebKitWebSettings ptr
        return id_
    end operator

end namespace

#endif
