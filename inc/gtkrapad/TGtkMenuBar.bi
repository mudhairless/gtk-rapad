

namespace GtkRapad

    type TGtkMenuBar
        public:
            declare constructor( )

            declare operator cast() as GtkWidget pointer

            declare sub AddMenuMain( byref key_ as string, byval label_ as string )
            declare sub AddMenuSub( byref pkey_ as string, byref key_ as string, byref label_ as string, byval aMethod as GtkGenericCallback )

            declare sub AddMenu( byref name_ as string, byval _widget_ as GtkWidget pointer )

            DECLARE_COMMON_FUNCS()

        private:
            mnu_(31) as GtkWidget pointer   '32 main menus
            COMMON_MEMBERS()
    end type

end namespace
