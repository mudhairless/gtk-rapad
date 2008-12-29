namespace GtkRapad

    type TGtkRadioButton
        public:
            declare constructor()
            declare constructor( byref label as string )

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

            declare sub SetLabel( byref label as string )
            declare function GetLabel( ) as string

            declare sub SetChecked( byval b as gboolean )
            declare function isChecked() as gboolean

            declare sub Group( byval wid as GtkWidget ptr )

            declare sub SetEvent( byval ev as TGtkEvents, byval aMethod as gtkGenericCallback )

        private:
            id_ as GtkWidget Pointer        'pointer to this object
            parent_ as GtkWidget pointer    'pointer to our parent object
            gtype_ as string                'GtkWidget type
            list_ as GSList pointer
    end type

end namespace
