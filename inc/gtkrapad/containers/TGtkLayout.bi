namespace GtkRapad

type TGtkLayout
    declare constructor

    declare sub put( byval child as GtkWidget ptr, byval x as uinteger, byval y as uinteger )
    declare sub move( byval child as GtkWidget ptr, byval x as uinteger, byval y as uinteger )

    declare sub setSize( byval w as uinteger, byval h as uinteger )
    declare sub getSize( byref w as uinteger, byref h as uinteger )

    declare property hadjustment() as TGtkAdjustment
    declare property hadjustment( byref t as TGtkAdjustment )

    declare property vadjustment() as TGtkAdjustment
    declare property vadjustment( byref t as TGtkAdjustment )

    declare property binWindow() as GdkWindow ptr

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
