#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkTreeStore
    end constructor

    constructor TGtkTreeStore( byval i as GtkTreeModel ptr )
        id_ = i
    end constructor

    sub TGtkTreeStore.init( columntypes() as integer )
        id_ = gtk_tree_store_newv(ubound(columntypes)+1,@columntypes(0))
    end sub

    sub TGtkTreeStore.setValue( byval i as TGtkTreeIter, byval coln as integer, byval v as GValue ptr )
        gtk_tree_store_set_value(id_,i,coln,v)
    end sub

    sub TGtkTreeStore.setValues( byval i as TGtkTreeIter, byval cols as integer ptr, byval vs as GValue ptr, byval nvals as integer )
        gtk_tree_store_set_valuesv(id_,i,cols,vs,nvals)
    end sub

    function TGtkTreeStore.remove( byval i as TGtkTreeIter ) as gboolean
        return gtk_tree_store_remove(id_,i)
    end function

    sub TGtkTreeStore.insert( byval parent_ as TGtkTreeIter, byref out_ as TGtkTreeIter, byval position as integer )
        gtk_tree_store_insert(id_,out_,parent_,position)
    end sub

    sub TGtkTreeStore.insertBefore( byval parent_ as TGtkTreeIter, byval sibling as TGtkTreeIter, byref out_ as TGtkTreeIter )
        gtk_tree_store_insert_before(id_,out_,parent_,sibling)
    end sub

    sub TGtkTreeStore.insertAfter( byval parent_ as TGtkTreeIter, byval sibling as TGtkTreeIter, byref out_ as TGtkTreeIter )
        gtk_tree_store_insert_after(id_,out_,parent_,sibling)
    end sub

    sub TGtkTreeStore.prepend( byval parent_ as TGtkTreeIter, byref out_ as TGtkTreeIter )
        gtk_tree_store_prepend(id_,out_,parent_)
    end sub

    sub TGtkTreeStore.append( byval parent_ as TGtkTreeIter, byref out_ as TGtkTreeIter )
        gtk_tree_store_append(id_,out_,parent_)
    end sub

    function TGtkTreeStore.iterIsValid( byval i as TGtkTreeIter ) as gboolean
        return gtk_tree_store_iter_is_valid(id_,i)
    end function

    sub TGtkTreeStore.swap_( byval a as TGtkTreeIter, byval b as TGtkTreeIter )
        gtk_tree_store_swap(id_,a,b)
    end sub

    sub TGtkTreeStore.moveBefore( byval p as TGtkTreeIter, byref out_ as TGtkTreeIter )
        gtk_tree_store_move_before(id_,out_,p)
    end sub

    sub TGtkTreeStore.moveAfter( byval p as TGtkTreeIter, byref out_ as TGtkTreeIter )
        gtk_tree_store_move_after(id_,out_,p)
    end sub

    operator TGtkTreeStore.cast() as GtkTreeModel ptr
        return GTK_TREE_MODEL(id_)
    end operator

    sub TGtkTreeStore.clear()
        gtk_tree_store_clear(id_)
    end sub

end namespace
