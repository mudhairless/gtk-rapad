'minimal WebKitGTK+ interface
#ifndef __GTK_RAPAD_WEBKIT_PRIVATE__
#define __GTK_RAPAD_WEBKIT_PRIVATE__ -1

#include once "gtk/gtk.bi"

#inclib "webkitgtk-1.0"

#DEFINE WEBKIT_TYPE_WEB_VIEW (webkit_web_view_get_type())
#DEFINE WEBKIT_WEB_VIEW(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), WEBKIT_TYPE_WEB_VIEW, WebKitWebView))

type WebKitWebView as any

enum WebKitNavigationResponse
    WEBKIT_NAVIGATION_RESPONSE_ACCEPT
    WEBKIT_NAVIGATION_RESPONSE_IGNORE
    WEBKIT_NAVIGATION_RESPONSE_DOWNLOAD
end enum

enum WebKitWebViewTargetInfo
    WEBKIT_WEB_VIEW_TARGET_INFO_HTML
    WEBKIT_WEB_VIEW_TARGET_INFO_TEXT
    WEBKIT_WEB_VIEW_TARGET_INFO_IMAGE
    WEBKIT_WEB_VIEW_TARGET_INFO_URI_LIST
    WEBKIT_WEB_VIEW_TARGET_INFO_NETSCAPE_URL
end enum

enum WebKitWebViewViewMode
    WEBKIT_WEB_VIEW_VIEW_MODE_WINDOWED
    WEBKIT_WEB_VIEW_VIEW_MODE_FLOATING
    WEBKIT_WEB_VIEW_VIEW_MODE_FULLSCREEN
    WEBKIT_WEB_VIEW_VIEW_MODE_MAXIMIZED
    WEBKIT_WEB_VIEW_VIEW_MODE_MINIMIZED
end enum

enum WebKitLoadStatus
    WEBKIT_LOAD_PROVISIONAL
    WEBKIT_LOAD_COMMITTED
    WEBKIT_LOAD_FINISHED
    WEBKIT_LOAD_FIRST_VISUALLY_NON_EMPTY_LAYOUT
    WEBKIT_LOAD_FAILED
end enum

extern "C"

declare function webkit_web_view_get_type() as GType
declare function webkit_web_view_can_copy_clipboard( byval as WebKitWebView ptr ) as gboolean
declare function webkit_web_view_can_cut_clipboard( byval as WebKitWebView ptr ) as gboolean
declare function webkit_web_view_can_go_back( byval as WebKitWebView ptr ) as gboolean
declare function webkit_web_view_can_go_back_or_forward( byval as WebKitWebView ptr ) as gboolean
declare function webkit_web_view_can_go_forward( byval as WebKitWebView ptr ) as gboolean
declare function webkit_web_view_can_paste_clipboard( byval as WebKitWebView ptr ) as gboolean
declare function webkit_web_view_can_redo( byval as WebKitWebView ptr ) as gboolean
declare function webkit_web_view_can_show_mime_type( byval as WebKitWebView ptr, byval as zstring ptr ) as gboolean
declare function webkit_web_view_can_undo( byval as WebKitWebView ptr ) as gboolean

declare sub webkit_web_view_copy_clipboard( byval as WebKitWebView ptr )
declare sub webkit_web_view_cut_clipboard( byval as WebKitWebView ptr )
declare sub webkit_web_view_delete_selection( byval as WebKitWebView ptr )
declare sub webkit_web_view_execute_script( byval as WebKitWebView ptr, byval as zstring ptr )

'get_back_forward_list
'get_copy_target_list
declare function webkit_web_view_get_custom_encoding( byval as WebKitWebView ptr ) as zstring ptr
'get_dom_document
declare function webkit_web_view_get_editable( byval as WebKitWebView ptr ) as gboolean
declare function webkit_web_view_get_encoding( byval as WebKitWebView ptr ) as zstring ptr
'get_focused_frame
declare function webkit_web_view_get_full_content_zoom( byval as WebKitWebView ptr ) as gboolean
'get_hit_test_result
declare function webkit_web_view_get_icon_pixbuf( byval as WebKitWebView ptr ) as GdkPixbuf ptr
declare function webkit_web_view_get_icon_uri( byval as WebKitWebView ptr ) as zstring ptr
'get_inspector
declare function webkit_web_view_get_load_status( byval as WebKitWebView ptr ) as WebKitLoadStatus
'get_main_frame
'get_paste_target_list
declare function webkit_web_view_get_progress( byval as WebKitWebView ptr ) as double
'get_settings
declare function webkit_web_view_get_title( byval as WebKitWebView ptr ) as zstring ptr
declare function webkit_web_view_get_transparent( byval as WebKitWebView ptr ) as gboolean
declare function webkit_web_view_get_uri( byval as WebKitWebView ptr ) as zstring ptr
declare function webkit_web_view_get_view_mode( byval as WebKitWebView ptr ) as WebKitWebViewViewMode
declare function webkit_web_view_get_view_source_mode( byval as WebKitWebView ptr ) as gboolean
'get_viewport_attributes
declare function webkit_web_view_get_zoom_level( byval as WebKitWebView ptr ) as single
declare sub webkit_web_view_go_back( byval as WebKitWebView ptr )
declare sub webkit_web_view_go_back_or_forward( byval as WebKitWebView ptr, byval as integer )
declare sub webkit_web_view_go_forward( byval as WebKitWebView ptr )
'go_to_back_forward_item
declare function webkit_web_view_has_selection( byval as WebKitWebView ptr ) as gboolean
declare sub webkit_web_view_load_html_string( byval as WebKitWebView ptr, byval as zstring ptr, byval as zstring ptr )
'load_request
declare sub webkit_web_view_load_string( byval as WebKitWebView ptr, byval as zstring ptr, byval as zstring ptr, byval as zstring ptr, byval as zstring ptr )
declare sub webkit_web_view_load_uri( byval as WebKitWebView ptr, byval as zstring ptr )
declare function webkit_web_view_mark_text_matches( byval as WebKitWebView ptr, byval as zstring ptr, byval as gboolean, byval as uinteger ) as uinteger
'declare sub webkit_web_view_move_cursor( byval as WebKitWebView ptr, byval as GtkMovement, byval as integer )
declare function webkit_web_view_new() as GtkWidget ptr
declare sub webkit_web_view_paste_clipboard( byval as WebKitWebView ptr )
declare sub webkit_web_view_redo( byval as WebKitWebView ptr )
declare sub webkit_web_view_reload( byval as WebKitWebView ptr )
declare sub webkit_web_view_reload_bypass_cache( byval as WebKitWebView ptr )
declare function webkit_web_view_search_text( byval as WebKitWebView ptr, byval as zstring ptr, byval as gboolean, byval as gboolean, byval as gboolean ) as gboolean
declare sub webkit_web_view_select_all( byval as WebKitWebView ptr )
declare sub webkit_web_view_set_custom_encoding( byval as WebKitWebView ptr, byval as zstring ptr )
declare sub webkit_web_view_set_editable( byval as WebKitWebView ptr, byval as gboolean )
declare sub webkit_web_view_set_full_content_zoom( byval as WebKitWebView ptr, byval as gboolean )
declare sub webkit_web_view_set_highlight_text_matches( byval as WebKitWebView ptr, byval as gboolean )
declare sub webkit_web_view_set_maintains_back_forward_list( byval as WebKitWebView ptr, byval as gboolean )
'set_settings
declare sub webkit_web_view_set_transparent( byval as WebKitWebView ptr, byval as gboolean )
declare sub webkit_web_view_set_view_mode( byval as WebKitWebView ptr, byval as WebKitWebViewViewMode )
declare sub webkit_web_view_set_view_source_mode( byval as WebKitWebView ptr, byval as gboolean )
declare sub webkit_web_view_set_zoom_level( byval as WebKitWebView ptr, byval as single )
declare sub webkit_web_view_stop_loading( byval as WebKitWebView ptr )
declare function webkit_web_view_try_get_favicon_pixbuf( byval as WebKitWebView ptr, byval as uinteger, byval as uinteger ) as GdkPixbuf ptr
declare sub webkit_web_view_undo( byval as WebKitWebView ptr )
declare sub webkit_web_view_unmark_text_matches( byval as WebKitWebView ptr )
declare sub webkit_web_view_zoom_in( byval as WebKitWebView ptr )
declare sub webkit_web_view_zoom_out( byval as WebKitWebView ptr )
'get_window_features

end extern

#endif
