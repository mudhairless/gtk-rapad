

namespace GtkRapad

    type TGtkMenuBar
        public:
            declare constructor( )

            declare operator cast() as GtkWidget pointer

            declare sub prepend overload( byref name_ as string, byval wid as GtkWidget ptr )
            declare sub prepend( byval t as GtkWidget ptr )

            declare sub insert overload( byref name_ as string, byval wid as GtkWidget ptr, byval p as integer )
            declare sub insert( byval t as GtkWidget ptr, byval p as integer )

            declare sub append overload( byref name_ as string, byval _widget_ as GtkWidget ptr )
            declare sub append( byval t as GtkWidget ptr )

            DECLARE_COMMON_FUNCS()

            COMMON_MEMBERS()
    end type

end namespace
