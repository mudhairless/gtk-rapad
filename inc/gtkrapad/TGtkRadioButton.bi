namespace GtkRapad

    type TGtkRadioButton
        public:
            declare constructor()
            declare constructor( byref label as string )

            declare operator cast() as GtkWidget pointer

            declare sub Associate( byval p as GtkWidget pointer )
            declare sub Destroy()
            declare sub Group( byval wid as GtkWidget pointer )
            declare sub Hide()
            declare sub HideAll()
            declare sub Show()
            declare sub ShowAll()

            declare function GetLabel( ) as string
            declare function GetName() as string
            declare function GetParent() as GtkWidget pointer
            declare function IsChecked() as gboolean

            '---------------------------------------

            declare sub SetChecked( byval b as gboolean )
            declare sub SetEvent( byval ev as TGtkEvents, byval aMethod as gtkGenericCallback )
            declare sub SetLabel( byref label as string )
            declare sub SetName( byref newName as string )
            declare sub SetParent( byval p as GtkWidget pointer )

        private:
            gtype_ as string                'GtkWidget type
            id_ as GtkWidget pointer        'pointer to this object
            list_ as GSList pointer
            objname_ as string
            parent_ as GtkWidget pointer    'pointer to our parent object
    end type

end namespace
