
namespace GtkRapad

    type TGtkButton

        public:
            declare constructor( )
            declare constructor( byref _caption_ as string )

            declare operator cast() as GtkWidget pointer
            declare sub Associate( byval p as GtkWidget pointer )
            declare sub Show()
            declare sub Hide()
            declare sub ShowAll()
            declare sub HideAll()
            declare sub Destroy()
            declare sub SetParent( byval p as GtkWidget Pointer )
            declare function GetParent() as GtkWidget Pointer

            '---------------------------------------

            declare sub SetEvent( byval ev as TGtkEvents, byval aMethod as gtkGenericCallback )

            declare sub SetMouseEnter( byval aMethod as gtkGenericCallback )
            declare sub SetMouseLeave( byval aMethod as gtkGenericCallback )
            declare sub SetMouseUp( byval aMethod as gtkGenericCallback )
            declare sub SetMouseDown( byval aMethod as gtkGenericCallback )
            declare sub SetMouseClick( byval aMethod as gtkGenericCallback )

            declare sub SetCaption( byref newCaption as string )
            declare function GetCaption() as string

        private:
            id_ as GtkWidget Pointer        'pointer to this object
            parent_ as GtkWidget pointer    'pointer to our parent object
            gtype_ as string                'GtkWidget type
    end type

end namespace
