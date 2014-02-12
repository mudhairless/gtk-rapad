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

            declare sub Associate( byval p as GtkWidget pointer )
            declare sub Destroy()
            declare sub Hide()
            declare sub HideAll()
            declare sub Show()
            declare sub ShowAll()

            declare function GetParent() as GtkWidget pointer
            declare function GetName() as string

            declare sub appendRow()
            declare sub AddString( byval sText as string, byval col_n as integer = 0 )

            declare sub setColumnTitle( byval col_n as integer, byref sText as string )
            declare function getColumnTitle( byval col_n as integer ) as string

            '---------------------------------------

            declare sub SetName( byref newName as string )
            declare sub SetParent( byval p as GtkWidget pointer )

        private:
            gtype_ as string                'GtkWidget type
            id_ as GtkWidget pointer        'pointer to this object
            iter_ as GtkTreeIter            'an iter (or iteration) is a row within a colunm
            model_ as GtkListStore pointer  'Our list of data
            objname_ as string
            parent_ as GtkWidget pointer    'pointer to our parent object
    end type

end namespace
