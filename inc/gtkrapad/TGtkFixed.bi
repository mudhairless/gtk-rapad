
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

            declare sub MoveChild( byval obj as GtkWidget Pointer, byval x as integer, byval y as integer )

      DECLARE_COMMON_FUNCS()

      COMMON_MEMBERS()
    end type

end namespace
