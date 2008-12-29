namespace GtkRapad

    type TGtkCheckBox
        public:
            declare constructor()
            declare constructor( byref label_ as string )

            declare operator cast() as GtkWidget pointer
            declare sub Associate( byval p as GtkWidget pointer )
            declare sub Show()
            declare sub Hide()
            declare sub ShowAll()
            declare sub HideAll()
            declare sub Destroy()
            declare sub SetParent( byval p as GtkWidget Pointer )
            declare function GetParent() as GtkWidget Pointer

            '---------------------------------------

            declare sub SetLabel( byref label_ as string )
            declare function GetLabel() as string

            declare sub SetEvent( byval ev as TGtkEvents, byval aMethod as gtkGenericCallback)
            declare sub SetChecked( byval b as gboolean )

            declare function isChecked() as gboolean

        private:
            id_ as GtkWidget Pointer        'pointer to this object
            parent_ as GtkWidget pointer    'pointer to our parent object
            gtype_ as string                'GtkWidget type
    end type
end namespace
