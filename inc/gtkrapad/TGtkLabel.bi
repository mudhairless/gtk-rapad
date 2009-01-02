namespace GtkRapad

    type TGtkLabel
        public:
            declare constructor( )
            declare constructor( byref contents as string )

            declare operator cast() as GtkWidget pointer
            declare sub Associate( byval p as GtkWidget pointer )
            declare sub Destroy()
            declare sub Hide()
            declare sub HideAll()
            declare sub Show()
            declare sub ShowAll()

            declare function GetParent() as GtkWidget Pointer
            declare function GetName() as string
            declare function GetText( ) as string

            '---------------------------------------

            declare sub SetName( byref newName as string )
            declare sub SetParent( byval p as GtkWidget Pointer )
            declare sub SetText( byref contents as string )

        private:
            id_ as GtkWidget Pointer        'pointer to this object
            parent_ as GtkWidget pointer    'pointer to our parent object
            gtype_ as string                'GtkWidget type
            objname_ as string
    end type

end namespace
