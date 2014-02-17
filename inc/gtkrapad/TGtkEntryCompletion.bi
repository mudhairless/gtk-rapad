namespace GtkRapad

type TGtkEntryCompletion

    declare constructor
    declare constructor( byval i as GtkEntryCompletion ptr )

    declare property entry() as GtkWidget ptr

    declare property model() as GtkTreeModel ptr
    declare property model( byval x as GtkTreeModel ptr )

    declare property minKeyLength() as integer
    declare property minKeyLength( byval i as integer )

    declare property textColumn() as integer
    declare property textColumn( byval i as integer )

    declare property inlineCompletion() as gboolean
    declare property inlineCompletion( byval t as gboolean )

    declare property inlineSelection() as gboolean
    declare property inlineSelection( byval t as gboolean )

    declare property popupCompletion() as gboolean
    declare property popupCompletion( byval t as gboolean )

    declare property widthOfEntry() as gboolean
    declare property widthOfEntry( byval t as gboolean )

    declare property popupSingleMatch() as gboolean
    declare property popupSingleMatch( byval t as gboolean )

    declare operator cast() as GtkEntryCompletion ptr

    private:
    id_ as GtkEntryCompletion ptr
end type

end namespace
