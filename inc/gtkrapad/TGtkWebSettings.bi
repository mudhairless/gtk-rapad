namespace GtkRapad

type TGtkWebSettings

    declare constructor
    declare constructor( byval i as WebKitWebSettings ptr )

    declare operator cast() as WebKitWebSettings ptr

    DECLARE_OBJECT_FUNCS()

    private:
    id_ as WebKitWebSettings ptr

end type

end namespace
