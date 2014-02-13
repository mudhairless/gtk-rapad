namespace GtkRapad

type TGtkNotebook

    declare constructor

    declare function appendPage( byref lbl as string, byval child as GtkWidget ptr ) as integer
    declare function appendPage( byval lbl as GtkWidget ptr, byval child as GtkWidget ptr, byval menulbl as GtkWidget ptr = 0 ) as integer

    declare function prependPage( byref lbl as string, byval child as GtkWidget ptr ) as integer
    declare function prependPage( byval lbl as GtkWidget ptr, byval child as GtkWidget ptr, byval menulbl as GtkWidget ptr = 0 ) as integer

    declare function insertPageAt( byval ind as integer, byref lbl as string, byval child as GtkWidget ptr ) as integer
    declare function insertPageAt( byval ind as integer, byval lbl as GtkWidget ptr, byval child as GtkWidget ptr, byval menulbl as GtkWidget ptr = 0 ) as integer

    declare sub removePage( byval ind as integer )

    declare sub moveChild( byval child as GtkWidget ptr, byval ind as integer )

    declare sub setPage( byval ind as integer )
    declare function currentPage() as integer
    declare sub nextPage()
    declare sub prevPage()

    declare function at( byval ind as integer ) as GtkWidget ptr
    declare function length() as integer

    declare sub enablePopup()
    declare sub disablePopup()

    declare property tabsPosition() as GtkPositionType
    declare property tabsPosition( byval p as GtkPositionType )

    declare property scrollable() as gboolean
    declare property scrollable( byval t as gboolean )

    declare property showBorder() as gboolean
    declare property showBorder( byval t as gboolean )

    declare property hBorder() as ushort
    declare property hBorder( byval w as ushort )
    declare property vBorder() as ushort
    declare property vBorder( byval w as ushort )

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
