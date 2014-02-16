#ifndef __GTK_SOURCE_LANGUAGE_MANAGER_BI__
#define __GTK_SOURCE_LANGUAGE_MANAGER_BI__
/'
 *  gtksourcelanguagemanager.h
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

#include once "gtksourceview/gtksourcelanguage.bi"

extern "c"

#define GTK_TYPE_SOURCE_LANGUAGE_MANAGER (gtk_source_language_manager_get_type ())
#define GTK_SOURCE_LANGUAGE_MANAGER(obj) (G_TYPE_CHECK_INSTANCE_CAST((obj), GTK_TYPE_SOURCE_LANGUAGE_MANAGER, GtkSourceLanguageManager))
#define GTK_SOURCE_LANGUAGE_MANAGER_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST((klass), GTK_TYPE_SOURCE_LANGUAGE_MANAGER, GtkSourceLanguageManagerClass))
#define GTK_IS_SOURCE_LANGUAGE_MANAGER(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), GTK_TYPE_SOURCE_LANGUAGE_MANAGER))
#define GTK_IS_SOURCE_LANGUAGE_MANAGER_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), GTK_TYPE_SOURCE_LANGUAGE_MANAGER))
#define GTK_SOURCE_LANGUAGE_MANAGER_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS((obj), GTK_TYPE_SOURCE_LANGUAGE_MANAGER, GtkSourceLanguageManagerClass))

type GtkSourceLanguageManager        as _GtkSourceLanguageManager
type GtkSourceLanguageManagerClass   as _GtkSourceLanguageManagerClass
type GtkSourceLanguageManagerPrivate as _GtkSourceLanguageManagerPrivate

type _GtkSourceLanguageManager
  as GObject parent_instance
  as GtkSourceLanguageManagerPrivate ptr priv
end type

type _GtkSourceLanguageManagerClass
  as GObjectClass parent_class
  ' Padding for future expansion
  _gtk_source_reserved1 as sub ()
  _gtk_source_reserved2 as sub ()
  _gtk_source_reserved3 as sub ()
  _gtk_source_reserved4 as sub ()
end type

declare function gtk_source_language_manager_get_type () as GType
declare function gtk_source_language_manager_new () as GtkSourceLanguageManager ptr
declare function gtk_source_language_manager_get_default () as GtkSourceLanguageManager ptr
declare function gtk_source_language_manager_get_search_path (lm as GtkSourceLanguageManager ptr) as gchar ptr ptr  
declare sub      gtk_source_language_manager_set_search_path (lm as GtkSourceLanguageManager ptr,dirs as gchar ptr ptr)
declare function gtk_source_language_manager_get_language_ids (lm as GtkSourceLanguageManager ptr) as gchar ptr ptr
declare function gtk_source_language_manager_get_language (lm as GtkSourceLanguageManager ptr,id as gchar ptr) as GtkSourceLanguage ptr
declare function gtk_source_language_manager_guess_language(byval lm as GtkSourceLanguageManager ptr, byval id as gchar ptr, byval content_type as gchar ptr ) as GtkSourceLanguage ptr

end extern

#endif ' __GTK_SOURCE_LANGUAGE_MANAGER_BI__ 

