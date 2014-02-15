#ifndef __GTK_SOURCE_ITER_BI__
#define __GTK_SOURCE_ITER_BI__
/'
 *  gtksourceiter.h
 *
 *  Copyright (C) 2000, 2002 Paolo Maggi
 *  Copyright (C) 2002, 2003 Jeroen Zwartepoorte
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

#include once "gtk/gtktextiter.bi"

extern "c"

enum GtkSourceSearchFlags
  GTK_SOURCE_SEARCH_VISIBLE_ONLY     = 1 shl 0
  GTK_SOURCE_SEARCH_TEXT_ONLY        = 1 shl 1
  GTK_SOURCE_SEARCH_CASE_INSENSITIVE = 1 shl 2
  ' Possible future plans: SEARCH_REGEXP
end enum 

declare function gtk_source_iter_forward_search ( _
  iter as GtkTextIter ptr, str_  as gchar ptr, flags as GtkSourceSearchFlags, _
  match_start as GtkTextIter ptr, match_end as GtkTextIter ptr, limit as GtkTextIter ptr) as gboolean

declare function gtk_source_iter_backward_search ( _
  iter as GtkTextIter ptr, str_ as gchar ptr, flags as GtkSourceSearchFlags, _
  match_start as GtkTextIter ptr, match_end   as GtkTextIter ptr, limit as GtkTextIter ptr) as gboolean

end extern

#endif /* __GTK_SOURCE_ITER_H__ */
