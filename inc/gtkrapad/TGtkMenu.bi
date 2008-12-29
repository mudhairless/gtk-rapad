namespace GtkRapad

type TGtkMenu
    public:
    declare constructor( )

    declare sub AddChild( byval _child_ as GtkWidget ptr )

    declare operator cast() as GtkWidget ptr

    private:
    id_ as GtkWidget ptr

end type

end namespace
