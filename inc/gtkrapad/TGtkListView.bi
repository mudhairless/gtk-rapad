namespace GtkRapad

    type TGtkListView
        public:
            declare constructor()

            declare operator cast() as GtkWidget pointer

            declare sub initWithModel( byval m as TGtkListStore )

            declare property column( byval i as integer ) as TGtkTreeViewColumn

            declare property store() as TGtkListStore

            DECLARE_COMMON_FUNCS()

        private:
            iter_ as GtkTreeIter            'an iter (or iteration) is a row within a colunm
            model_ as GtkListStore pointer  'Our list of data
            COMMON_MEMBERS()
    end type

end namespace
