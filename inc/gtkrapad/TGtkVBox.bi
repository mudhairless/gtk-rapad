
namespace GtkRapad

    type TGtkVBox
        public:
            declare constructor ( )
            declare constructor ( byval homog as gboolean, byval spacing_ as integer )

            declare operator cast() as GtkWidget pointer

            declare sub AddChild( byval child_ as GtkWidget pointer, byval expand_ as gboolean, byval fill_ as gboolean, byval pad_ as integer)
            declare sub AddChildEnd( byval child_ as GtkWidget pointer, byval expand_ as gboolean, byval fill_ as gboolean, byval pad_ as integer)

            DECLARE_COMMON_FUNCS()

            COMMON_MEMBERS()
    end type

end namespace
