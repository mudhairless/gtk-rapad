#ifndef RAPAD_NO_SOURCEVIEW

#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    TEXT_MARK_COMMON(TGtkSourceMark)

    constructor TGtkSourceMark( byref name_ as string, byref cat_ as string )
        id_ = gtk_source_mark_new(name_,cat_)
    end constructor

    constructor TGtkSourceMark( byval i as GtkSourceMark ptr )
        id_ = i
    end constructor

    property TGtkSourceMark.category() as string
        return *gtk_source_mark_get_category(id_)
    end property

    function TGtkSourceMark.nextMark( byref cat_ as string = "" ) as GtkSourceMark ptr
        if cat_ = "" then
            return gtk_source_mark_next(id_,null)
        else
            return gtk_source_mark_next(id_,cat_)
        end if
    end function

    function TGtkSourceMark.prevMark( byref cat_ as string = "" ) as GtkSourceMark ptr
        if cat_ = "" then
            return gtk_source_mark_prev(id_,null)
        else
            return gtk_source_mark_prev(id_,cat_)
        end if
    end function
    
    operator TGtkSourceMark.cast() as GtkSourceMark ptr
        return id_
    end operator

end namespace

#endif
