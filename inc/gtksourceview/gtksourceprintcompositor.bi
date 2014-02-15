#ifndef __GTK_SOURCE_PRINT_COMPOSITOR_BI__
#define __GTK_SOURCE_PRINT_COMPOSITOR_BI__
/'
 *
 * gtksourceprintcompositor.h
 * This file is part of GtkSourceView 
 *
 * Copyright (C) 2003  Gustavo Giráldez 
 * Copyright (C) 2007-2008  Paolo Maggi, Paolo Borelli and Yevgen Muntyan
 *
 * GtkSourceView is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * GtkSourceView is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 '/

#include "gtk/gtk.bi"
#include "gtksourceview/gtksourceview.bi"

extern "c"

#define GTK_TYPE_SOURCE_PRINT_COMPOSITOR            (gtk_source_print_compositor_get_type ())
#define GTK_SOURCE_PRINT_COMPOSITOR(obj)            (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_SOURCE_PRINT_COMPOSITOR, GtkSourcePrintCompositor))
#define GTK_SOURCE_PRINT_COMPOSITOR_CLASS(klass)    (G_TYPE_CHECK_CLASS_CAST ((klass), GTK_TYPE_SOURCE_PRINT_COMPOSITOR, GtkSourcePrintCompositorClass))
#define GTK_IS_SOURCE_PRINT_COMPOSITOR(obj)         (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_SOURCE_PRINT_COMPOSITOR))
#define GTK_IS_SOURCE_PRINT_COMPOSITOR_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), GTK_TYPE_SOURCE_PRINT_COMPOSITOR))
#define GTK_SOURCE_PRINT_COMPOSITOR_GET_CLASS(obj)  (G_TYPE_INSTANCE_GET_CLASS ((obj), GTK_TYPE_SOURCE_PRINT_COMPOSITOR, GtkSourcePrintCompositorClass))

type GtkSourcePrintCompositor        as _GtkSourcePrintCompositor
type GtkSourcePrintCompositorClass   as _GtkSourcePrintCompositorClass
type GtkSourcePrintCompositorPrivate as _GtkSourcePrintCompositorPrivate

type _GtkSourcePrintCompositor
  as GObject parent_instance
  asd GtkSourcePrintCompositorPrivate ptr priv
end type

type _GtkSourcePrintCompositorClass
  as GObjectClass parent_class
  ' Padding for future expansion
  _gtk_source_reserved1 as sub ()
  _gtk_source_reserved2 as sub ()	
end type


declare function gtk_source_print_compositor_get_type () as GType

' Constructors
declare function gtk_source_print_compositor_new (buffer as GtkSourceBuffer ptr) as GtkSourcePrintCompositor ptr
declare function gtk_source_print_compositor_new_from_view (view as GtkSourceView ptr) GtkSourcePrintCompositor ptr

' Properties
declare function gtk_source_print_compositor_get_buffer (c as GtkSourcePrintCompositor ptr) as GtkSourceBuffer ptr

declare sub      gtk_source_print_compositor_set_tab_width (c as GtkSourcePrintCompositor ptr, width as guint)
declare function gtk_source_print_compositor_get_tab_width (c as GtkSourcePrintCompositor ptr) as guint

declare sub      gtk_source_print_compositor_set_wrap_mode (c as GtkSourcePrintCompositor ptr,wm as GtkWrapMode)
declare function gtk_source_print_compositor_get_wrap_mode (c as GtkSourcePrintCompositor ptr) as GtkWrapMode		  

declare sub      gtk_source_print_compositor_set_highlight_syntax (c as GtkSourcePrintCompositor ptr, highlight as gboolean)
declare function gtk_source_print_compositor_get_highlight_syntax (c as GtkSourcePrintCompositor ptr) as gboolean

declare sub      gtk_source_print_compositor_set_print_line_numbers (c as GtkSourcePrintCompositor ptr, interval as guint)
declare function gtk_source_print_compositor_get_print_line_numbers (c as GtkSourcePrintCompositor ptr) as guint

declare sub      gtk_source_print_compositor_set_body_font_name (c as GtkSourcePrintCompositor ptr, font_name as gchar ptr)
declare function gtk_source_print_compositor_get_body_font_name (c as GtkSourcePrintCompositor ptr) as gchar ptr 

declare sub      gtk_source_print_compositor_set_line_numbers_font_name (c as GtkSourcePrintCompositor ptr,font_name as gchar ptr)
declare function gtk_source_print_compositor_get_line_numbers_font_name (c as GtkSourcePrintCompositor ptr) as gchar ptr

declare sub      gtk_source_print_compositor_set_header_font_name (c as GtkSourcePrintCompositor ptr, font_name as gchar ptr)
declare function gtk_source_print_compositor_get_header_font_name (c as GtkSourcePrintCompositor ptr) as gchar ptr

declare sub      gtk_source_print_compositor_set_footer_font_name (c as GtkSourcePrintCompositor ptr, font_name as gchar ptr)
declare function gtk_source_print_compositor_get_footer_font_name (c as GtkSourcePrintCompositor ptr) as gchar ptr

declare function gtk_source_print_compositor_get_top_margin (c as GtkSourcePrintCompositor ptr,unit as GtkUnit) as gdouble
declare sub      gtk_source_print_compositor_set_top_margin (c as GtkSourcePrintCompositor ptr,margin as gdouble, unit as GtkUnit)

declare function gtk_source_print_compositor_get_bottom_margin (c as GtkSourcePrintCompositor ptr, unit as GtkUnit) as gdouble
declare sub      gtk_source_print_compositor_set_bottom_margin (c as GtkSourcePrintCompositor ptr, margin as gdouble, unit as GtkUnit)

declare function gtk_source_print_compositor_get_left_margin (c as GtkSourcePrintCompositor ptr, unit as GtkUnit) as gdouble
declare sub      gtk_source_print_compositor_set_left_margin (c as GtkSourcePrintCompositor ptr, margine as gdouble, unit as as GtkUnit)

declare function gtk_source_print_compositor_get_right_margin (c as GtkSourcePrintCompositor ptr, unit asGtkUnit) as gdouble
declare sub      gtk_source_print_compositor_set_right_margin (c as GtkSourcePrintCompositor ptr, margin as gdouble,unit as GtkUnit)

declare sub      gtk_source_print_compositor_set_print_header (c as GtkSourcePrintCompositor ptr,print_ as gboolean)
declare function gtk_source_print_compositor_get_print_header (c as GtkSourcePrintCompositor ptr) as gboolean

declare sub      gtk_source_print_compositor_set_print_footer (c as GtkSourcePrintCompositor ptr,print_ as gboolean)
declare function gtk_source_print_compositor_get_print_footer (c as GtkSourcePrintCompositor ptr) as gboolean

'format strings are strftime like
declare sub      gtk_source_print_compositor_set_header_format ( _
  c as GtkSourcePrintCompositor ptr, separator as gboolean, left_  as gchar ptr, center as gchar ptr, right_ as gchar ptr)

declare sub      gtk_source_print_compositor_set_footer_format ( _
  c as GtkSourcePrintCompositor ptr, separator as gboolean, left_  as gchar ptr, center as gchar ptr, right_ as gchar ptr)

declare function gtk_source_print_compositor_get_n_pages             (c as GtkSourcePrintCompositor ptr) as gint
declare function gtk_source_print_compositor_paginate                (c as GtkSourcePrintCompositor, context as GtkPrintContext ptr) as gboolean
declare function gtk_source_print_compositor_get_pagination_progress (c as GtkSourcePrintCompositor ptr) as gdouble
declare sub      gtk_source_print_compositor_draw_page               (c as GtkSourcePrintCompositor ptr, context as GtkPrintContext ptr, page_nr as gint)

end extern

#endif ' __GTK_SOURCE_PRINT_COMPOSITOR_BI__ 

 
 
