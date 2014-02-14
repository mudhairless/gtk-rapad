namespace GtkRapad

type TGtkFrame

    declare constructor( byref l as string = "" )
    declare operator cast() as GtkWidget ptr

    declare property label() as string
    declare property label( byref l as string )

    declare sub getAlignment( byref x as single = 0.0f, byref y as single = 0.0f )
    declare sub setAlignment( byval x as single = 0.0f, byval y as single = 0.0f )

    declare property shadowType() as GtkShadowType
    declare property shadowType( byval s as GtkShadowType )

    declare function getLabelWidget() as GtkWidget ptr

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
