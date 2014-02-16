'
'   TGtkEntry.bi
'
namespace GtkRapad

    type TGtkEntry

        public:
            declare constructor()
            declare constructor( byref max_length as integer )

            declare operator cast() as GtkWidget ptr

            declare property HasFrame() as gboolean
            declare property HasFrame( byval b as gboolean )

            declare property MaxLength() as integer
            declare property MaxLength( byval iv as integer )

            declare property Text() as string
            declare property Text( byval txt as string )

            declare property Visibility() as gboolean
            declare property Visibility( byval b as gboolean )

            declare sub SetActivate( byval aMethod as gtkGenericCallback )
            declare sub SetEvent( byval ev as TGtkEvents, byval aMethod as gtkGenericCallback )

            declare sub Clear()

            DECLARE_COMMON_FUNCS()

      COMMON_MEMBERS()
    end type

end namespace
