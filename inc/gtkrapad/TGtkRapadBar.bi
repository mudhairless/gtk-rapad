#include once "gtkrapad/gtkrapad.bi"


namespace GtkRapad

    type TGtkRapadBar

        public:
            declare constructor( )

            declare operator cast() as GtkWidget pointer

            declare sub ResizeMainMenuArray( byval size_ as uinteger )

            declare sub AddChild( byval cwid_ as TGtkMenuItem )

            declare sub CreateMenu( byval name_ as string, byval label_ as string )
            declare sub CreateMenuChild( byval parent_ as string, byval name_ as string, byval label_ as string, byval aMethod as GtkGenericCallback )
            declare sub CreateMenuAssociation( byval name_ as string, byval item_ as TGtkMenuItem )

            declare function GetMenuAssociationIndex( byval name_ as string ) as integer

            declare sub SetEvent( byval ev as TGtkEvents, byval aMethod as GtkGenericCallback )

            DECLARE_COMMON_FUNCS()

            COMMON_MEMBERS()

        private:
            __pArrMnuMain         as TGtkMenuItem pointer
            __pArrMnuMain_Count   as uinteger

    end type

end namespace
