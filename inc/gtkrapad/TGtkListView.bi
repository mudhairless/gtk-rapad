namespace GtkRapad

    type TGtkListView
        public:
            declare constructor()

            declare operator cast() as GtkWidget pointer

            declare sub initWithModel( byval m as TGtkListStore )
            declare sub setColumnTitle( byval col_n as integer, byref sText as string )
            declare function getColumnTitle( byval col_n as integer ) as string

            declare property store() as TGtkListStore

            DECLARE_COMMON_FUNCS()

        private:
            iter_ as GtkTreeIter            'an iter (or iteration) is a row within a colunm
            model_ as GtkListStore pointer  'Our list of data
            COMMON_MEMBERS()
    end type

end namespace
