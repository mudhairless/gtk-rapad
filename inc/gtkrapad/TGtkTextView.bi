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

            declare property modified() as gboolean
            declare property modified( byval t as gboolean )

            declare property Font( byval font_ as string )

            declare property lineCount() as integer
            declare property charCount() as integer

            declare sub insertAt( byref start_ as TGtkTextIter, byref txt as string )
            declare sub insertAtCursor( byref txt as string )
            declare sub deleteFrom( byref start_ as TGtkTextIter, byref end_ as TGtkTextIter )
            declare function slice( byref start_ as TGtkTextIter, byref end_ as TGtkTextIter ) as string

            declare function selectionBounds( byref start_ as TGtkTextIter, byref end_ as TGtkTextIter ) as gboolean

            declare property startIter() as TGtkTextIter
            declare property endIter() as TGtkTextIter
            declare function iterAtLine( byval l as integer ) as TGtkTextIter
            declare function iterAtLineOffset( byval l as integer, byval o as integer ) as TGtkTextIter
            declare function iterAtLineIndex( byval l as integer, byval i as integer ) as TGtkTextIter
            declare function iterAtOffset( byval o as integer ) as TGtkTextIter

            declare sub placeCursor( byref where_ as TGtkTextIter )

            declare sub applyTag( byref name_ as string, byref start_ as TGtkTextIter, byref end_ as TGtkTextIter )
            declare sub removeTag( byref name_ as string, byref start_ as TGtkTextIter, byref end_ as TGtkTextIter )
            declare sub removeAllTags( byref start_ as TGtkTextIter, byref end_ as TGtkTextIter )

            declare property buffer() as GtkTextBuffer ptr

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
