namespace GtkRapad

type TGtkStatusIcon

    declare constructor
    declare constructor( byref ico_fn as string )

    declare sub setIconFromPixbuf( byval pb as GdkPixbuf ptr )
    declare sub setIconFromFile( byref ico_fn as string )
    declare sub setIconFromStock( byref s as string )
    declare sub setIconFromIconName( byref i as string )
    declare sub setIconFromIcon( byval i as GIcon ptr )

    declare function storageType() as GtkImageType

    declare function getPixbuf() as GdkPixbuf ptr
    declare function getStock() as string
    declare function getIconName() as string
    declare function getIcon() as GIcon ptr

    declare property screen() as GdkScreen ptr
    declare property screen( byval s as GdkScreen ptr )

    declare property title() as string
    declare property title( byref t as string )

    declare property name( byref t as string )

    declare property visible() as gboolean
    declare property visible( byval t as gboolean )

    private:
        _s as GtkStatusIcon ptr
end type

end namespace
