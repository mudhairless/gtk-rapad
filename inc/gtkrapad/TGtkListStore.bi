namespace GtkRapad

type TGtkListStore
    declare constructor( byval i as GtkTreeModel ptr = 0 )

    declare sub setColumnTypes( columns() as integer )

    declare sub insertRow( byval i as integer )
    declare sub prependRow()
    declare sub appendRow()

    declare sub removeRow( byval i as integer )

    declare function valueAt( byval row_ as integer, byval col_ as integer = 0 ) as GValue ptr

    declare property length() as uinteger

    declare sub Add overload( byval sText as string, byval col_n as integer = 0 )
    declare sub Add ( byval sDbl as double, byval col_n as integer = 0 )
    declare sub Add ( byval sFlt as single, byval col_n as integer = 0 )
    declare sub Add ( byval sUll as ulongint, byval col_n as integer = 0 )
    declare sub Add ( byval sLL as longint, byval col_n as integer = 0 )
    declare sub Add ( byval suL as ulong, byval col_n as integer = 0 )
    declare sub Add ( byval sLng as long, byval col_n as integer = 0 )
    declare sub Add ( byval sUint as uinteger, byval col_n as integer = 0 )
    declare sub Add ( byval sInt as integer, byval col_n as integer = 0 )
    declare sub Add ( byval sUbyte as ubyte, byval col_n as integer = 0 )
    declare sub Add ( byval sByte as byte, byval col_n as integer = 0 )
    declare sub AddBool ( byval sBool as gboolean, byval col_n as integer = 0 )
    declare sub Add ( byval sPtr as any ptr, byval col_n as integer = 0 )

    declare property columnTypes() as integer ptr
    declare property numColumns() as uinteger

    declare sub clear()

    declare operator cast() as GtkListStore ptr
    private:
    cols as integer ptr
    coln as uinteger
    iter_ as GtkTreeIter
    id_ as GtkListStore ptr
end type

end namespace
