#ifndef __GTK_SOURCE_LANGUAGE_BI__
#define __GTK_SOURCE_LANGUAGE_BI__
/'
 *  gtksourcelanguage.h
 *
 *  Copyright (C) 2003 - Paolo Maggi <paolo.maggi@polito.it>
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

#include once "glib.bi"
#include once "glib-object.bi"
#include once "gtk/gtk.bi"

extern "c"

#define GTK_TYPE_SOURCE_LANGUAGE (gtk_source_language_get_type ())
#define GTK_SOURCE_LANGUAGE(obj) (G_TYPE_CHECK_INSTANCE_CAST((obj), GTK_TYPE_SOURCE_LANGUAGE, GtkSourceLanguage))
#define GTK_SOURCE_LANGUAGE_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST((klass), GTK_TYPE_SOURCE_LANGUAGE, GtkSourceLanguageClass))
#define GTK_IS_SOURCE_LANGUAGE(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), GTK_TYPE_SOURCE_LANGUAGE))
#define GTK_IS_SOURCE_LANGUAGE_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), GTK_TYPE_SOURCE_LANGUAGE))
#define GTK_SOURCE_LANGUAGE_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), GTK_TYPE_SOURCE_LANGUAGE, GtkSourceLanguageClass))

type GtkSourceLanguage        as _GtkSourceLanguage
type GtkSourceLanguageClass   as _GtkSourceLanguageClass
type GtkSourceLanguagePrivate as _GtkSourceLanguagePrivate

type _GtkSourceLanguage
  as GObject                      parent_instance
  as GtkSourceLanguagePrivate ptr priv
end type

type _GtkSourceLanguageClass
  as GObjectClass parent_class
  ' Padding for future expansion
  _gtk_source_reserved1 as sub ()
  _gtk_source_reserved2 as sub ()
end type

declare function gtk_source_language_get_type () as GType

declare function gtk_source_language_get_id         (lang as GtkSourceLanguage ptr) as gchar ptr
declare function gtk_source_language_get_name       (lang as GtkSourceLanguage ptr) as gchar ptr
declare function gtk_source_language_get_section    (lang as GtkSourceLanguage ptr) as gchar ptr
declare function gtk_source_language_get_hidden     (lang as GtkSourceLanguage ptr) as gboolean 
declare function gtk_source_language_get_metadata   (lang as GtkSourceLanguage ptr, name_ as gchar ptr) as gchar ptr
declare function gtk_source_language_get_mime_types (lang as GtkSourceLanguage ptr) as gchar ptr ptr
declare function gtk_source_language_get_globs      (lang as GtkSourceLanguage ptr) as gchar ptr ptr
declare function gtk_source_language_get_style_ids  (lang as GtkSourceLanguage ptr) as gchar ptr ptr
declare function gtk_source_language_get_style_name (lang as GtkSourceLanguage ptr, style_id as gchar ptr) as gchar ptr

end extern

#endif ' __GTK_SOURCE_LANGUAGE_BI__ 

