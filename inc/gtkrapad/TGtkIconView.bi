namespace GtkRapad

type TGtkIconView
    declare constructor()
    declare constructor( byval i as GtkTreeModel ptr )
    declare operator cast() as GtkWidget ptr

    declare property model() as GtkTreeModel ptr
    declare property model( byval i as GtkTreeModel ptr )

    declare property textColumn() as integer
    declare property textColumn( byval i as integer )

    declare property markupColumn() as integer
    declare property markupColumn( byval i as integer )

    declare property pixbufColumn() as integer
    declare property pixbufColumn( byval i as integer )

    declare property tooltipColumn() as integer
    declare property tooltipColumn( byval i as integer )

    declare property selectedItems() as GList ptr
    declare sub freeSelectedItemList( byval l as GList ptr )

    declare property itemOrientation() as GtkOrientation
    declare property itemOrientation( byval i as GtkOrientation )

    declare property selectionMode() as GtkSelectionMode
    declare property selectionMode( byval i as GtkOrientation )

    declare property columns() as integer
    declare property columns( byval i as integer )

    declare property itemWidth() as integer
    declare property itemWidth( byval i as integer )

    declare property spacing() as integer
    declare property spacing( byval i as integer )

    declare property rowSpacing() as integer
    declare property rowSpacing( byval i as integer )

    declare property columnSpacing() as integer
    declare property columnSpacing( byval i as integer )

    declare property margin() as integer
    declare property margin( byval i as integer )

    declare property itemPadding() as integer
    declare property itemPadding( byval i as integer )

    DECLARE_COMMON_FUNCS()
    COMMON_MEMBERS()
end type

end namespace
