namespace GtkRapad

type TGtkTextTagTable

    declare constructor
    declare constructor( byval i as GtkTextTagTable ptr )

    declare sub add( byref t as TGtkTextTag )
    declare sub remove( byref t as TGtkTextTag )
    declare function lookup( byref n as string ) as TGtkTextTag ptr

    declare function length() as integer

    declare operator cast() as GtkTextTagTable ptr

    private:
    id_ as GtkTextTagTable ptr

end type

end namespace
