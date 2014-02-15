#ifndef __GTK_SOURCE_STYLE_BI__
#define __GTK_SOURCE_STYLE_BI__
/'
 *  gtksourcestyle.h
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

#include once "glib-object.bi"

extern "c"

#define GTK_TYPE_SOURCE_STYLE    (gtk_source_style_get_type())
#define GTK_SOURCE_STYLE(obj)    (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_SOURCE_STYLE, GtkSourceStyle))
#define GTK_IS_SOURCE_STYLE(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_SOURCE_STYLE))

type GtkSourceStyle as _GtkSourceStyle

declare function gtk_source_style_get_type () as GType
declare function gtk_source_style_copy     (style as GtkSourceStyle ptr) as GtkSourceStyle ptr 

end extern

#endif  ' __GTK_SOURCE_STYLE_BI__
