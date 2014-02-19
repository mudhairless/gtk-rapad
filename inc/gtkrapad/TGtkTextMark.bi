
#macro DECLARE_TEXT_MARK_COMMON()

    declare property visible() as gboolean
    declare property visible( byval t as gboolean )

    declare property name() as string

    declare property buffer() as GtkTextBuffer ptr

    declare property leftGravity() as gboolean

    declare property deleted() as gboolean

#endmacro

#macro TEXT_MARK_COMMON(cname)

    property cname.visible() as gboolean
        return gtk_text_mark_get_visible(GTK_TEXT_MARK(id_))
    end property

    property cname.visible( byval t as gboolean )
        gtk_text_mark_set_visible(GTK_TEXT_MARK(id_),t)
    end property

    property cname.name() as string
        return *gtk_text_mark_get_name(GTK_TEXT_MARK(id_))
    end property

    property cname.buffer() as GtkTextBuffer ptr
        return gtk_text_mark_get_buffer(GTK_TEXT_MARK(id_))
    end property

    property cname.leftGravity() as gboolean
        return gtk_text_mark_get_left_gravity(GTK_TEXT_MARK(id_))
    end property

    property cname.deleted() as gboolean
        return gtk_text_mark_get_deleted(GTK_TEXT_MARK(id_))
    end property

#endmacro

namespace GtkRapad

type TGtkTextMark
    declare constructor( byref name_ as string, byval left_gravity as gboolean )
    declare constructor( byval i as GtkTextMark ptr )

    declare operator cast() as GtkTextMark ptr

    DECLARE_TEXT_MARK_COMMON()

    private:
    as GtkTextMark ptr id_
end type

end namespace
