
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
            declare sub Show()
            declare sub Hide()
            declare sub ShowAll()
            declare sub HideAll()
            declare sub Destroy()
            declare sub SetParent( byval p as GtkWidget Pointer )
            declare function GetParent() as GtkWidget Pointer

            '---------------------------------------

            declare sub MoveChild( byval obj as GtkWidget Pointer, byval x as integer, byval y as integer )

        private:
            id_ as GtkWidget Pointer        'pointer to this object
            parent_ as GtkWidget pointer    'pointer to our parent object
            gtype_ as string                'GtkWidget type
    end type

end namespace
