#ifndef __GTKSOURCEMARK_BI__
#define __GTKSOURCEMARK_BI__
/'
 *  gtksourcebuffer.c
 *
 *  Copyright (C) 2007 by:
 *		Johannes Schmid <jhs@gnome.org>
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

#include once "gtk/gtk.bi"

extern "c"

#define GTK_TYPE_SOURCE_MARK             (gtk_source_mark_get_type ())
#define GTK_SOURCE_MARK(obj)             (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_SOURCE_MARK, GtkSourceMark))
#define GTK_SOURCE_MARK_CLASS(klass)     (G_TYPE_CHECK_CLASS_CAST ((klass), GTK_TYPE_SOURCE_MARK, GtkSourceMarkClass))
#define GTK_IS_SOURCE_MARK(obj)          (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_SOURCE_MARK))
#define GTK_IS_SOURCE_MARK_CLASS(klass)  (G_TYPE_CHECK_CLASS_TYPE ((klass), GTK_TYPE_SOURCE_MARK))
#define GTK_SOURCE_MARK_GET_CLASS(obj)   (G_TYPE_INSTANCE_GET_CLASS ((obj), GTK_TYPE_SOURCE_MARK, GtkSourceMarkClass))

type GtkSourceMark        as _GtkSourceMark
type GtkSourceMarkClass   as _GtkSourceMarkClass
type GtkSourceMarkPrivate as _GtkSourceMarkPrivate

type _GtkSourceMark
  as GtkTextMark parent_instance
  as GtkSourceMarkPrivate ptr priv
end type

type _GtkSourceMarkClass
  as GtkTextMarkClass parent_class
  ' Padding for future expansion
  _gtk_source_reserved1 as sub ()
  _gtk_source_reserved2 as sub ()
end type

declare function gtk_source_mark_get_type () as GType
declare function gtk_source_mark_new (name_ as gchar ptr, category as gchar ptr) as GtkSourceMark ptr
declare function gtk_source_mark_get_category (mark as GtkSourceMark ptr) as gchar ptr
declare function gtk_source_mark_next (mark as GtkSourceMark ptr,category as gchar ptr) as GtkSourceMark ptr
declare function gtk_source_mark_prev (mark as GtkSourceMark ptr,category as gchar ptr) as GtkSourceMark ptr

end extern

#endif ' __GTKSOURCEMARK_BI__
