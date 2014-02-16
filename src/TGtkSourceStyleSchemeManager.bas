#ifndef RAPAD_NO_SOURCEVIEW

#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkSourceStyleSchemeManager
        id_ = gtk_source_style_scheme_manager_get_default()
    end constructor

    property TGtkSourceStyleSchemeManager.searchPath() as zstring ptr ptr
        return gtk_source_style_scheme_manager_get_search_path(id_)
    end property

    property TGtkSourceStyleSchemeManager.searchPath( byval z as zstring ptr ptr )
        gtk_source_style_scheme_manager_set_search_path(id_,z)
    end property

    sub TGtkSourceStyleSchemeManager.prependSearchPath( byref t as string )
        gtk_source_style_scheme_manager_prepend_search_path(id_,t)
    end sub

    sub TGtkSourceStyleSchemeManager.appendSearchPath( byref t as string )
        gtk_source_style_scheme_manager_append_search_path(id_,t)
    end sub

    property TGtkSourceStyleSchemeManager.schemeIDs() as zstring ptr ptr
        return gtk_source_style_scheme_manager_get_scheme_ids(id_)
    end property

    function TGtkSourceStyleSchemeManager.get( byref s as string ) as GtkSourceStyleScheme ptr
        return gtk_source_style_scheme_manager_get_scheme(id_,s)
    end function

    sub TGtkSourceStyleSchemeManager.rescan()
        gtk_source_style_scheme_manager_force_rescan(id_)
    end sub

end namespace

#endif
