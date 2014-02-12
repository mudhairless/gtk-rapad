

namespace GtkRapad

    type TGtkMenuItem
        public:
            declare constructor( )
            declare constructor( byref _label_ as string )

            declare operator cast() as GtkWidget pointer
            declare sub Activate( byval aMethod as GtkGenericCallback )

            declare sub SetLabel( byref _label_ as string )
            declare sub SetSubMenu( byval _child_ as GtkWidget pointer )

            DECLARE_COMMON_FUNCS()

            COMMON_MEMBERS()

    end type


end namespace
