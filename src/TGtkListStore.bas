#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkListStore( byval i as GtkTreeModel ptr = 0 )
        if i <> 0 then
            id_ = GTK_LIST_STORE(i)
        end if
    end constructor

    operator TGtkListStore.cast() as GtkListStore ptr
        return id_
    end operator

    sub TGtkListStore.setColumnTypes( columns() as integer )
        if id_ <> 0 then
            g_object_unref(G_OBJECT(id_))
        end if
        id_ = gtk_list_store_newv(ubound(columns)+1,@columns(0))
        cols = new integer(ubound(columns)+1)
        for n as integer = 0 to ubound(columns)
            cols[n] = columns(n)
        next
        coln = ubound(columns)+1
    end sub

    property TGtkListStore.numColumns() as uinteger
        return coln
    end property

    property TGtkListStore.columnTypes() as integer ptr
        return cols
    end property

    function TGtkListStore.valueAt( byval row_ as integer, byval col_ as integer = 0 ) as GValue ptr
        gtk_tree_model_get_iter_first(GTK_TREE_MODEL(id_),@iter_)
        dim x as GtkTreeIter
        gtk_tree_model_iter_nth_child(GTK_TREE_MODEL(id_),@x,@iter_,row_)
        var ret = new GValue
        gtk_tree_model_get_value(GTK_TREE_MODEL(id_),@x,col_,ret)
        return ret
    end function

    sub TGtkListStore.removeRow( byval i as integer )
        gtk_tree_model_get_iter_first(GTK_TREE_MODEL(id_),@iter_)
        dim x as GtkTreeIter
        gtk_tree_model_iter_nth_child(GTK_TREE_MODEL(id_),@x,@iter_,i)
        gtk_list_store_remove(id_,@x)
    end sub

    sub TGtkListStore.prependRow()
        gtk_list_store_prepend(id_,@iter_)
    end sub

    sub TGtkListStore.insertRow( byval i as integer )
        gtk_list_store_insert(id_,@iter_,i)
    end sub

    sub TGtkListStore.appendRow( )
        gtk_list_store_append (id_, @iter_)
    end sub

    sub TGtkListStore.Add( byval sText as string, byval col_n as integer )
        dim v as GValue
        g_value_init_(@v,G_TYPE_STRING)
        g_value_set_string(@v,sText)
        gtk_list_store_set_value(id_, @iter_, col_n, @v)
    end sub

    sub TGtkListStore.Add ( byval sDbl as double, byval col_n as integer = 0 )
        dim v as GValue
        g_value_init_(@v,G_TYPE_DOUBLE)
        g_value_set_double(@v,sDbl)
        gtk_list_store_set_value(id_, @iter_, col_n, @v)
    end sub

    sub TGtkListStore.Add ( byval sFlt as single, byval col_n as integer = 0 )
        dim v as GValue
        g_value_init_(@v,G_TYPE_FLOAT)
        g_value_set_float(@v,sFlt)
        gtk_list_store_set_value(id_, @iter_, col_n, @v)
    end sub

    sub TGtkListStore.Add ( byval sUll as ulongint, byval col_n as integer = 0 )
        dim v as GValue
        g_value_init_(@v,G_TYPE_UINT64)
        g_value_set_uint64(@v,sUll)
        gtk_list_store_set_value(id_, @iter_, col_n, @v)
    end sub

    sub TGtkListStore.Add ( byval sLL as longint, byval col_n as integer = 0 )
        dim v as GValue
        g_value_init_(@v,G_TYPE_INT64)
        g_value_set_int64(@v,sLL)
        gtk_list_store_set_value(id_, @iter_, col_n, @v)
    end sub

    sub TGtkListStore.Add ( byval suL as ulong, byval col_n as integer = 0 )
        dim v as GValue
        g_value_init_(@v,G_TYPE_ULONG)
        g_value_set_ulong(@v,suL)
        gtk_list_store_set_value(id_, @iter_, col_n, @v)
    end sub

    sub TGtkListStore.Add ( byval sLng as long, byval col_n as integer = 0 )
        dim v as GValue
        g_value_init_(@v,G_TYPE_LONG)
        g_value_set_long(@v,sLng)
        gtk_list_store_set_value(id_, @iter_, col_n, @v)
    end sub

    sub TGtkListStore.Add ( byval sUint as uinteger, byval col_n as integer = 0 )
        dim v as GValue
        g_value_init_(@v,G_TYPE_UINT)
        g_value_set_uint(@v,sUint)
        gtk_list_store_set_value(id_, @iter_, col_n, @v)
    end sub

    sub TGtkListStore.Add ( byval sInt as integer, byval col_n as integer = 0 )
        dim v as GValue
        g_value_init_(@v,G_TYPE_INT)
        g_value_set_int(@v,sInt)
        gtk_list_store_set_value(id_, @iter_, col_n, @v)
    end sub

    sub TGtkListStore.Add ( byval sUbyte as ubyte, byval col_n as integer = 0 )
        dim v as GValue
        g_value_init_(@v,G_TYPE_UCHAR)
        g_value_set_uchar(@v,sUbyte)
        gtk_list_store_set_value(id_, @iter_, col_n, @v)
    end sub

    sub TGtkListStore.Add ( byval sByte as byte, byval col_n as integer = 0 )
        dim v as GValue
        g_value_init_(@v,G_TYPE_CHAR)
        g_value_set_schar(@v,sByte)
        gtk_list_store_set_value(id_, @iter_, col_n, @v)
    end sub

    sub TGtkListStore.AddBool ( byval sBool as gboolean, byval col_n as integer = 0 )
        var v = g_value_init
        g_value_init_(@v,G_TYPE_BOOLEAN)
        g_value_set_boolean(@v,sBool)
        gtk_list_store_set_value(id_, @iter_, col_n, @v)
    end sub

    sub TGtkListStore.Add ( byval sPtr as any ptr, byval col_n as integer = 0 )
        dim v as GValue
        g_value_init_(@v,G_TYPE_POINTER)
        g_value_set_pointer(@v,sPtr)
        gtk_list_store_set_value(id_, @iter_, col_n, @v)
    end sub


end namespace
