namespace GtkRapad

    type TGtkTreeView
        public:

            'this is being used to test code
            declare sub Test()

            declare constructor ( )
            'declare constructor ( byval homog as gboolean, byval spacing_ as integer )

            declare operator cast() as GtkWidget pointer
            declare sub Associate( byval p as GtkWidget pointer )
            declare sub Show()
            declare sub Hide()
            declare sub ShowAll()
            declare sub HideAll()
            declare sub Destroy()
            declare sub SetParent( byval p as GtkWidget Pointer )
            declare function GetParent() as GtkWidget Pointer

            '---------------------------------------

        private:
            id_ as GtkWidget Pointer        'pointer to this object
            parent_ as GtkWidget pointer    'pointer to our parent object
            gtype_ as string                'GtkWidget type
            store_ as GtkListStore pointer  'Our list of data
            iter_ as GtkTreeIter            'why?
    end type

end namespace
