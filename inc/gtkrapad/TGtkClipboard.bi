namespace GtkRapad

type TGtkClipboard

    declare constructor()
    declare constructor( byval d as GdkDisplay ptr )

    declare property display() as GdkDisplay ptr

    declare sub clear()

    declare property text( byref t as string )
    declare property text() as string

    declare property image( byval i as GdkPixbuf ptr )
    declare property image() as GdkPixbuf ptr

    declare sub store()

    private:
    as GtkClipboard ptr id_
end type

end namespace
