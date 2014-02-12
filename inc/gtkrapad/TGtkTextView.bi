'
'   TGtkTextView.bi
'

'   This function, unlike most, does return its id_ when referenced
'   but rather retuns the scrolled window which contains it.
'   If you must reference the actual buffer in an external function
'   you should use the View() accessor.


namespace GtkRapad



    type TGtkTextView

        public:
            inserttextcallback_ as GtkGenericCallback

            declare constructor()
            declare operator cast() as GtkWidget pointer

            declare function TextView() as GtkWidget Pointer
            declare sub Move( byval x_ as integer, byval y_ as integer )
            declare function GetText() as string
            declare sub SetText( byval text_ as string )
            declare sub SetFont( byval font_ as string )

            DECLARE_COMMON_FUNCS()

            COMMON_MEMBERS()

        private:
            textbuffer_ as  GtkTextBuffer pointer       'our text buffer
            texttagtable_ as GtkTextTagTable pointer    '?
            scrollwindow_ as GtkWidget pointer          'This object is the default container for this class
    end type

end namespace
