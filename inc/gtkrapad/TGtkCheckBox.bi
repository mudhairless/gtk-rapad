namespace GtkRapad

    type TGtkCheckBox
        public:
            declare constructor()
            declare constructor( byref label_ as string )

            declare operator cast() as GtkWidget pointer

            DECLARE_BUTTON_COMMON()

            DECLARE_TOGGLE_BUTTON_COMMON()

            declare sub SetEvent( byval ev as TGtkEvents, byval aMethod as gtkGenericCallback )

            DECLARE_COMMON_FUNCS()

        COMMON_MEMBERS()

    end type
end namespace
