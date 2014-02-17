namespace GtkRapad

    type TGtkTreeView
        public:
            declare constructor()

            declare operator cast() as GtkWidget ptr

            declare sub initWithModel( byval m as GtkTreeModel ptr, byval nc as uinteger )

            declare property column( byval i as integer ) as TGtkTreeViewColumn

            declare property store() as GtkTreeModel ptr

            declare property indentationLevel() as integer
            declare property indentationLevel( byval i as integer )

            declare property showExpanders() as gboolean
            declare property showExpanders( byval t as gboolean )

            declare property headersVisible() as gboolean
            declare property headersVisible( byval t as gboolean )

            declare sub autosizeColumns()

            declare property headersClickable() as gboolean
            declare property headersClickable( byval t as gboolean )

            declare property alternateRowsHint() as gboolean
            declare property alternateRowsHint( byval t as gboolean )

            declare sub expandAll()
            declare sub collapseAll()

            declare property enableSearch() as gboolean
            declare property enableSearch( byval t as gboolean )

            declare property searchColumn() as integer
            declare property searchColumn( byval i as integer )

            declare property searchEntry() as TGtkEntry
            declare property searchEntry( byval i as TGtkEntry )

            declare property fixedHeightMode() as gboolean
            declare property fixedHeightMode( byval t as gboolean )

            declare property hoverSelection() as gboolean
            declare property hoverSelection( byval t as gboolean )

            declare property hoverExpand() as gboolean
            declare property hoverExpand( byval t as gboolean )

            declare property rubberBanding() as gboolean
            declare property rubberBanding( byval t as gboolean )

            declare property treeLines() as gboolean
            declare property treeLines( byval t as gboolean )

            declare property gridLines() as GtkTreeViewGridLines
            declare property gridLines( byval t as GtkTreeViewGridLines )

            declare property tooltipColumn() as integer
            declare property tooltipColumn( byval i as integer )

            DECLARE_COMMON_FUNCS()

        private:
            iter_ as GtkTreeIter
            COMMON_MEMBERS()
    end type

end namespace
