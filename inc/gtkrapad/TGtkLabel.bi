namespace GtkRapad

    type TGtkLabel
        public:
            declare constructor( )
            declare constructor( byref contents as string )
            declare operator cast() as GtkWidget pointer

            declare property Text( ) as string
            declare property Text( byref contents as string )

            declare property pattern( byref x as string )

            declare property justify() as GtkJustification
            declare property justify( byval t as GtkJustification )

            declare property ellipsize() as PangoEllipsizeMode
            declare property ellipsize( byval t as PangoEllipsizeMode )

            declare property width( byval i as integer )
            declare property width() as integer

            declare property maxWidth( byval i as integer )
            declare property maxWidth() as integer

            declare property lineWrap() as gboolean
            declare property lineWrap( byval t as gboolean )

            declare property lineWrapMode() as PangoWrapMode
            declare property lineWrapMode( byval t as PangoWrapMode )

            declare property selectable() as gboolean
            declare property selectable( byval t as gboolean )

            declare property useMarkup() as gboolean
            declare property useMarkup( byval t as gboolean )

            declare property useUnderline() as gboolean
            declare property useUnderline( byval t as gboolean )

            declare property angle() as double
            declare property angle( byval i as double )

            declare property singleLineMode() as gboolean
            declare property singleLineMode( byval t as gboolean )

            declare property currentURI() as string

            declare property trackVisitedLinks() as gboolean
            declare property trackVisitedLinks( byval t as gboolean )

            DECLARE_COMMON_FUNCS()

            COMMON_MEMBERS()
    end type

end namespace
