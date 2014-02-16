#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkRecentInfo( byval x as GtkRecentInfo ptr )
        id_ = x
    end constructor

    destructor TGtkRecentInfo
        gtk_recent_info_unref(id_)
    end destructor

    property TGtkRecentInfo.uri() as string
        return *gtk_recent_info_get_uri(id_)
    end property

    property TGtkRecentInfo.displayName() as string
        return *gtk_recent_info_get_display_name(id_)
    end property

    property TGtkRecentInfo.description() as string
        return *gtk_recent_info_get_description(id_)
    end property

    property TGtkRecentInfo.mimeType() as string
        return *gtk_recent_info_get_mime_type(id_)
    end property

    property TGtkRecentInfo.added() as time_t
        return gtk_recent_info_get_added(id_)
    end property

    property TGtkRecentInfo.modified() as time_t
        return gtk_recent_info_get_modified(id_)
    end property

    property TGtkRecentInfo.visited() as time_t
        return gtk_recent_info_get_visited(id_)
    end property

    property TGtkRecentInfo.isPrivate() as gboolean
        return gtk_recent_info_get_private_hint(id_)
    end property

    property TGtkRecentInfo.icon() as GdkPixbuf ptr
        return gtk_recent_info_get_icon(id_,32)
    end property

    property TGtkRecentInfo.shortName() as string
        return *gtk_recent_info_get_short_name(id_)
    end property

    property TGtkRecentInfo.uriDisplay() as string
        return *gtk_recent_info_get_uri_display(id_)
    end property

    property TGtkRecentInfo.age() as integer
        return gtk_recent_info_get_age(id_)
    end property

    property TGtkRecentInfo.isLocal() as gboolean
        return gtk_recent_info_is_local(id_)
    end property

    property TGtkRecentInfo.exists() as gboolean
        return gtk_recent_info_exists(id_)
    end property

end namespace
