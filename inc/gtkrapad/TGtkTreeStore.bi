namespace GtkRapad

type TGtkTreeStore

    declare constructor
    declare constructor( byval i as GtkTreeModel ptr )

    declare sub init( columntypes() as integer )

    declare sub setValue( byval i as TGtkTreeIter, byval coln as integer, byval v as GValue ptr )
    declare sub setValues( byval i as TGtkTreeIter, byval cols as integer ptr, byval vs as GValue ptr, byval nvals as integer )

    declare function remove( byval i as TGtkTreeIter ) as gboolean

    declare sub insert( byval parent_ as TGtkTreeIter, byref out_ as TGtkTreeIter, byval position as integer )
    declare sub insertBefore( byval parent_ as TGtkTreeIter, byval sibling as TGtkTreeIter, byref out_ as TGtkTreeIter )
    declare sub insertAfter( byval parent_ as TGtkTreeIter, byval sibling as TGtkTreeIter, byref out_ as TGtkTreeIter )

    declare sub prepend( byval parent_ as TGtkTreeIter, byref out_ as TGtkTreeIter )
    declare sub append( byval parent_ as TGtkTreeIter, byref out_ as TGtkTreeIter )

    declare function iterIsValid( byval i as TGtkTreeIter ) as gboolean

    declare sub swap_( byval a as TGtkTreeIter, byval b as TGtkTreeIter )
    declare sub moveBefore( byval p as TGtkTreeIter, byref out_ as TGtkTreeIter )
    declare sub moveAfter( byval p as TGtkTreeIter, byref out_ as TGtkTreeIter )

    declare operator cast() as GtkTreeModel ptr

    declare sub clear()

    private:
    id_ as GtkTreeStore ptr
end type

end namespace
