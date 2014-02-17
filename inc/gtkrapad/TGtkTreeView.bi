namespace GtkRapad

    type TGtkTreeView
        public:
            declare constructor()

            declare operator cast() as GtkWidget ptr

            declare sub initWithModel( byval m as GtkTreeModel ptr, byval nc as uinteger )

            declare property column( byval i as integer ) as TGtkTreeViewColumn

            declare property store() as GtkTreeModel ptr

            DECLARE_COMMON_FUNCS()

        private:
            iter_ as GtkTreeIter
            COMMON_MEMBERS()
    end type

end namespace
