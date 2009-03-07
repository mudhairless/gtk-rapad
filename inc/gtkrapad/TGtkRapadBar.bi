
namespace GtkRapad

    type TGtkRapadBar

        public:
            declare constructor( )

            declare operator cast() as GtkWidget pointer

            declare sub Associate( byval p as GtkWidget pointer )

            'declare sub AddChild( byval cwid_ as GtkWidget pointer )
            declare sub AddChild( byval cwid_ as TGtkMenuItem )

            declare sub CreateMenu( byval name_ as string, byval label_ as string )
            declare sub CreateMenuChild( byval parent_ as string, byval name_ as string, byval label_ as string, byval aMethod as GtkGenericCallback )
            declare sub CreateMenuAssociation( byval name_ as string, byval item_ as TGtkMenuItem )

            declare function GetMenuAssociationIndex( byval name_ as string ) as integer

            declare sub Show()
            declare sub Hide()
            declare sub ShowAll()
            declare sub HideAll()
            declare sub Destroy()
            declare function GetParent() as GtkWidget Pointer
            declare function GetName() as string

            '---------------------------------------

            declare sub SetEvent( byval ev as TGtkEvents, byval aMethod as GtkGenericCallback )
            declare sub SetParent( byval p as GtkWidget Pointer )
            declare sub SetName(byref newName as string)

        private:
            id_ as GtkWidget Pointer        'pointer to this object
            parent_ as GtkWidget pointer    'pointer to our parent object
            gtype_ as string                'GtkWidget type
            objname_ as string              'name of our object
    end type

end namespace
