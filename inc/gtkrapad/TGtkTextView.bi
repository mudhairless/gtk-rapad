'
'   TGtkTextView.bi
'

'   This function, unlike most, does return its id_ when referenced
'   but rather retuns the scrolled window which contains it.
'   If you must reference the actual buffer in an external function
'   you should use the View() accessor.
#include once "gtkrapad/TGtkScrollable.bi"

namespace GtkRapad

    type TGtkTextView

        public:
            inserttextcallback_ as GtkGenericCallback

            declare constructor()
            declare constructor( byval b as GtkTextBuffer ptr )

            declare property Text() as string
            declare property Text( byval text_ as string )

            declare property Font( byval font_ as string )

            declare property buffer() as GtkTextBuffer ptr
            declare property buffer( byval b as GtkTextBuffer ptr )

            declare operator cast() as GtkWidget ptr
            declare property Tags() as TGtkTextTagTable
            declare property TextView() as GtkWidget ptr
            declare property Scrollable() as TGtkScrollable

            DECLARE_COMMON_FUNCS()

            COMMON_MEMBERS()

        private:
            textbuffer_ as  GtkTextBuffer pointer       'our text buffer
            texttagtable_ as TGtkTextTagTable
            scrollwindow_ as TGtkScrollable
    end type

end namespace
