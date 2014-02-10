

namespace GtkRapad

    type TGtkMenuBar
        public:
            declare constructor( )

            declare operator cast() as GtkWidget pointer

            declare sub Associate( byval p as GtkWidget pointer )
            declare sub Destroy()
            declare sub Hide()
            declare sub HideAll()
            declare sub Show()
            declare sub ShowAll()

            declare function GetParent() as GtkWidget pointer
            declare function GetName() as string

            declare sub AddMenuMain( byref key_ as string, byval label_ as string )
            declare sub AddMenuSub( byref pkey_ as string, byref key_ as string, byref label_ as string, byval aMethod as GtkGenericCallback )

            declare sub AddMenu( byref name_ as string, byval _widget_ as GtkWidget pointer )

            '---------------------------------------

            declare sub SetName( byref newName as string )
            declare sub SetParent( byval p as GtkWidget pointer )

        private:
            mnu_(31) as GtkWidget pointer   '32 main menus
            id_ as GtkWidget pointer
            parent_ as GtkWidget pointer    'pointer to our parent object
            gtype_ as string                'GtkWidget type
            objname_ as string
    end type

end namespace
