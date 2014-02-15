#ifndef __GTK_SOURCE_STYLE_SCHEME_BI__
#define __GTK_SOURCE_STYLE_SCHEME_BI__

/'
 *  gtksourcestylescheme.h
 *
 *  Copyright (C) 2003 - Paolo Maggi <paolo.maggi@polito.it>
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public
 *  License as published by the Free Software Foundation; either
 *  version 2.1 of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.

 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 '/

#include once "gtk/gtk.bi"
#include once "gtksourceview/gtksourcestyle.bi"

extern "c"

#define GTK_TYPE_SOURCE_STYLE_SCHEME             (gtk_source_style_scheme_get_type ())
#define GTK_SOURCE_STYLE_SCHEME(obj)             (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_SOURCE_STYLE_SCHEME, GtkSourceStyleScheme))
#define GTK_SOURCE_STYLE_SCHEME_CLASS(klass)     (G_TYPE_CHECK_CLASS_CAST ((klass), GTK_TYPE_SOURCE_STYLE_SCHEME, GtkSourceStyleSchemeClass))
#define GTK_IS_SOURCE_STYLE_SCHEME(obj)          (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_SOURCE_STYLE_SCHEME))
#define GTK_IS_SOURCE_STYLE_SCHEME_CLASS(klass)  (G_TYPE_CHECK_CLASS_TYPE ((klass), GTK_TYPE_SOURCE_STYLE_SCHEME))
#define GTK_SOURCE_STYLE_SCHEME_GET_CLASS(obj)   (G_TYPE_INSTANCE_GET_CLASS ((obj), GTK_TYPE_SOURCE_STYLE_SCHEME, GtkSourceStyleSchemeClass))

type GtkSourceStyleScheme        as _GtkSourceStyleScheme
type GtkSourceStyleSchemePrivate as _GtkSourceStyleSchemePrivate
type GtkSourceStyleSchemeClass   as _GtkSourceStyleSchemeClass

type _GtkSourceStyleScheme
 as GObject base_
 as GtkSourceStyleSchemePrivate ptr priv
end type

type _GtkSourceStyleSchemeClass
  as GObjectClass base_class
  ' Padding for future expansion
  _gtk_source_reserved1 as sub cdecl ()
  _gtk_source_reserved2 as sub cdecl ()
end type

declare function gtk_source_style_scheme_get_type () as GType 

declare function _gtk_source_style_scheme_new (id as gchar ptr, name_ as gchar ptr) as GtkSourceStyleScheme ptr
declare function gtk_source_style_scheme_get_id (scheme as GtkSourceStyleScheme ptr) as gchar ptr
declare function gtk_source_style_scheme_get_name (scheme as GtkSourceStyleScheme ptr) as gchar ptr
declare function gtk_source_style_scheme_get_description (scheme as GtkSourceStyleScheme ptr) as gchar ptr
declare function gtk_source_style_scheme_get_authors (scheme as GtkSourceStyleScheme ptr) as gchar ptr ptr
declare function gtk_source_style_scheme_get_filename (scheme as GtkSourceStyleScheme ptr) as gchar ptr
declare function gtk_source_style_scheme_get_style (scheme as GtkSourceStyleScheme ptr, style_id as gchar ptr) as GtkSourceStyle ptr
declare function _gtk_source_style_scheme_new_from_file (filename as gchar ptr) as GtkSourceStyleScheme ptr
declare function _gtk_source_style_scheme_get_default () as GtkSourceStyleScheme ptr
declare function _gtk_source_style_scheme_get_parent_id (scheme as GtkSourceStyleScheme ptr) as gchar ptr
declare sub      _gtk_source_style_scheme_set_parent (scheme as GtkSourceStyleScheme ptr,parent_scheme as GtkSourceStyleScheme ptr)
' private
declare sub      _gtk_source_style_scheme_apply (scheme as GtkSourceStyleScheme ptr,widget as GtkWidget ptr)
declare function _gtk_source_style_scheme_get_matching_brackets_style (scheme as GtkSourceStyleScheme ptr) as GtkSourceStyle ptr
declare function _gtk_source_style_scheme_get_right_margin_style (scheme as GtkSourceStyleScheme ptr) as GtkSourceStyle ptr
declare function _gtk_source_style_scheme_get_current_line_color (scheme as GtkSourceStyleScheme ptr,color_ as GdkColor ptr) as gboolean

end extern

#endif  ' __GTK_SOURCE_STYLE_SCHEME_BI__ 
