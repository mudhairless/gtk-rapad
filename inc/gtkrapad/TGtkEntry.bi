'
'   TGtkEntry.bi
'
namespace GtkRapad

    type TGtkEntry

        public:
            declare constructor()
            declare constructor( byref max_length as integer )

            declare operator cast() as GtkWidget pointer
            declare function GetHasFrame() as gboolean
            declare function GetMaxLength() as integer
            declare function GetText() as string
            declare function GetVisibility() as gboolean
            declare sub SetActivate( byval aMethod as gtkGenericCallback )
            declare sub SetEvent( byval ev as TGtkEvents, byval aMethod as gtkGenericCallback )
            declare sub SetHasFrame( byval b as gboolean )
            declare sub SetMaxLength( byval iv as integer )
            declare sub SetText( byval txt as string )
            declare sub SetVisibility( byval b as gboolean )

            declare sub Clear()

            DECLARE_COMMON_FUNCS()

      COMMON_MEMBERS()
    end type

end namespace
