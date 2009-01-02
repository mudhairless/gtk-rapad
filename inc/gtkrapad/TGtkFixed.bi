
'
'gtk_fixed_move     -move a child widget
'
'
'
namespace GtkRapad

    type TGtkFixed

        public:
            declare constructor()

            declare operator cast() as GtkWidget pointer

            declare sub Associate( byval p as GtkWidget pointer )
            declare sub Destroy()
            declare sub Hide()
            declare sub HideAll()
            declare sub Show()
            declare sub ShowAll()

            declare function GetParent() as GtkWidget Pointer
            declare function GetName() as string

            '---------------------------------------

            declare sub MoveChild( byval obj as GtkWidget Pointer, byval x as integer, byval y as integer )
            declare sub SetName( byref newName as string )
            declare sub SetParent( byval p as GtkWidget Pointer )

        private:
            id_ as GtkWidget Pointer        'pointer to this object
            parent_ as GtkWidget pointer    'pointer to our parent object
            gtype_ as string                'GtkWidget type
            objname_ as string
    end type

end namespace
