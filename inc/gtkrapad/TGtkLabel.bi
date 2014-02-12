namespace GtkRapad

    type TGtkLabel
        public:
            declare constructor( )
            declare constructor( byref contents as string )

            declare operator cast() as GtkWidget pointer
            declare function GetText( ) as string
            declare sub SetText( byref contents as string )

            DECLARE_COMMON_FUNCS()

            COMMON_MEMBERS()
    end type

end namespace
