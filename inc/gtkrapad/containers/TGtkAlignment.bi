namespace GtkRapad

type TGtkAlignment

    declare constructor(  byval xalign as uinteger = 0, _
                            byval yalign as uinteger = 0, _
                            byval xscale as uinteger = 0, _
                            byval yscale as uinteger = 0 )

    declare sub set(        byval xalign as uinteger = 0, _
                            byval yalign as uinteger = 0, _
                            byval xscale as uinteger = 0, _
                            byval yscale as uinteger = 0 )

    declare sub setPadding( byval xalign as uinteger = 0, _
                            byval yalign as uinteger = 0, _
                            byval xscale as uinteger = 0, _
                            byval yscale as uinteger = 0 )

    declare sub getPadding( byref xalign as uinteger, _
                            byref yalign as uinteger, _
                            byref xscale as uinteger, _
                            byref yscale as uinteger )

    declare operator cast() as GtkWidget ptr

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
