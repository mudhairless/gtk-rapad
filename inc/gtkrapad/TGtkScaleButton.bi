namespace GtkRapad

type TGtkScaleButton

    declare constructor( byval size as GtkIconSize = GTK_ICON_SIZE_INVALID, _
                         byval minimum as double = 0.0, _
                         byval maximum as double = 0.0, _
                         byval step as double = 0.0, _
                         byval icns as zstring ptr ptr = 0 )

    declare property adjustment() as GtkAdjustment ptr
    declare property adjustment( byval a as GtkAdjustment ptr )

    declare property value() as double
    declare property value( byval v as double )

    declare property orientation() as GtkOrientation
    declare property orientation( byval o as GtkOrientation )

    declare property popup() as GtkWidget ptr
    declare property plusButton() as GtkWidget ptr
    declare property minusButton() as GtkWidget ptr

    declare property icons( byval icos as zstring ptr ptr )

    declare operator cast() as GtkWidget ptr

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
