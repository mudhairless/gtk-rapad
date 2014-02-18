

namespace GtkRapad

    type TGtkMenuBar
        public:
            declare constructor( )

            declare operator cast() as GtkWidget pointer

            declare sub prepend( byref name_ as string, byval wid as GtkWidget ptr )
            declare sub insert( byref name_ as string, byval wid as GtkWidget ptr, byval p as integer )
            declare sub append( byref name_ as string, byval _widget_ as GtkWidget ptr )

            DECLARE_COMMON_FUNCS()

            COMMON_MEMBERS()
    end type

end namespace
