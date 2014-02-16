#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkRecentManager
        id_ = gtk_recent_manager_get_default()
    end constructor

    constructor TGtkRecentManager( byval for_screen as GdkScreen ptr )
        id_ = gtk_recent_manager_get_for_screen(for_screen)
    end constructor

    function TGtkRecentManager.add( byref uri as string ) as gboolean
        return gtk_recent_manager_add_item(id_,uri)
    end function

    function TGtkRecentManager.addFull( byref uri as string, byval d as GtkRecentData ptr ) as gboolean
        return gtk_recent_manager_add_full(id_,uri,d)
    end function

    function TGtkRecentManager.remove( byref uri as string ) as gboolean
        return gtk_recent_manager_remove_item(id_,uri,0)
    end function

    function TGtkRecentManager.has( byref uri as string ) as gboolean
        return gtk_recent_manager_has_item(id_,uri)
    end function

    function TGtkRecentManager.lookup( byref uri as string ) as TGtkRecentInfo
        return TGtkRecentInfo(gtk_recent_manager_lookup_item(id_,uri,0))
    end function

    function TGtkRecentManager.move( byref olduri as string, byref newuri as string ) as gboolean
        return gtk_recent_manager_move_item(id_,olduri,newuri,0)
    end function

    property TGtkRecentManager.limit() as integer
        return gtk_recent_manager_get_limit(id_)
    end property

    property TGtkRecentManager.limit( byval i as integer )
        gtk_recent_manager_set_limit(id_,i)
    end property

    property TGtkRecentManager.items() as GList ptr
        return gtk_recent_manager_get_items(id_)
    end property

    function TGtkRecentManager.purge() as integer
        return gtk_recent_manager_purge_items(id_,0)
    end function

end namespace
