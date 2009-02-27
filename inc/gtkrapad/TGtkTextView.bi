'
'   TGtkTextView.bi
'
'   A simple textbox object, which we can build on later.  It is in
'   need of scroll bars.
'


namespace GtkRapad



    type TGtkTextView

        public:
            inserttextcallback_ as GtkGenericCallback

            declare constructor()
            declare operator cast() as GtkWidget pointer

            declare sub Associate( byval p as GtkWidget pointer )
            declare sub Destroy()
            declare sub Hide()
            declare sub HideAll()
            declare sub Move( byval x_ as integer, byval y_ as integer )
            declare sub Show()
            declare sub ShowAll()

            declare function GetText() as string
            declare function GetName() as string
            declare function GetParent() as GtkWidget pointer

            '---------------------------------------

            declare sub SetText( byval text_ as string )
            declare sub SetName( byref newName as string )
            declare sub SetParent( byval p as GtkWidget pointer )
            declare sub SetFont( byval font_ as string )

        private:
            gtype_ as string                            'GtkWidget type
            id_ as GtkWidget pointer                    'pointer to this object
            objname_ as string                          'name
            parent_ as GtkWidget pointer                'pointer to our parent object

            textbuffer_ as  GtkTextBuffer pointer       'our text buffer
            texttagtable_ as GtkTextTagTable pointer    '?
            scrollwindow_ as GtkWidget pointer          'This object is the default container for this class
    end type

end namespace
