namespace GtkRapad

type TGtkAspectFrame

    declare constructor( byref lbl as string, _
                         byval xalign as single, _
                         byval yalign as single, _
                         byval ratio as single, _
                         byval obey_c as gboolean _
                         )

    declare sub set( _
                     byval xalign as single, _
                     byval yalign as single, _
                     byval ratio as single, _
                     byval obey_c as gboolean _
                     )

    declare operator cast() as GtkWidget ptr

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
