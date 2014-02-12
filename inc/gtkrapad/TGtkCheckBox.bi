namespace GtkRapad

    type TGtkCheckBox
        public:
            declare constructor()
            declare constructor( byref label_ as string )

            declare operator cast() as GtkWidget pointer
            declare function GetLabel() as string
            declare function IsChecked() as gboolean

            '---------------------------------------

            declare sub SetChecked( byval b as gboolean )
            declare sub SetEvent( byval ev as TGtkEvents, byval aMethod as gtkGenericCallback )
            declare sub SetLabel( byref label_ as string )

            DECLARE_COMMON_FUNCS()

        COMMON_MEMBERS()

    end type
end namespace
