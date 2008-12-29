namespace GtkRapad

type TGtkMenuBar
    public:
    declare constructor( )

    declare sub AddMenu( byref name_ as string, byval _widget_ as GtkWidget ptr )

    declare sub SetParent( byval _widget_ as GtkWidget ptr )

    private:
    id_ as GtkWidget ptr
    parent_ as GtkWidget ptr

end type

end namespace
