namespace GtkRapad

    enum
        COLUMN_SINGLE,
        N_COL
    end enum

    type TGtkListView
        public:
            col_count_ as integer

            declare constructor()

            'If you want to have more than 1 column this must be called first
            declare sub setColumnTypes( columns() as integer )

            declare operator cast() as GtkWidget pointer

            declare sub appendRow()
            declare sub AddString( byval sText as string, byval col_n as integer = 0 )

            declare sub setColumnTitle( byval col_n as integer, byref sText as string )
            declare function getColumnTitle( byval col_n as integer ) as string

            DECLARE_COMMON_FUNCS()

        private:
            iter_ as GtkTreeIter            'an iter (or iteration) is a row within a colunm
            model_ as GtkListStore pointer  'Our list of data
            COMMON_MEMBERS()
    end type

end namespace
