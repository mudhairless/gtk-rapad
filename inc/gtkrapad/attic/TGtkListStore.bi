namespace GtkRapad

    type TGtkListStore
        public:
            declare constructor()
            declare operator cast() as GtkListStore pointer

        private:
            id_ as GtkListStore pointer        'pointer to this object
            iter_ as GtkTreeIter pointer           'an iter (or iteration) is a row within a colunm
    end type

end namespace
