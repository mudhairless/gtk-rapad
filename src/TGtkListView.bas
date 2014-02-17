#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkListView)

    constructor TGtkListView()
        model_ = gtk_list_store_new(0, G_TYPE_NONE)
        id_ = gtk_tree_view_new_with_model( GTK_TREE_MODEL(model_) )
        init()
    end constructor

    sub TGtkListView.setColumnTypes( columns() as integer )
        gtk_widget_destroy(id_)
        model_ = gtk_list_store_newv(ubound(columns)+1,@columns(0))
        id_ = gtk_tree_view_new_with_model( GTK_TREE_MODEL(model_) )
        for n as integer = lbound(columns) to ubound(columns)
            var renderer = gtk_cell_renderer_text_new()
            var col = gtk_tree_view_column_new_with_attributes("Column " & n,renderer,"text",n,0)
            gtk_tree_view_append_column(GTK_TREE_VIEW(id_),col)
        next
        init()
    end sub

    sub TGtkListView.setColumnTitle( byval col_n as integer, byref sText as string )
        var col = gtk_tree_view_get_column(GTK_TREE_VIEW(id_),col_n)
        if col = 0 then
            print "Could not set title"
        else
            gtk_tree_view_column_set_title(col,sText)
        end if
    end sub

    function TGtkListView.getColumnTitle( byval col_n as integer ) as string
        var col = gtk_tree_view_get_column(GTK_TREE_VIEW(id_),col_n)
        dim ret as string
        ret = *gtk_tree_view_column_get_title(col)
        return ret
    end function

    operator TGtkListView.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkListView.appendRow( )
        gtk_list_store_append (model_, @iter_)
    end sub

    sub TGtkListView.Add( byval sText as string, byval col_n as integer )
        dim v as GValue
        g_value_init_(@v,G_TYPE_STRING)
        g_value_set_string(@v,sText)
        gtk_list_store_set_value(model_, @iter_, col_n, @v)
    end sub

    sub TGtkListView.Add ( byval sDbl as double, byval col_n as integer = 0 )
        dim v as GValue
        g_value_init_(@v,G_TYPE_DOUBLE)
        g_value_set_double(@v,sDbl)
        gtk_list_store_set_value(model_, @iter_, col_n, @v)
    end sub

    sub TGtkListView.Add ( byval sFlt as single, byval col_n as integer = 0 )
        dim v as GValue
        g_value_init_(@v,G_TYPE_FLOAT)
        g_value_set_float(@v,sFlt)
        gtk_list_store_set_value(model_, @iter_, col_n, @v)
    end sub

    sub TGtkListView.Add ( byval sUll as ulongint, byval col_n as integer = 0 )
        dim v as GValue
        g_value_init_(@v,G_TYPE_UINT64)
        g_value_set_uint64(@v,sUll)
        gtk_list_store_set_value(model_, @iter_, col_n, @v)
    end sub

    sub TGtkListView.Add ( byval sLL as longint, byval col_n as integer = 0 )
        dim v as GValue
        g_value_init_(@v,G_TYPE_INT64)
        g_value_set_int64(@v,sLL)
        gtk_list_store_set_value(model_, @iter_, col_n, @v)
    end sub

    sub TGtkListView.Add ( byval suL as ulong, byval col_n as integer = 0 )
        dim v as GValue
        g_value_init_(@v,G_TYPE_ULONG)
        g_value_set_ulong(@v,suL)
        gtk_list_store_set_value(model_, @iter_, col_n, @v)
    end sub

    sub TGtkListView.Add ( byval sLng as long, byval col_n as integer = 0 )
        dim v as GValue
        g_value_init_(@v,G_TYPE_LONG)
        g_value_set_long(@v,sLng)
        gtk_list_store_set_value(model_, @iter_, col_n, @v)
    end sub

    sub TGtkListView.Add ( byval sUint as uinteger, byval col_n as integer = 0 )
        dim v as GValue
        g_value_init_(@v,G_TYPE_UINT)
        g_value_set_uint(@v,sUint)
        gtk_list_store_set_value(model_, @iter_, col_n, @v)
    end sub

    sub TGtkListView.Add ( byval sInt as integer, byval col_n as integer = 0 )
        dim v as GValue
        g_value_init_(@v,G_TYPE_INT)
        g_value_set_int(@v,sInt)
        gtk_list_store_set_value(model_, @iter_, col_n, @v)
    end sub

    sub TGtkListView.Add ( byval sUbyte as ubyte, byval col_n as integer = 0 )
        dim v as GValue
        g_value_init_(@v,G_TYPE_UCHAR)
        g_value_set_uchar(@v,sUbyte)
        gtk_list_store_set_value(model_, @iter_, col_n, @v)
    end sub

    sub TGtkListView.Add ( byval sByte as byte, byval col_n as integer = 0 )
        dim v as GValue
        g_value_init_(@v,G_TYPE_CHAR)
        g_value_set_schar(@v,sByte)
        gtk_list_store_set_value(model_, @iter_, col_n, @v)
    end sub

    sub TGtkListView.AddBool ( byval sBool as gboolean, byval col_n as integer = 0 )
        var v = g_value_init
        g_value_init_(@v,G_TYPE_BOOLEAN)
        g_value_set_boolean(@v,sBool)
        gtk_list_store_set_value(model_, @iter_, col_n, @v)
    end sub

    sub TGtkListView.Add ( byval sPtr as any ptr, byval col_n as integer = 0 )
        dim v as GValue
        g_value_init_(@v,G_TYPE_POINTER)
        g_value_set_pointer(@v,sPtr)
        gtk_list_store_set_value(model_, @iter_, col_n, @v)
    end sub

end namespace
