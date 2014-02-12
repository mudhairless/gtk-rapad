namespace GtkRapad

type TGtkAdjustment
    declare constructor
    declare constructor ( byval x as any ptr )

    declare property value () as double
    declare property value( byval rhs as double )
    declare property lower () as double
    declare property lower( byval rhs as double )
    declare property upper () as double
    declare property upper( byval rhs as double )
    declare property stepIncrement() as double
    declare property stepIncrement( byval rhs as double )
    declare property pageIncrement( ) as double
    declare property pageIncrement( byval rhs as double )
    declare property pageSize( ) as double
    declare property pageSize( byval rhs as double )

    DECLARE_COMMON_FUNCS()

    declare operator cast() as GtkObject ptr
private:
    COMMON_MEMBERS()
end type

type TGtkScrollable

    declare constructor()
    declare sub setScrollBarPolicy( byval h as GtkPolicyType, byval v as GtkPolicyType )
    declare sub setSize(byval w_ as integer = -1, byval h_ as integer = -1)

    declare function getHadjustment() as TGtkAdjustment ptr
    declare function getVadjustment() as TGtkAdjustment ptr

    declare operator cast() as GtkWidget ptr
    declare destructor

    DECLARE_COMMON_FUNCS()

    private:
    hadj_ as TGtkAdjustment ptr
    vadj_ as TGtkAdjustment ptr
    COMMON_MEMBERS()
end type

end namespace
