
namespace GtkRapad

    type TGtkButton

        public:
            declare constructor( )
            declare constructor( byref _caption_ as string )
            declare constructor( byref stock_id as string, byval t as gboolean )

            declare operator cast() as GtkWidget pointer

            declare property label() as string
            declare property label( byref newCaption as string )

            declare property relief() as GtkReliefStyle
            declare property relief( byval t as GtkReliefStyle )

            declare property useStock() as gboolean
            declare property useStock( byval t as gboolean )

            declare property useUnderline() as gboolean
            declare property useUnderline( byval t as gboolean )

            declare property focusOnClick() as gboolean
            declare property focusOnClick( byval t as gboolean )

            declare property image() as GtkWidget ptr
            declare property image( byval t as GtkWidget ptr )

            declare property imagePosition() as GtkPositionType
            declare property imagePosition( byval t as GtkPositionType )

            declare sub SetEvent( byval ev as TGtkEvents, byval aMethod as GtkGenericCallback )
            declare sub SetMouseEnter( byval aMethod as gtkGenericCallback )
            declare sub SetMouseLeave( byval aMethod as gtkGenericCallback )
            declare sub SetMouseUp( byval aMethod as gtkGenericCallback )
            declare sub SetMouseDown( byval aMethod as gtkGenericCallback )
            declare sub SetMouseClick( byval aMethod as gtkGenericCallback )

            DECLARE_COMMON_FUNCS()

        COMMON_MEMBERS()
    end type

end namespace
