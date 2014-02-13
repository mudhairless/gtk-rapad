namespace GtkRapad

type TGtkInfoBar

    declare constructor
    declare operator cast() as GtkWidget ptr

    declare sub addActionWidget( byval w as GtkWidget ptr, byval rid as integer )
    declare function addButton( byref text as string, byval rid as integer ) as GtkWidget ptr

    declare sub setReponseSensitive( byval rid as integer, byval t as gboolean )
    declare sub setDefaultResponse( byval rid as integer )
    declare sub response( byval rid as integer )

    declare property messageType() as GtkMessageType
    declare property messageType( byval t as GtkMessageType )

    declare function getActionArea() as GtkWidget ptr
    declare function getContentArea() as GtkWidget ptr

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
