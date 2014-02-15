#ifndef __GTK_SOURCE_BUFFER_BI__
#define __GTK_SOURCE_BUFFER_BI__

/'
 *  gtksourcebuffer.h
 *
 *  Copyright (C) 1999,2000,2001,2002 by:
 *          Mikael Hermansson <tyan@linux.se>
 *          Chris Phelps <chicane@reninet.com>
 *          Jeroen Zwartepoorte <jeroen@xs4all.nl>
 *
 *  Copyright (C) 2003 - Paolo Maggi, Gustavo Giráldez
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
#include once "gtksourceview/gtksourcelanguage.bi"
#include once "gtksourceview/gtksourcemark.bi"
#include once "gtksourceview/gtksourcestylescheme.bi"

extern "c"

#define GTK_TYPE_SOURCE_BUFFER            (gtk_source_buffer_get_type ())
#define GTK_SOURCE_BUFFER(obj)            (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_SOURCE_BUFFER, GtkSourceBuffer))
#define GTK_SOURCE_BUFFER_CLASS(klass)    (G_TYPE_CHECK_CLASS_CAST ((klass), GTK_TYPE_SOURCE_BUFFER, GtkSourceBufferClass))
#define GTK_IS_SOURCE_BUFFER(obj)         (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_SOURCE_BUFFER))
#define GTK_IS_SOURCE_BUFFER_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), GTK_TYPE_SOURCE_BUFFER))
#define GTK_SOURCE_BUFFER_GET_CLASS(obj)  (G_TYPE_INSTANCE_GET_CLASS ((obj), GTK_TYPE_SOURCE_BUFFER, GtkSourceBufferClass))

type GtkSourceBuffer        as _GtkSourceBuffer
type GtkSourceBufferClass   as _GtkSourceBufferClass		
type GtkSourceBufferPrivate as _GtkSourceBufferPrivate		

type _GtkSourceBuffer
  as GtkTextBuffer parent_instance 
  as GtkSourceBufferPrivate ptr priv
end type

type _GtkSourceBufferClass
  as GtkTextBufferClass parent_class
  ' Padding for future expansion
  _gtk_source_reserved1 as sub   ()
  _gtk_source_reserved2 as sub   ()
  _gtk_source_reserved3 as sub   ()
  _gtk_source_reserved4 as sub   ()
  _gtk_source_reserved5 as sub   ()
  _gtk_source_reserved6 as sub   ()
end type

declare function gtk_source_buffer_get_type   () as GType

' Constructor
declare function gtk_source_buffer_new               (table as GtkTextTagTable ptr) as GtkSourceBuffer ptr
declare function gtk_source_buffer_new_with_language (language as GtkSourceLanguage ptr) as GtkSourceBuffer ptr

' Properties
declare function gtk_source_buffer_get_highlight_syntax (buffer as GtkSourceBuffer ptr) as gboolean
declare sub      gtk_source_buffer_set_highlight_syntax (buffer as GtkSourceBuffer ptr, highlight as gboolean)

declare function gtk_source_buffer_get_highlight_matching_brackets (buffer as GtkSourceBuffer ptr) as gboolean
declare sub      gtk_source_buffer_set_highlight_matching_brackets (buffer as GtkSourceBuffer ptr, highlight as gboolean )

declare function gtk_source_buffer_get_max_undo_levels (buffer as GtkSourceBuffer ptr) as gint
declare sub      gtk_source_buffer_set_max_undo_levels (buffer as GtkSourceBuffer ptr, max_undo_levels as gint)

declare function gtk_source_buffer_get_language (buffer as GtkSourceBuffer ptr) as GtkSourceLanguage ptr
declare sub      gtk_source_buffer_set_language (buffer as GtkSourceBuffer ptr, language as GtkSourceLanguage ptr)

declare function gtk_source_buffer_can_undo (buffer as GtkSourceBuffer ptr) as gboolean
declare function gtk_source_buffer_can_redo (buffer as GtkSourceBuffer ptr) as gboolean

declare function gtk_source_buffer_get_style_scheme (buffer as GtkSourceBuffer ptr) as GtkSourceStyleScheme ptr
declare sub      gtk_source_buffer_set_style_scheme (buffer as GtkSourceBuffer ptr, schema as GtkSourceStyleScheme ptr)

' Force highlighting
declare sub      gtk_source_buffer_ensure_highlight (buffer as GtkSourceBuffer ptr,start as GtkTextIter ptr,end_ as GtkTextIter ptr)

' Undo/redo methods
declare sub      gtk_source_buffer_undo (buffer as GtkSourceBuffer ptr)
declare sub      gtk_source_buffer_redo (buffer as GtkSourceBuffer ptr)

declare sub      gtk_source_buffer_begin_not_undoable_action (buffer as GtkSourceBuffer ptr)
declare sub      gtk_source_buffer_end_not_undoable_action   (buffer as GtkSourceBuffer ptr)

' Mark methods
declare function gtk_source_buffer_create_source_mark ( _
  buffer as GtkSourceBuffer ptr, name_ as gchar ptr, category as gchar ptr, where as GtkTextIter ptr) as GtkSourceMark ptr
declare function gtk_source_buffer_forward_iter_to_source_mark ( _
  buffer as GtkSourceBuffer ptr, iter as GtkTextIter ptr, category as gchar ptr) as gboolean
declare function gtk_source_buffer_backward_iter_to_source_mark ( _
  buffer as GtkSourceBuffer ptr, iter as GtkTextIter ptr, category as gchar ptr) as gboolean
declare function gtk_source_buffer_get_source_marks_at_iter ( _
  buffer as GtkSourceBuffer ptr, iter as GtkTextIter ptr, category as gchar ptr) as GSList ptr
declare function gtk_source_buffer_get_source_marks_at_line ( _
  buffer as GtkSourceBuffer ptr, line_ as gint, category as gchar ptr) as GSList ptr
declare sub      gtk_source_buffer_remove_source_marks ( _
  buffer as GtkSourceBuffer ptr, start as GtkTextIter ptr, end_ as GtkTextIter ptr, category as gchar ptr)
' private
declare sub      _gtk_source_buffer_update_highlight ( _
  buffer as GtkSourceBuffer ptr, start as GtkTextIter ptr, end_ as GtkTextIter ptr, synchronous as gboolean)

declare function _gtk_source_buffer_source_mark_next ( _
  buffer as GtkSourceBuffer ptr, mark as GtkSourceMark ptr, category as gchar ptr) as GtkSourceMark ptr
declare function _gtk_source_buffer_source_mark_prev ( _
  buffer as GtkSourceBuffer ptr, mark as GtkSourceMark ptr, category as gchar ptr) as  GtkSourceMark ptr
end extern

#endif ' __GTK_SOURCE_BUFFER_BI__
