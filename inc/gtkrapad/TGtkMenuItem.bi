namespace GtkRapad

type TGtkMenuItem
    public:
    declare constructor( )
    declare constructor( byref _label_ as string )

    declare sub SetLabel( byref _label_ as string )

    declare sub SetSubMenu( byval _child_ as GtkWidget ptr )

    declare sub Activate( byval aMethod as gtkGenericCallback, byval x as any ptr = 0 )

    declare operator cast() as GtkWidget ptr
    private:
    id_ as GtkWidget ptr

end type


end namespace
