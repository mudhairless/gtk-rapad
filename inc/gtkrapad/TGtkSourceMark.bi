namespace GtkRapad

type TGtkSourceMark
    declare constructor( byref name_ as string, byref cat_ as string )
    declare constructor( byval i as GtkSourceMark ptr )

    declare property category() as string

    declare function nextMark( byref cat_ as string = "" ) as GtkSourceMark ptr
    declare function prevMark( byref cat_ as string = "" ) as GtkSourceMark ptr

    declare operator cast() as GtkSourceMark ptr

    DECLARE_TEXT_MARK_COMMON()

    private:
        id_ as GtkSourceMark ptr
end type

end namespace
