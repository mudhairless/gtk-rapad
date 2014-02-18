namespace GtkRapad

type TGtkWebView
    declare constructor
    declare operator cast() as GtkWidget ptr

    declare property uri() as string
    declare property uri( byref as string )

    declare property canCopy() as gboolean
    declare property canCut() as gboolean
    declare property canPaste() as gboolean
    declare property canUndo() as gboolean
    declare property canRedo() as gboolean
    declare property canGoBack() as gboolean
    declare property canGoForward() as gboolean
    declare property editable() as gboolean
    declare property editable( byval t as gboolean )
    declare property loadStatus() as WebKitLoadStatus
    declare property customEncoding() as string
    declare property customEncoding( byref t as string )
    declare property encoding_() as string
    declare property fullContentZoom() as gboolean
    declare property fullContentZoom( byval t as gboolean )
    declare property iconPixbuf() as GdkPixbuf ptr
    declare property iconURI() as string
    declare property progress() as double
    declare property title() as string
    declare property transparent() as gboolean
    declare property transparent( byval t as gboolean )
    declare property viewMode() as WebKitWebViewViewMode
    declare property viewMode( byval t as WebKitWebViewViewMode )
    declare property viewSourceMode() as gboolean
    declare property viewSourceMode( byval t as gboolean )
    declare property zoomLevel() as single
    declare property zoomLevel( byval i as single )
    declare property hasSelection() as gboolean
    declare property highlightTextMatches( byval t as gboolean )
    declare property maintainsBackForwardList( byval t as gboolean )

    declare sub loadHTML( byref h as string, byref base_uri as string )
    declare sub load( byref c as string, byref mime_type as string, byref encoding__ as string, byref base_uri as string )
    declare function markTextMatches( byref s as string, byval cs as gboolean, byval limit_ as uinteger ) as uinteger
    declare sub unmarkTextMatches()
    declare function searchText( byref s as string, byval cs as gboolean, byval forward_ as gboolean, byval wrap_ as gboolean ) as gboolean
    declare sub zoomIn()
    declare sub zoomOut()
    declare sub selectAll()
    declare sub goBack()
    declare sub goForward()
    declare sub go( byval i as integer )
    declare sub reload( byval bypass_cache as gboolean = false )
    declare sub stop()
    declare sub copy()
    declare sub cut()
    declare sub paste()
    declare sub redo()
    declare sub undo()
    declare sub deleteSelection()

    DECLARE_COMMON_FUNCS()
    COMMON_MEMBERS()
end type

end namespace
