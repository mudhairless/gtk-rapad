namespace GtkRapad

type TGtkTextChildAnchor
    declare constructor
    declare property widgets() as GList ptr
    declare property deleted() as gboolean
    declare operator cast() as GtkTextChildAnchor ptr

    private:
    id_ as GtkTextChildAnchor ptr
end type

end namespace
