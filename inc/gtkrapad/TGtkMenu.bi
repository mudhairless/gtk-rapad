

namespace GtkRapad

    type TGtkMenu
        public:
            declare constructor()

            declare operator cast() as GtkWidget pointer

            declare sub AddChild( byval pGtkChild as GtkWidget pointer )

            DECLARE_COMMON_FUNCS()

            COMMON_MEMBERS()
    end type

end namespace
