namespace GtkRapad

type TGtkTreePath
    declare constructor
    declare constructor( byref path_ as string )
    declare constructor( byval i as GtkTreePath ptr )
    declare destructor
    declare operator cast() as GtkTreePath ptr
    declare property asString() as string

    declare property depth() as integer
    declare property valid() as gboolean

    declare function up() as gboolean
    declare sub down()
    declare sub next_()
    declare function prev() as gboolean

    declare function isAncestorOf( byval x as TGtkTreePath ) as gboolean
    declare function isDescendantOf( byval x as TGtkTreePath ) as gboolean

    private:
    id_ as GtkTreePath ptr
end type

type TGtkTreeIter
    declare constructor
    declare constructor( byval i as GtkTreeIter ptr )
    declare destructor
    declare operator let( byval x as GtkTreeIter ptr )
    declare operator cast() as GtkTreeIter ptr
    declare property valid() as gboolean
    private:
    id_ as GtkTreeIter ptr
end type

type TGtkTreeModel
    declare constructor( byval i as GtkTreeModel ptr )
    declare operator cast() as GtkTreeModel ptr

    declare property numColumns() as integer
    declare property colType( byval i as integer ) as GType

    declare function getIter overload( byval p as TGtkTreePath ) as TGtkTreeIter
    declare function getIter( byref p as string ) as TGtkTreeIter
    declare function getIter() as TGtkTreeIter
    declare function getPath( byval p as TGtkTreeIter ) as TGtkTreePath
    declare function getValue( byval i as TGtkTreeIter, byval col_ as integer ) as GValue ptr

    declare function iterNext( byval i as TGtkTreeIter ) as gboolean
    declare function childrenOf( byval i as TGtkTreeIter, byval out_ as TGtkTreeIter ) as gboolean
    declare function hasChildren( byval i as TGtkTreeIter ) as gboolean
    declare function children( byval i as TGtkTreeIter ) as integer
    declare function child( byval i as TGtkTreeIter, byval n as integer ) as TGtkTreeIter
    declare function parent( byval i as TGtkTreeIter ) as TGtkTreeIter

    declare function getStringOf( byval i as TGtkTreeIter ) as string

    private:
    id_ as GtkTreeModel ptr
end type

end namespace
