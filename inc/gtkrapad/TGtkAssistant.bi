namespace GtkRapad

type TGtkAssistant

    declare constructor
    declare operator cast() as GtkWidget ptr

    declare function prependPage( byval p as GtkWidget ptr ) as integer
    declare function appendPage( byval p as GtkWidget ptr ) as integer
    declare function insertPage( byval p as GtkWidget ptr, byval i as integer ) as integer

    declare property currentPage() as integer
    declare property currentPage( byval p as integer )

    declare function getPageType( byval child as GtkWidget ptr ) as GtkAssistantPageType
    declare sub setPageType( byval child as GtkWidget ptr, byval t as GtkAssistantPageType )

    declare function getPageTitle( byval child as GtkWidget ptr ) as string
    declare sub setPageTitle( byval child as GtkWidget ptr, byref t as string )

    declare function getPageHeaderImage( byval child as GtkWidget ptr ) as GdkPixbuf ptr
    declare sub setPageHeaderImage( byval child as GtkWidget ptr, byval i as GdkPixbuf ptr )

    declare function getPageSideImage( byval child as GtkWidget ptr ) as GdkPixbuf ptr
    declare sub setPageSideImage( byval child as GtkWidget ptr, byval i as GdkPixbuf ptr )

    declare function isPageComplete( byval child as GtkWidget ptr ) as gboolean
    declare sub setPageComplete( byval child as GtkWidget ptr, byval t as gboolean )

    declare sub addActionWidget( byval w as GtkWidget ptr )
    declare sub removeActionWidget( byval w as GtkWidget ptr )

    declare sub updateButtonState()

    declare sub commit()

    declare property length() as integer

    declare function at( byval i as integer ) as GtkWidget ptr

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
