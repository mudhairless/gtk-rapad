

namespace GtkRapad

    type TGtkMenuItem
        public:
            declare constructor( )
            declare constructor( byref _label_ as string )

            declare operator cast() as GtkWidget pointer

            declare sub Associate( byval p as GtkWidget pointer )
            declare sub Destroy()
            declare sub Hide()
            declare sub HideAll()
            declare sub Show()
            declare sub ShowAll()

            declare function GetParent() as GtkWidget pointer
            declare function GetName() as string

            declare sub Activate( byval aMethod as GtkGenericCallback )

            '---------------------------------------

            declare sub SetLabel( byref _label_ as string )
            declare sub SetName( byref newName as string )
            declare sub SetParent( byval p as GtkWidget pointer )
            declare sub SetSubMenu( byval _child_ as GtkWidget pointer )

        private:
            id_ as GtkWidget pointer
            parent_ as GtkWidget pointer    'pointer to our parent object
            gtype_ as string                'GtkWidget type
            objname_ as string

            'mnuContainer as TGtkMenu
    end type


end namespace
