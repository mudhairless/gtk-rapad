
#macro DECLARE_TOGGLE_BUTTON_COMMON()

    declare property mode() as gboolean
    declare property mode( byval draw_indicator as gboolean )

    declare property active() as gboolean
    declare property active( byval active_ as gboolean )

    declare property inconsistent() as gboolean
    declare property inconsistent( byval s as gboolean )

#endmacro

#macro TOGGLE_BUTTON_COMMON(cname)

    property cname.mode() as gboolean
        return gtk_toggle_button_get_mode(GTK_TOGGLE_BUTTON(id_))
    end property

    property cname.mode( byval draw_indicator as gboolean )
        gtk_toggle_button_set_mode(GTK_TOGGLE_BUTTON(id_),draw_indicator)
    end property

    property cname.active() as gboolean
        return gtk_toggle_button_get_active(GTK_TOGGLE_BUTTON(id_))
    end property

    property cname.active( byval active_ as gboolean )
        gtk_toggle_button_set_active(GTK_TOGGLE_BUTTON(id_),active_)
    end property

    property cname.inconsistent() as gboolean
        return gtk_toggle_button_get_inconsistent(GTK_TOGGLE_BUTTON(id_))
    end property

    property cname.inconsistent( byval s as gboolean )
        gtk_toggle_button_set_inconsistent(GTK_TOGGLE_BUTTON(id_),s)
    end property

#endmacro

namespace GtkRapad

type TGtkToggleButton

    declare constructor
    declare constructor( byref lbl as string )

    DECLARE_BUTTON_COMMON()

    DECLARE_TOGGLE_BUTTON_COMMON()

    declare operator cast() as GtkWidget ptr

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
