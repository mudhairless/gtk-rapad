namespace GtkRapad

type TGtkTreeViewColumn
    declare constructor
    declare constructor( byval c as GtkTreeViewColumn ptr )
    declare sub packStart( byval r as GtkCellRenderer ptr, byval e as gboolean )
    declare sub packEnd( byval r as GtkCellRenderer ptr, byval e as gboolean )
    declare sub clear()
    declare property cellRenderers() as GList ptr
    declare sub addAttribute( byval r as GtkCellRenderer ptr, _
                                byref attr_ as string, _
                                byval col_n as integer )
    declare sub clearAttributes( byval r as GtkCellRenderer ptr )
    declare property spacing() as integer
    declare property spacing( byval i as integer )
    declare property visible( byval t as gboolean )
    declare property visible() as gboolean
    declare property resizable() as gboolean
    declare property resizable( byval t as gboolean )
    declare property sizing() as GtkTreeViewColumnSizing
    declare property sizing( byval t as GtkTreeViewColumnSizing )
    declare property width() as integer
    declare property fixedWidth() as integer
    declare property fixedWidth( byval i as integer )
    declare property minWidth() as integer
    declare property minWidth( byval i as integer )
    declare property maxWidth() as integer
    declare property maxWidth( byval i as integer )
    declare property title() as string
    declare property title( byref t as string )
    declare property expand() as gboolean
    declare property expand( byval t as gboolean )
    declare property clickable() as gboolean
    declare property clickable( byval t as gboolean )
    declare property widget() as GtkWidget ptr
    declare property widget( byval w as GtkWidget ptr )
    declare property alignment() as single
    declare property alignment( byval xalign as single )
    declare property reorderable() as gboolean
    declare property reorderable( byval t as gboolean )
    declare property sortColumn() as integer
    declare property sortColumn( byval i as integer )
    declare property sortIndicator() as gboolean
    declare property sortIndicator( byval t as gboolean )
    declare property sortOrder() as GtkSortType
    declare property sortOrder( byval t as GtkSortType )
    declare operator cast() as GtkTreeViewColumn ptr
    private:
    id_ as GtkTreeViewColumn ptr
end type

end namespace
