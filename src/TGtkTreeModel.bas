#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

'':::: TGTkTreePath ::::
    constructor TGtkTreePath
        id_ = gtk_tree_path_new_first()
    end constructor

    constructor TGtkTreePath( byref path_ as string )
        id_ = gtk_tree_path_new_from_string(path_)
    end constructor

    constructor TGtkTreePath( byval i as GtkTreePath ptr )
        id_ = gtk_tree_path_copy(i)
    end constructor

    destructor TGtkTreePath
        gtk_tree_path_free(id_)
    end destructor

    operator TGtkTreePath.cast() as GtkTreePath ptr
        return id_
    end operator

    property TGtkTreePath.asString() as string
        return *gtk_tree_path_to_string(id_)
    end property

    property TGtkTreePath.depth() as integer
        return gtk_tree_path_get_depth(id_)
    end property

    function TGtkTreePath.up() as gboolean
        return gtk_tree_path_up(id_)
    end function

    sub TGtkTreePath.down()
        gtk_tree_path_down(id_)
    end sub

    sub TGtkTreePath.next_()
        gtk_tree_path_next(id_)
    end sub

    function TGtkTreePath.prev() as gboolean
        return gtk_tree_path_prev(id_)
    end function

    function TGtkTreePath.isAncestorOf( byval x as TGtkTreePath ) as gboolean
        return gtk_tree_path_is_ancestor(id_,x)
    end function

    function TGtkTreePath.isDescendantOf( byval x as TGtkTreePath ) as gboolean
        return gtk_tree_path_is_descendant(id_,x)
    end function

    property TGtkTreePath.valid() as gboolean
        if id_ <> 0 then return true
        return false
    end property

':::: TGtkTreeIter ::::
    constructor TGtkTreeIter
    end constructor

    constructor TGtkTreeIter( byval i as GtkTreeIter ptr )
        id_ = gtk_tree_iter_copy(i)
    end constructor

    destructor TGtkTreeIter
        if id_ <> 0 then gtk_tree_iter_free(id_)
    end destructor

    operator TGtkTreeIter.let( byval x as GtkTreeIter ptr )
        if id_ <> 0 then gtk_tree_iter_free(id_)
        id_ = gtk_tree_iter_copy(x)
    end operator

    operator TGtkTreeIter.cast() as GtkTreeIter ptr
        return id_
    end operator

    property TGtkTreeIter.valid() as gboolean
        if id_ <> 0 then return true
        return false
    end property

':::: TGtkTreeModel ::::

    constructor TGtkTreeModel( byval i as GtkTreeModel ptr )
        id_ = i
    end constructor

    operator TGtkTreeModel.cast() as GtkTreeModel ptr
        return id_
    end operator

    property TGtkTreeModel.numColumns() as integer
        return gtk_tree_model_get_n_columns(id_)
    end property

    property TGtkTreeModel.colType( byval i as integer ) as GType
        return gtk_tree_model_get_column_type(id_,i)
    end property

    function TGtkTreeModel.getIter overload( byval p as TGtkTreePath ) as TGtkTreeIter
        dim i as GtkTreeIter
        if gtk_tree_model_get_iter(id_,@i,p) = true then
            return TGtkTreeIter(@i)
        else
            return TGtkTreeIter(0)
        end if
    end function

    function TGtkTreeModel.getIter( byref p as string ) as TGtkTreeIter
        dim i as GtkTreeIter
        if gtk_tree_model_get_iter_from_string(id_,@i,p) = true then
            return TGtkTreeIter(@i)
        else
            return TGtkTreeIter(0)
        end if
    end function

    function TGtkTreeModel.getIter() as TGtkTreeIter
        dim i as GtkTreeIter
        if gtk_tree_model_get_iter_first(id_,@i) = true then
            return TGtkTreeIter(@i)
        else
            return TGtkTreeIter(0)
        end if
    end function

    function TGtkTreeModel.getPath( byval p as TGtkTreeIter ) as TGtkTreePath
        return TGtkTreePath(gtk_tree_model_get_path(id_,p))
    end function

    function TGtkTreeModel.getValue( byval i as TGtkTreeIter, byval col_ as integer ) as GValue ptr
        dim v as GValue ptr
        gtk_tree_model_get_value(id_,i,col_,v)
        return v
    end function

    function TGtkTreeModel.iterNext( byval i as TGtkTreeIter ) as gboolean
        return gtk_tree_model_iter_next(id_,i)
    end function

    function TGtkTreeModel.childrenOf( byval i as TGtkTreeIter, byval out_ as TGtkTreeIter ) as gboolean
        return gtk_tree_model_iter_children(id_,out_,i)
    end function

    function TGtkTreeModel.hasChildren( byval i as TGtkTreeIter ) as gboolean
        return gtk_tree_model_iter_has_child(id_,i)
    end function

    function TGtkTreeModel.children( byval i as TGtkTreeIter ) as integer
        return gtk_tree_model_iter_n_children(id_,i)
    end function

    function TGtkTreeModel.child( byval i as TGtkTreeIter, byval n as integer ) as TGtkTreeIter
        var x = TGtkTreeIter()
        gtk_tree_model_iter_nth_child(id_,x,i,n)
        return TGtkTreeIter(cast(GtkTreeIter ptr,x))
    end function

    function TGtkTreeModel.parent( byval i as TGtkTreeIter ) as TGtkTreeIter
        var x = TGtkTreeIter()
        gtk_tree_model_iter_parent(id_,x,i)
        return TGtkTreeIter(cast(GtkTreeIter ptr,x))
    end function

    function TGtkTreeModel.getStringOf( byval i as TGtkTreeIter ) as string
        return *gtk_tree_model_get_string_from_iter(id_,i)
    end function

end namespace
