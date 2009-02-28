
namespace GtkRapad

    type TGtkVBox
        public:
            declare constructor ( )
            declare constructor ( byval homog as gboolean, byval spacing_ as integer )

            declare operator cast() as GtkWidget pointer

            declare sub AppendChild( byval child_ as GtkWidget pointer, byval expand_ as gboolean, byval fill_ as gboolean, byval pad_ as integer)
            declare sub AppendChildEnd( byval child_ as GtkWidget pointer, byval expand_ as gboolean, byval fill_ as gboolean, byval pad_ as integer)

            declare sub Associate( byval p as GtkWidget pointer )
            declare sub Destroy()
            declare sub Hide()
            declare sub HideAll()
            declare sub Show()
            declare sub ShowAll()

            declare function GetParent() as GtkWidget Pointer
            declare function GetName() as string

            '---------------------------------------

            declare sub SetName( byref newName as string )
            declare sub SetParent( byval p as GtkWidget Pointer )

        private:
            gtype_ as string                'GtkWidget type
            id_ as GtkWidget pointer        'pointer to this object
            parent_ as GtkWidget pointer    'pointer to our parent object
            objname_ as string
    end type

end namespace
