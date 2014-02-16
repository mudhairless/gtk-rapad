namespace GtkRapad

type TGtkSourceView
    declare constructor

    declare property Text() as string
    declare property Text( byval text_ as string )

    declare property modified() as gboolean
    declare property modified( byval t as gboolean )

    declare property Font( byval font_ as string )

    declare property lineCount() as integer
    declare property charCount() as integer

    declare property autoIndent() as gboolean
    declare property autoIndent( byval t as gboolean )

    declare property indentOnTab() as gboolean
    declare property indentOnTab( byval t as gboolean )

    declare property indentWidth() as integer
    declare property indentWidth( byval v as integer )

    declare property spacesInsteadOfTabs() as gboolean
    declare property spacesInsteadOfTabs( byval t as gboolean )

    declare property smartHomeEnd() as GtkSourceSmartHomeEndType
    declare property smartHomeEnd( byval t as GtkSourceSmartHomeEndType )

    declare property highlightCurrentLine() as gboolean
    declare property highlightCurrentLine( byval t as gboolean )

    declare property showLineMarks() as gboolean
    declare property showLineMarks( byval t as gboolean )

    declare property showLineNumbers() as gboolean
    declare property showLineNumbers( byval t as gboolean )

    declare property showRightMargin() as gboolean
    declare property showRightMargin( byval t as gboolean )

    declare property rightMargin() as uinteger
    declare property rightMargin( byval v as uinteger )

    declare property tabWidth() as uinteger
    declare property tabWidth( byval v as uinteger )

    declare property drawSpaces() as GtkSourceDrawSpacesFlags
    declare property drawSpaces( byval t as GtkSourceDrawSpacesFlags )

    declare property buffer() as TGtkSourceBuffer
    declare property buffer( byval p as TGtkSourceBuffer )

    'declare property completion() as GtkSourceCompletion ptr
    'declare property gutter() as GtkSourceGutter ptr
    declare property sourceview() as GtkSourceView ptr
    declare property scollwindow() as TGtkScrollable

    declare operator cast() as GtkWidget ptr

    DECLARE_COMMON_FUNCS()

    private:
    as TGtkScrollable _s

    COMMON_MEMBERS()
end type

end namespace
