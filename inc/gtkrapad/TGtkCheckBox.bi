namespace GtkRapad

    type TGtkCheckBox
        public:
            declare constructor()
            declare constructor( byref label_ as string )

            declare operator cast() as GtkWidget pointer
            declare sub Associate( byval p as GtkWidget pointer )
            declare sub Destroy()
            declare sub Hide()
            declare sub HideAll()
            declare sub Show()
            declare sub ShowAll()
            declare function GetLabel() as string
            declare function GetName() as string
            declare function GetParent() as GtkWidget Pointer
            declare function IsChecked() as gboolean

            '---------------------------------------

            declare sub SetChecked( byval b as gboolean )
            declare sub SetEvent( byval ev as TGtkEvents, byval aMethod as gtkGenericCallback )
            declare sub SetLabel( byref label_ as string )
            declare sub SetName( byref newName as string )
            declare sub SetParent( byval p as GtkWidget Pointer )

        private:
            id_ as GtkWidget Pointer        'pointer to this object
            parent_ as GtkWidget pointer    'pointer to our parent object
            gtype_ as string                'GtkWidget type
            objname_ as string
    end type
end namespace
