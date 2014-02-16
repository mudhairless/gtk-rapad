namespace GtkRapad

type TGtkSourceStyleSchemeManager
    declare constructor()

    declare property searchPath() as zstring ptr ptr
    declare property searchPath( byval z as zstring ptr ptr )
    declare sub prependSearchPath( byref t as string )
    declare sub appendSearchPath( byref t as string )

    declare property schemeIDs() as zstring ptr ptr

    declare function get( byref s as string ) as GtkSourceStyleScheme ptr

    declare sub rescan()

    private:
    id_ as GtkSourceStyleSchemeManager ptr
end type

end namespace
