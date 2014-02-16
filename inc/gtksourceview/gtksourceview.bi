#ifndef __GTK_SOURCE_VIEW_BI__
#define __GTK_SOURCE_VIEW_BI__ 

/'
 *  Copyright (C) 2001 - Mikael Hermansson <tyan@linux.se> and
 *  Chris Phelps <chicane@reninet.com>
 *
 *  Copyright (C) 2003 - Gustavo Giráldez and Paolo Maggi
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU Library General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Library General Public License for more details.
 *
 *  You should have received a copy of the GNU Library General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 '/


#inclib "gtksourceview-2.0"

#include once "gtk/gtk.bi"
#include once "gtksourceview/gtksourcebuffer.bi"
'#include once "gtksourceview/gtksourcecompletion.bi"
'#include once "gtksourceview/gtksourcegutter.bi"

extern "c"

#define GTK_TYPE_SOURCE_VIEW             (gtk_source_view_get_type ())
#define GTK_SOURCE_VIEW(obj)             (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_SOURCE_VIEW, GtkSourceView))
#define GTK_SOURCE_VIEW_CLASS(klass)     (G_TYPE_CHECK_CLASS_CAST ((klass), GTK_TYPE_SOURCE_VIEW, GtkSourceViewClass))
#define GTK_IS_SOURCE_VIEW(obj)          (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_SOURCE_VIEW))
#define GTK_IS_SOURCE_VIEW_CLASS(klass)  (G_TYPE_CHECK_CLASS_TYPE ((klass), GTK_TYPE_SOURCE_VIEW))
#define GTK_SOURCE_VIEW_GET_CLASS(obj)   (G_TYPE_INSTANCE_GET_CLASS ((obj), GTK_TYPE_SOURCE_VIEW, GtkSourceViewClass))

type GtkSourceView        as _GtkSourceView
type GtkSourceViewClass   as _GtkSourceViewClass
type GtkSourceViewPrivate as _GtkSourceViewPrivate 

type _GtkSourceView
  as GtkTextView parent
  as GtkSourceViewPrivate ptr priv
end type

type _GtkSourceViewClass
  as GtkTextViewClass parent_class

  undo as sub (view as GtkSourceView ptr)
  redo as sub (view as GtkSourceView ptr)

  ' Padding for future expansion/
  _gtk_source_reserved1 as sub ()
  _gtk_source_reserved2 as sub ()
  _gtk_source_reserved3 as sub ()
  _gtk_source_reserved4 as sub ()
end type

/'
 * GtkSourceSmartHomeEndType:
 * @GTK_SOURCE_SMART_HOME_END_DISABLED: smart-home-end disabled.
 * @GTK_SOURCE_SMART_HOME_END_BEFORE: move to the first/last
 * non-whitespace character on the first press of the HOME/END keys and
 * to the beginning/end of the line on the second press.
 * @GTK_SOURCE_SMART_HOME_END_AFTER: move to the beginning/end of the
 * line on the first press of the HOME/END keys and to the first/last
 * non-whitespace character on the second press.
 * @GTK_SOURCE_SMART_HOME_END_ALWAYS: always move to the first/last
 * non-whitespace character when the HOME/END keys are pressed.
 '/
enum GtkSourceSmartHomeEndType
  GTK_SOURCE_SMART_HOME_END_DISABLED
  GTK_SOURCE_SMART_HOME_END_BEFORE
  GTK_SOURCE_SMART_HOME_END_AFTER
  GTK_SOURCE_SMART_HOME_END_ALWAYS
end enum

enum GtkSourceDrawSpacesFlags
  GTK_SOURCE_DRAW_SPACES_SPACE = (1 shl 0)
  GTK_SOURCE_DRAW_SPACES_TAB = (1 shl 1)
  GTK_SOURCE_DRAW_SPACES_NEWLINE = (1 shl 2)
  GTK_SOURCE_DRAW_SPACES_NBSP = (1 shl 3)
  GTK_SOURCE_DRAW_SPACES_LEADING = (1 shl 4)
  GTK_SOURCE_DRAW_SPACES_TEXT = (1 shl 5)
  GTK_SOURCE_DRAW_SPACES_TRAILING = (1 shl 6)
  GTK_SOURCE_DRAW_SPACES_ALL = GTK_SOURCE_DRAW_SPACES_SPACE or GTK_SOURCE_DRAW_SPACES_TAB or GTK_SOURCE_DRAW_SPACES_NEWLINE or GTK_SOURCE_DRAW_SPACES_NBSP or GTK_SOURCE_DRAW_SPACES_LEADING or GTK_SOURCE_DRAW_SPACES_TEXT or GTK_SOURCE_DRAW_SPACES_TRAILING
end enum

declare function gtk_source_view_get_type () as GType

' Constructors
declare function gtk_source_view_new () as GtkWidget ptr
declare function gtk_source_view_new_with_buffer (buffer as GtkSourceBuffer ptr) as GtkWidget ptr

' Properties
declare sub      gtk_source_view_set_show_line_numbers (view as GtkSourceView ptr,show as gboolean)
declare function gtk_source_view_get_show_line_numbers (view as GtkSourceView ptr) as gboolean

declare sub      gtk_source_view_set_tab_width (view as GtkSourceView ptr, width as guint)
declare function gtk_source_view_get_tab_width (view as GtkSourceView ptr) as guint

declare sub      gtk_source_view_set_indent_width (view as GtkSourceView ptr,width as gint)
declare function gtk_source_view_get_indent_width (view as GtkSourceView ptr) as gint

declare sub      gtk_source_view_set_auto_indent (view as GtkSourceView ptr,enable as gboolean)
declare function gtk_source_view_get_auto_indent (view as GtkSourceView ptr) as gboolean

declare sub      gtk_source_view_set_insert_spaces_instead_of_tabs (view as GtkSourceView ptr, enable as gboolean)
declare function gtk_source_view_get_insert_spaces_instead_of_tabs (view as GtkSourceView ptr) as gboolean

declare sub      gtk_source_view_set_indent_on_tab (view as GtkSourceView ptr,enable as gboolean)
declare function gtk_source_view_get_indent_on_tab (view as GtkSourceView ptr) as gboolean

declare sub      gtk_source_view_set_highlight_current_line (view as GtkSourceView ptr, show as gboolean)
declare function gtk_source_view_get_highlight_current_line (view as GtkSourceView ptr) as gboolean

declare sub      gtk_source_view_set_show_right_margin (view as GtkSourceView ptr,show as gboolean)
declare function gtk_source_view_get_show_right_margin (view as GtkSourceView ptr) as gboolean

declare sub      gtk_source_view_set_right_margin_position (view as GtkSourceView ptr, pos as guint)
declare function gtk_source_view_get_right_margin_position (view as GtkSourceView ptr) as guint

declare sub      gtk_source_view_set_show_line_marks (view as GtkSourceView ptr,show as gboolean)
declare function gtk_source_view_get_show_line_marks (view as GtkSourceView ptr) as gboolean

declare sub      gtk_source_view_set_mark_category_pixbuf (view as GtkSourceView ptr, category as gchar ptr, pixbuf as GdkPixbuf ptr)
declare function gtk_source_view_get_mark_category_pixbuf (view as GtkSourceView ptr, category as gchar ptr) as GdkPixbuf ptr

declare sub      gtk_source_view_set_mark_category_priority (view as GtkSourceView ptr, category as gchar ptr,priority as gint)
declare function gtk_source_view_get_mark_category_priority (view as GtkSourceView ptr, category as gchar ptr) as gint

declare sub      gtk_source_view_set_smart_home_end (view as GtkSourceView ptr, smart_he as GtkSourceSmartHomeEndType)
declare function gtk_source_view_get_smart_home_end (view as GtkSourceView ptr) as GtkSourceSmartHomeEndType

declare sub gtk_source_view_set_draw_spaces ( byval view as GtkSourceView ptr, byval f as GtkSourceDrawSpacesFlags )
declare function gtk_source_view_get_draw_spaces ( byval view as GtkSourceView ptr ) as GtkSourceDrawSpacesFlags

end extern

#endif ' end of SOURCE_VIEW_BI__
