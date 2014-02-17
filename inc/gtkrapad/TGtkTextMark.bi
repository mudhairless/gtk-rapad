namespace GtkRapad

type TGtkTextMark
    declare constructor( byref name_ as string, byval left_gravity as gboolean )
    declare constructor( byval i as GtkTextMark ptr )


    declare property visible() as gboolean
    declare property visible( byval t as gboolean )

    declare property name() as string

    declare property buffer() as GtkTextBuffer ptr

    declare property leftGravity() as gboolean

    declare property deleted() as gboolean

    declare operator cast() as GtkTextMark ptr

    private:
    as GtkTextMark ptr id_
end type

end namespace
