namespace GtkRapad

type TGtkSourceBuffer
    declare constructor()
    declare constructor( byval l as GtkSourceLanguage ptr )
    declare constructor( byval i as GtkSourceBuffer ptr )

    declare property language() as GtkSourceLanguage ptr
    declare property language( byval v as GtkSourceLanguage ptr )

    declare property highlightSyntax() as gboolean
    declare property highlightSyntax( byval t as gboolean )

    declare property highlightMatchingBrackets() as gboolean
    declare property highlightMatchingBrackets( byval t as gboolean )

    declare property styleScheme() as GtkSourceStyleScheme ptr
    declare property styleScheme( byval b as GtkSourceStyleScheme ptr )

    declare property maxUndoLevels() as integer
    declare property maxUndoLevels( byval i as integer )

    declare sub redo()
    declare sub undo()

    declare property canRedo() as gboolean
    declare property canUndo() as gboolean
    
    declare operator cast() as GtkSourceBuffer ptr

    private:
    id_ as GtkSourceBuffer ptr
end type

end namespace
