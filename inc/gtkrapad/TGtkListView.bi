namespace GtkRapad

    enum
        COLUMN_SINGLE,
        N_COL
    end enum

    type TGtkListView
        public:
            col_count_ as integer

            declare constructor()

            declare operator cast() as GtkWidget pointer

            declare sub Associate( byval p as GtkWidget pointer )
            declare sub Show()
            declare sub Hide()
            declare sub ShowAll()
            declare sub HideAll()
            declare sub Destroy()
            declare sub SetParent( byval p as GtkWidget Pointer )
            declare function GetParent() as GtkWidget Pointer

            declare sub AddString( byval sText as string, byval col_n as integer )
            declare sub AddColumn( byval sTitle as string, byval col_n as integer )

            '---------------------------------------

        private:
            model_ as GtkTreeModel pointer  'Our list of data
            id_ as GtkWidget Pointer        'pointer to this object
            parent_ as GtkWidget pointer    'pointer to our parent object
            gtype_ as string                'GtkWidget type
            iter_ as GtkTreeIter            'an iter (or iteration) is a row within a colunm
    end type

end namespace
