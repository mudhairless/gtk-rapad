namespace GtkRapad

type TGtkImage

    declare constructor()
    declare constructor( byref filen_ as string )
    declare constructor( byval pb as GdkPixbuf ptr )
    declare constructor( byval im as GdkImage ptr, byval bm as GdkBitmap ptr )
    declare constructor( byval pm as GdkPixmap ptr, byval bm as GdkBitmap ptr )
    declare constructor( byref stock_n as string, byval s as GtkIconSize )
    declare constructor( byval ics as GtkIconSet ptr, byval s as GtkIconSize )
    declare constructor( byval ic as GIcon ptr, byval s as GtkIconSize )
    declare constructor( byval anim as GdkPixbufAnimation ptr )

    declare sub setFromFile( byref filen_ as string )
    declare sub setFromPixbuf( byval pb as GdkPixbuf ptr )
    declare sub setFromImage( byval im as GdkImage ptr, byval bm as GdkBitmap ptr )
    declare sub setFromPixmap( byval pm as GdkPixmap ptr, byval bm as GdkBitmap ptr )
    declare sub setFromStock( byref stock_n as string, byval s as GtkIconSize )
    declare sub setFromIcon( byval ic as GIcon ptr, byval s as GtkIconSize )
    declare sub setFromIconSet( byval ics as GtkIconSet ptr, byval s as GtkIconSize )
    declare sub setFromIconName( byref icn as string, byval s as GtkIconSize )
    declare sub setFromAnimation( byval anim as GdkPixbufAnimation ptr )

    declare function getPixbuf() as GdkPixbuf ptr
    declare function getImage( byval bm as GdkBitmap ptr ptr ) as GdkImage ptr
    declare function getPixmap( byval bm as GdkBitmap ptr ptr ) as GdkPixmap ptr
    declare function getStock( byref s as GtkIconSize ) as string
    declare function getIcon( byref s as GtkIconSize ) as GIcon ptr
    declare function getIconSet( byref s as GtkIconSize ) as GtkIconSet ptr
    declare function getIconName( byref s as GtkIconSize ) as string
    declare function getAnimation() as GdkPixbufAnimation ptr

    declare function getStorageType() as GtkImageType

    declare operator cast() as GtkWidget ptr

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
