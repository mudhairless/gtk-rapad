namespace GtkRapad

type TGtkTable

    declare constructor( byval w as uinteger = 0, byval h as uinteger = 0, byval homog as gboolean = true )
    declare operator cast() as GtkWidget ptr

    declare sub setSize( byval w as uinteger, byval h as uinteger )
    declare sub getSize( byref w as uinteger, byref h as uinteger )

    declare sub attach overload(     byval c as GtkWidget ptr, _
                             byval l as uinteger, _
                             byval r as uinteger, _
                             byval t as uinteger, _
                             byval b as uinteger, _
                             byval xop as GtkAttachOptions, _
                             byval yop as GtkAttachOptions, _
                             byval xp as uinteger, _
                             byval yp as uinteger )

    declare sub attach( byval c as GtkWidget ptr, _
                         byval l as uinteger, _
                         byval r as uinteger, _
                         byval t as uinteger, _
                         byval b as uinteger )

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()

end type

end namespace
