namespace GtkRapad

type TGtkComboBoxText
    declare constructor()
    declare constructor( byval with_entry as gboolean )

    declare sub appendText( byref txt as string )
    declare sub insertText( byval p as integer, byref txt as string )
    declare sub prependText( byref txt as string )

    declare sub remove( byval p as integer )

    declare property activeText() as string

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
