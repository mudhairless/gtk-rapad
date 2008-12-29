namespace GtkRapad

    type TGtkListViewColumnItem
        Key as string
        Text as string
    end type

    type TGtkListViewColumn
        public:
            declare constructor()
            declare operator cast() as GtkTreeViewColumn pointer

            declare sub Associate( byval p as GtkWidget pointer )
            declare sub Show()
            declare sub Hide()
            declare sub ShowAll()
            declare sub HideAll()
            declare sub Destroy()
            declare sub SetParent( byval p as GtkWidget Pointer )
            declare function GetParent() as GtkWidget Pointer

        private:
            id_ as GtkTreeViewColumn pointer
            title_ as string
            key_ as string
            item(0) as TGtkListViewColumnItem
    end type

end namespace
