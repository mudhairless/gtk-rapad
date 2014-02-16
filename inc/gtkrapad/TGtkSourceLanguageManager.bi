namespace GtkRapad

type TGtkSourceLanguageManager

    declare constructor

    declare property searchPath() as zstring ptr ptr
    declare property searchPath( byval v as zstring ptr ptr )

    declare property langIDs() as zstring ptr ptr

    declare function getLanguage(byref id as string) as GtkSourceLanguage ptr
    declare function guessLanguage(byref fn as string, byref mimetype as string ) as GtkSourceLanguage ptr

    private:
    id_ as GtkSourceLanguageManager ptr
end type

end namespace
