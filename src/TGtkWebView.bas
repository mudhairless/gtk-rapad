#ifndef RAPAD_NO_WEBKIT
#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkWebView)

    constructor TGtkWebView
        id_ = webkit_web_view_new()
        init()
    end constructor

    operator TGtkWebView.cast() as GtkWidget ptr
        return id_
    end operator

    property TGtkWebView.uri() as string
        return *webkit_web_view_get_uri(WEBKIT_WEB_VIEW(id_))
    end property

    property TGtkWebView.uri( byref t as string )
        webkit_web_view_load_uri(cast(WebKitWebView ptr,id_),t)
    end property

    property TGtkWebView.canCopy() as gboolean
        return webkit_web_view_can_copy_clipboard(WEBKIT_WEB_VIEW(id_))
    end property

    property TGtkWebView.canCut() as gboolean
        return webkit_web_view_can_cut_clipboard(WEBKIT_WEB_VIEW(id_))
    end property

    property TGtkWebView.canPaste() as gboolean
        return webkit_web_view_can_paste_clipboard(WEBKIT_WEB_VIEW(id_))
    end property

    property TGtkWebView.canUndo() as gboolean
        return webkit_web_view_can_undo(WEBKIT_WEB_VIEW(id_))
    end property

    property TGtkWebView.canRedo() as gboolean
        return webkit_web_view_can_redo(WEBKIT_WEB_VIEW(id_))
    end property

    property TGtkWebView.canGoBack() as gboolean
        return webkit_web_view_can_go_back(WEBKIT_WEB_VIEW(id_))
    end property

    property TGtkWebView.canGoForward() as gboolean
        return webkit_web_view_can_go_forward(WEBKIT_WEB_VIEW(id_))
    end property

    property TGtkWebView.editable() as gboolean
        return webkit_web_view_get_editable(WEBKIT_WEB_VIEW(id_))
    end property

    property TGtkWebView.editable( byval t as gboolean )
        webkit_web_view_set_editable(WEBKIT_WEB_VIEW(id_),t)
    end property

    property TGtkWebView.loadStatus() as WebKitLoadStatus
        return webkit_web_view_get_load_status(WEBKIT_WEB_VIEW(id_))
    end property

    property TGtkWebView.customEncoding() as string
        return *webkit_web_view_get_custom_encoding(WEBKIT_WEB_VIEW(id_))
    end property

    property TGtkWebView.customEncoding( byref t as string )
        webkit_web_view_set_custom_encoding(WEBKIT_WEB_VIEW(id_),t)
    end property

    property TGtkWebView.encoding_() as string
        return *webkit_web_view_get_encoding(WEBKIT_WEB_VIEW(id_))
    end property

    property TGtkWebView.fullContentZoom() as gboolean
        return webkit_web_view_get_full_content_zoom(WEBKIT_WEB_VIEW(id_))
    end property

    property TGtkWebView.fullContentZoom( byval t as gboolean )
        webkit_web_view_set_full_content_zoom(WEBKIT_WEB_VIEW(id_),t)
    end property

    property TGtkWebView.iconPixbuf() as GdkPixbuf ptr
        return webkit_web_view_get_icon_pixbuf(WEBKIT_WEB_VIEW(id_))
    end property

    property TGtkWebView.iconURI() as string
        return *webkit_web_view_get_icon_uri(WEBKIT_WEB_VIEW(id_))
    end property

    property TGtkWebView.progress() as double
        return webkit_web_view_get_progress(WEBKIT_WEB_VIEW(id_))
    end property

    property TGtkWebView.title() as string
        return *webkit_web_view_get_title(WEBKIT_WEB_VIEW(id_))
    end property

    property TGtkWebView.transparent() as gboolean
        return webkit_web_view_get_transparent(WEBKIT_WEB_VIEW(id_))
    end property

    property TGtkWebView.transparent( byval t as gboolean )
        webkit_web_view_set_transparent(WEBKIT_WEB_VIEW(id_),t)
    end property

    property TGtkWebView.viewMode() as WebKitWebViewViewMode
        return webkit_web_view_get_view_mode(WEBKIT_WEB_VIEW(id_))
    end property

    property TGtkWebView.viewMode( byval t as WebKitWebViewViewMode )
        webkit_web_view_set_view_mode(WEBKIT_WEB_VIEW(id_),t)
    end property

    property TGtkWebView.viewSourceMode() as gboolean
        return webkit_web_view_get_view_source_mode(WEBKIT_WEB_VIEW(id_))
    end property

    property TGtkWebView.viewSourceMode( byval t as gboolean )
        webkit_web_view_set_view_source_mode(WEBKIT_WEB_VIEW(id_),t)
    end property

    property TGtkWebView.zoomLevel() as single
        return webkit_web_view_get_zoom_level(WEBKIT_WEB_VIEW(id_))
    end property

    property TGtkWebView.zoomLevel( byval i as single )
        webkit_web_view_set_zoom_level(WEBKIT_WEB_VIEW(id_),i)
    end property

    property TGtkWebView.hasSelection() as gboolean
        return webkit_web_view_has_selection(WEBKIT_WEB_VIEW(id_))
    end property

    property TGtkWebView.highlightTextMatches( byval t as gboolean )
        webkit_web_view_set_highlight_text_matches(WEBKIT_WEB_VIEW(id_),t)
    end property

    property TGtkWebView.maintainsBackForwardList( byval t as gboolean )
        webkit_web_view_set_maintains_back_forward_list(WEBKIT_WEB_VIEW(id_),t)
    end property

    sub TGtkWebView.loadHTML( byref h as string, byref base_uri as string )
        webkit_web_view_load_html_string(WEBKIT_WEB_VIEW(id_),h,base_uri)
    end sub

    sub TGtkWebView.load( byref c as string, byref mime_type as string, byref encoding__ as string, byref base_uri as string )
        webkit_web_view_load_string(WEBKIT_WEB_VIEW(id_),c,mime_type,encoding__,base_uri)
    end sub

    function TGtkWebView.markTextMatches( byref s as string, byval cs as gboolean, byval limit_ as uinteger ) as uinteger
        return webkit_web_view_mark_text_matches(WEBKIT_WEB_VIEW(id_),s,cs,limit_)
    end function

    sub TGtkWebView.unmarkTextMatches()
        webkit_web_view_unmark_text_matches(WEBKIT_WEB_VIEW(id_))
    end sub

    function TGtkWebView.searchText( byref s as string, byval cs as gboolean, byval forward_ as gboolean, byval wrap_ as gboolean ) as gboolean
        return webkit_web_view_search_text(WEBKIT_WEB_VIEW(id_),s,cs,forward_,wrap_)
    end function

    sub TGtkWebView.zoomIn()
        webkit_web_view_zoom_in(WEBKIT_WEB_VIEW(id_))
    end sub

    sub TGtkWebView.zoomOut()
        webkit_web_view_zoom_out(WEBKIT_WEB_VIEW(id_))
    end sub

    sub TGtkWebView.selectAll()
        webkit_web_view_select_all(WEBKIT_WEB_VIEW(id_))
    end sub

    sub TGtkWebView.goBack()
        webkit_web_view_go_back(WEBKIT_WEB_VIEW(id_))
    end sub

    sub TGtkWebView.goForward()
        webkit_web_view_go_forward(WEBKIT_WEB_VIEW(id_))
    end sub

    sub TGtkWebView.go( byval i as integer )
        webkit_web_view_go_back_or_forward(WEBKIT_WEB_VIEW(id_),i)
    end sub

    sub TGtkWebView.reload( byval bypass_cache as gboolean = false )
        if bypass_cache = true then
            webkit_web_view_reload_bypass_cache(WEBKIT_WEB_VIEW(id_))
        else
            webkit_web_view_reload(WEBKIT_WEB_VIEW(id_))
        end if
    end sub

    sub TGtkWebView.stop()
        webkit_web_view_stop_loading(WEBKIT_WEB_VIEW(id_))
    end sub

    sub TGtkWebView.copy()
        webkit_web_view_copy_clipboard(WEBKIT_WEB_VIEW(id_))
    end sub

    sub TGtkWebView.cut()
        webkit_web_view_cut_clipboard(WEBKIT_WEB_VIEW(id_))
    end sub

    sub TGtkWebView.paste()
        webkit_web_view_paste_clipboard(WEBKIT_WEB_VIEW(id_))
    end sub

    sub TGtkWebView.redo()
        webkit_web_view_redo(WEBKIT_WEB_VIEW(id_))
    end sub

    sub TGtkWebView.undo()
        webkit_web_view_undo(WEBKIT_WEB_VIEW(id_))
    end sub

    sub TGtkWebView.deleteSelection()
        webkit_web_view_delete_selection(WEBKIT_WEB_VIEW(id_))
    end sub

end namespace

#endif
