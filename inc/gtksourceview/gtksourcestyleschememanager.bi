#ifndef __GTK_SOURCE_STYLE_SCHEME_MANAGER_BI__
#define __GTK_SOURCE_STYLE_SCHEME_MANAGER_BI__
/'
 *  gtksourcestyleschememanager.h
 *
 *  Copyright (C) 2003-2007 - Paolo Maggi <paolo.maggi@polito.it>
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

#include "gtksourceview/gtksourcestylescheme.bi"

extern "c"

#define GTK_TYPE_SOURCE_STYLE_SCHEME_MANAGER (gtk_source_style_scheme_manager_get_type ())
#define GTK_SOURCE_STYLE_SCHEME_MANAGER(obj) (G_TYPE_CHECK_INSTANCE_CAST((obj), GTK_TYPE_SOURCE_STYLE_SCHEME_MANAGER, GtkSourceStyleSchemeManager))
#define GTK_SOURCE_STYLE_SCHEME_MANAGER_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST((klass), GTK_TYPE_SOURCE_STYLE_SCHEME_MANAGER, GtkSourceStyleSchemeManagerClass))
#define GTK_IS_SOURCE_STYLE_SCHEME_MANAGER(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), GTK_TYPE_SOURCE_STYLE_SCHEME_MANAGER))
#define GTK_IS_SOURCE_STYLE_SCHEME_MANAGER_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), GTK_TYPE_SOURCE_STYLE_SCHEME_MANAGER))
#define GTK_SOURCE_STYLE_SCHEME_MANAGER_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS((obj), GTK_TYPE_SOURCE_STYLE_SCHEME_MANAGER, GtkSourceStyleSchemeManagerClass))

type GtkSourceStyleSchemeManager        as _GtkSourceStyleSchemeManager
type GtkSourceStyleSchemeManagerClass   as _GtkSourceStyleSchemeManagerClass
type GtkSourceStyleSchemeManagerPrivate as _GtkSourceStyleSchemeManagerPrivate

type _GtkSourceStyleSchemeManager
  as GObject parent
  as GtkSourceStyleSchemeManagerPrivate ptr priv
end type

type _GtkSourceStyleSchemeManagerClass
  as GObjectClass parent_class
  ' Padding for future expansion
  _gtk_source_reserved1 as sub ()
  _gtk_source_reserved2 as sub ()
  _gtk_source_reserved3 as sub ()
  _gtk_source_reserved4 as sub ()
end type

declare function gtk_source_style_scheme_manager_get_type () as GType 

declare function gtk_source_style_scheme_manager_new () as GtkSourceStyleSchemeManager ptr 
declare function gtk_source_style_scheme_manager_get_default () as GtkSourceStyleSchemeManager ptr 
declare sub      gtk_source_style_scheme_manager_set_search_path (sm as GtkSourceStyleSchemeManager ptr,path as gchar ptr ptr)
declare sub      gtk_source_style_scheme_manager_append_search_path (sm as GtkSourceStyleSchemeManager ptr, path as gchar ptr)
declare sub      gtk_source_style_scheme_manager_prepend_search_path (sm as GtkSourceStyleSchemeManager ptr, path as gchar ptr)
declare function gtk_source_style_scheme_manager_get_search_path (sm as GtkSourceStyleSchemeManager ptr) as gchar ptr ptr
declare sub      gtk_source_style_scheme_manager_force_rescan (sm as GtkSourceStyleSchemeManager ptr)
declare function gtk_source_style_scheme_manager_get_scheme_ids (sm as GtkSourceStyleSchemeManager ptr) as gchar ptr ptr
declare function gtk_source_style_scheme_manager_get_scheme (sm as GtkSourceStyleSchemeManager ptr, scheme_id as gchar ptr) as GtkSourceStyleScheme ptr

end extern

#endif ' __GTK_SOURCE_STYLE_SCHEME_MANAGER_BI__

