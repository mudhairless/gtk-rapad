namespace GtkRapad

type TGtkEventBox

    public:
    declare constructor
    declare sub setAboveChild( byval t as gboolean )
    declare function getAboveChild( ) as gboolean
    declare sub setVisibleWindow( byval t as gboolean )
    declare function getVisibleWindow( ) as gboolean

    declare operator cast() as GtkWidget ptr

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
