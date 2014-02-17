'
'   TGtkEntry.bi
'
namespace GtkRapad

    type TGtkEntry

        public:
            declare constructor()
            declare constructor( byval i as GtkEntry ptr )
            declare constructor( byref max_length as integer )

            declare operator cast() as GtkWidget ptr

            declare property HasFrame() as gboolean
            declare property HasFrame( byval b as gboolean )

            declare property MaxLength() as integer
            declare property MaxLength( byval iv as integer )

            declare property Text() as string
            declare property Text( byref txt as string )
            declare sub prependText( byref txt as string )
            declare sub appendText( byref txt as string )

            declare property editable() as gboolean
            declare property editable( byval t as gboolean )

            declare property Visibility() as gboolean
            declare property Visibility( byval b as gboolean )

            declare property alignment() as single
            declare property alignment( byval v as single )

            declare sub SetActivate( byval aMethod as gtkGenericCallback )
            declare sub SetEvent( byval ev as TGtkEvents, byval aMethod as gtkGenericCallback )

            declare sub Clear()

            DECLARE_COMMON_FUNCS()

      COMMON_MEMBERS()
    end type

end namespace
