namespace GtkRapad

type TGtkVolumeButton

    declare constructor

    declare property value() as double
    declare property value( byval v as double )

    declare operator cast() as GtkWidget ptr

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
