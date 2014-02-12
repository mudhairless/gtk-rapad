namespace GtkRapad

type TGtkStatusBar

    declare constructor()

    declare function getContextID( byref c as string ) as uinteger

    declare function push( byref msg as string, byval cid as uinteger = 0 ) as uinteger
    declare sub pop( byval cid as uinteger = 0 )

    declare sub remove( byval mid as uinteger, byval cid as uinteger = 0 )
    declare sub clear( byval cid as uinteger = 0 )

    declare sub setHasResizeGrip( byval t as gboolean )
    declare function getHasResizeGrip( ) as gboolean

    declare function getMessageArea() as GtkWidget ptr

    declare operator cast() as GtkWidget ptr

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
