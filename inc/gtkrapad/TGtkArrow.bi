namespace GtkRapad

type TGtkArrow
    declare constructor( byval a as GtkArrowType = GTK_ARROW_NONE, byval s as GtkShadowType = GTK_SHADOW_NONE )

    declare operator cast() as GtkWidget ptr

    declare sub set( byval a as GtkArrowType, byval s as GtkShadowType = GTK_SHADOW_NONE )

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
