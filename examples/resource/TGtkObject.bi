
namespace GtkRapad

    type TGtkObject

        public:
            declare constructor( )

            declare operator cast() as GtkWidget pointer

            declare sub Associate( byval p as GtkWidget pointer )
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
