#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkTextTagTable
        id_ = gtk_text_tag_table_new()
    end constructor

    constructor TGtkTextTagTable( byval i as GtkTextTagTable ptr )
        id_ = i
    end constructor

    sub TGtkTextTagTable.add( byref t as TGtkTextTag )
        gtk_text_tag_table_add(id_,cast(GtkTextTag ptr,t))
    end sub

    sub TGtkTextTagTable.remove( byref t as TGtkTextTag )
        gtk_text_tag_table_remove(id_,cast(GtkTextTag ptr,t))
    end sub

    function TGtkTextTagTable.lookup( byref n as string ) as TGtkTextTag ptr
        var r = gtk_text_tag_table_lookup(id_,n)
        if r = 0 then return 0
        return new TGtkTextTag(r)
    end function

    function TGtkTextTagTable.length() as integer
        return gtk_text_tag_table_get_size(id_)
    end function

    operator TGtkTextTagTable.cast() as GtkTextTagTable ptr
        return id_
    end operator

end namespace
