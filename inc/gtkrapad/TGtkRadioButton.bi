namespace GtkRapad

    type TGtkRadioButton
        public:
            declare constructor()
            declare constructor( byref label as string )
            declare constructor( byref t as TGtkRadioButton )
            declare constructor( byval t as TGtkRadioButton, byref label as string )

            declare operator cast() as GtkWidget pointer

            declare function GetLabel( ) as string
            declare function IsChecked() as gboolean

            declare sub SetChecked( byval b as gboolean )
            declare sub SetEvent( byval ev as TGtkEvents, byval aMethod as gtkGenericCallback )
            declare sub SetLabel( byref label as string )

            declare property group() as GSList ptr
            declare property group( byval g as GSList ptr )

            DECLARE_COMMON_FUNCS()

        private:
            list_ as GSList pointer
            COMMON_MEMBERS()
    end type

end namespace
