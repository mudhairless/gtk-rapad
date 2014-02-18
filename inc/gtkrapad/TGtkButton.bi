
#macro DECLARE_BUTTON_COMMON()
      declare property label() as string
      declare property label( byref newCaption as string )
      declare property relief() as GtkReliefStyle
      declare property relief( byval t as GtkReliefStyle )
      declare property useStock() as gboolean
      declare property useStock( byval t as gboolean )
      declare property useUnderline() as gboolean
      declare property useUnderline( byval t as gboolean )
      declare property focusOnClick() as gboolean
      declare property focusOnClick( byval t as gboolean )
      declare property image() as GtkWidget ptr
      declare property image( byval t as GtkWidget ptr )
      declare property imagePosition() as GtkPositionType
      declare property imagePosition( byval t as GtkPositionType )
#endmacro

#macro BUTTON_COMMON(cname)

    property cname.label( byref newCaption as string )
        gtk_button_set_label( GTK_BUTTON( id_ ), newCaption)
    end property

    property cname.label() as string
        return *(gtk_button_get_label( GTK_BUTTON( id_ )))
    end property


    property cname.relief() as GtkReliefStyle
        return gtk_button_get_relief(GTK_BUTTON(id_))
    end property

    property cname.relief( byval t as GtkReliefStyle )
        gtk_button_set_relief(GTK_BUTTON(id_),t)
    end property

    property cname.useStock() as gboolean
        return gtk_button_get_use_stock(GTK_BUTTON(id_))
    end property

    property cname.useStock( byval t as gboolean )
        gtk_button_set_use_stock(GTK_BUTTON(id_),t)
    end property

    property cname.useUnderline() as gboolean
        return gtk_button_get_use_underline(GTK_BUTTON(id_))
    end property

    property cname.useUnderline( byval t as gboolean )
        gtk_button_set_use_underline(GTK_BUTTON(id_),t)
    end property

    property cname.focusOnClick() as gboolean
        return gtk_button_get_focus_on_click(GTK_BUTTON(id_))
    end property

    property cname.focusOnClick( byval t as gboolean )
        gtk_button_set_focus_on_click(GTK_BUTTON(id_),t)
    end property

    property cname.image() as GtkWidget ptr
        return gtk_button_get_image(GTK_BUTTON(id_))
    end property

    property cname.image( byval t as GtkWidget ptr )
        gtk_button_set_image(GTK_BUTTON(id_),t)
    end property

    property cname.imagePosition() as GtkPositionType
        return gtk_button_get_image_position(GTK_BUTTON(id_))
    end property

    property cname.imagePosition( byval t as GtkPositionType )
        gtk_button_set_image_position(GTK_BUTTON(id_),t)
    end property

#endmacro

namespace GtkRapad

    type TGtkButton

        public:
            declare constructor( )
            declare constructor( byref _caption_ as string )
            declare constructor( byref stock_id as string, byval t as gboolean )

            declare operator cast() as GtkWidget pointer

            DECLARE_BUTTON_COMMON()

            declare sub SetEvent( byval ev as TGtkEvents, byval aMethod as GtkGenericCallback )
            declare sub SetMouseEnter( byval aMethod as gtkGenericCallback )
            declare sub SetMouseLeave( byval aMethod as gtkGenericCallback )
            declare sub SetMouseUp( byval aMethod as gtkGenericCallback )
            declare sub SetMouseDown( byval aMethod as gtkGenericCallback )
            declare sub SetMouseClick( byval aMethod as gtkGenericCallback )

            DECLARE_COMMON_FUNCS()

        COMMON_MEMBERS()
    end type

end namespace
