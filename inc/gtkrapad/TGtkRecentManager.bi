namespace GtkRapad

type TGtkRecentInfo
    declare constructor( byval x as GtkRecentInfo ptr )
    declare destructor
    declare property uri() as string
    declare property displayName() as string
    declare property description() as string
    declare property mimeType() as string
    declare property added() as time_t
    declare property modified() as time_t
    declare property visited() as time_t
    declare property isPrivate() as gboolean
    declare property icon() as GdkPixbuf ptr
    declare property shortName() as string
    declare property uriDisplay() as string
    declare property age() as integer
    declare property isLocal() as gboolean
    declare property exists() as gboolean

    private:
    id_ as GtkRecentInfo ptr
end type

type TGtkRecentManager
    declare constructor
    declare constructor( byval for_screen as GdkScreen ptr )

    declare function add( byref uri as string ) as gboolean
    declare function addFull( byref uri as string, byval d as GtkRecentData ptr ) as gboolean

    declare function remove( byref uri as string ) as gboolean

    declare function has( byref uri as string ) as gboolean

    declare function lookup( byref uri as string ) as TGtkRecentInfo

    declare function move( byref olduri as string, byref newuri as string ) as gboolean

    declare property limit() as integer
    declare property limit( byval i as integer )

    declare property items() as GList ptr

    declare function purge() as integer

    private:
    id_ as GtkRecentManager ptr
end type

end namespace
