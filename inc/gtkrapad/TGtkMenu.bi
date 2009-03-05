

namespace GtkRapad

    type TGtkMenu
        public:
            declare constructor()

            declare operator cast() as GtkWidget pointer

            declare sub Associate( byval p as GtkWidget pointer )
            declare sub Destroy()
            declare sub Hide()
            declare sub HideAll()
            declare sub Show()
            declare sub ShowAll()

            'declare function GetParent() as GtkWidget pointer
            'declare function GetName() as string

            declare sub AddChild( byval pGtkChild as GtkWidget pointer )

            '---------------------------------------

            declare sub SetName( byref newName as string )
            declare sub SetParent( byval p as GtkWidget pointer )

        private:
            gtype_ as string                'GtkWidget type
            id_ as GtkWidget pointer
            objname_ as string
            parent_ as GtkWidget pointer    'pointer to our parent object
    end type

end namespace
