#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkEntry
        id_ = gtk_entry_new()
        gtype_ = GetGtkWidgetType( id_ )
        objname_ = str( (gtype_ & "-" & id_) )


        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end constructor

    constructor TGtkEntry ( byref max_length as integer )
        id_ = gtk_entry_new_with_max_length( max_length )
        gtype_ = GetGtkWidgetType( id_ )
    end constructor

    operator TGtkEntry.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkEntry.Associate( byval p as GtkWidget pointer )
        'Will assign a new pointer for this class to reference so long
        'as the pointer type is appropriate for this class.

        if ( GetGtkWidgetType( p ) = gtype_ ) then
            g_free( p )
            id_ = p
        else
            RuntimeError( "Associate() failed - pointer type mismatch" )
        end if
    end sub

    sub TGtkEntry.Show()
        gtk_widget_show( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkEntry.Hide()
        gtk_widget_hide( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkEntry.ShowAll()
        gtk_widget_show_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkEntry.HideAll()
        gtk_widget_hide_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkEntry.Destroy()
        gtk_widget_destroy( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkEntry.SetName( byref newName as string )
        objname_ = newName
        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end sub

    function TGtkEntry.GetName() as string
        dim p as string pointer
        dim s as string

        p = g_object_get_data( G_OBJECT( id_ ), "rapad.name" )
        s = *p

        return s
    end function

    sub TGtkEntry.SetParent( byval p as GtkWidget Pointer )
        parent_ = p
        gtk_container_add( GTK_CONTAINER(parent_), GTK_WIDGET(id_) )
    end sub

    function TGtkEntry.GetParent() as GtkWidget Pointer
        return parent_
    end function

    '-----------------------------------------------

    sub TGtkEntry.SetMaxLength( byval mlen as integer )
        gtk_entry_set_max_length( GTK_ENTRY(id_), mlen )
    end sub

    function TGtkEntry.GetMaxLength() as integer
        return gtk_entry_get_max_length( GTK_ENTRY(id_) )
    end function

    sub TGtkEntry.SetHasFrame( byval b as gboolean )
        gtk_entry_set_has_frame( GTK_ENTRY(id_), b )
    end sub

    function TGtkEntry.GetHasFrame() as gboolean
        return gtk_entry_get_has_frame( GTK_ENTRY(id_) )
    end function

    sub TGtkEntry.SetVisibility( byval b as gboolean )
        gtk_entry_set_visibility( GTK_ENTRY(id_), b )
    end sub

    function TGtkEntry.GetVisibility() as gboolean
        return gtk_entry_get_visibility( GTK_ENTRY(id_) )
    end function

    sub TGtkEntry.Clear()
        gtk_entry_set_text( GTK_ENTRY(id_), "" )
    end sub

    sub TGtkEntry.SetText( byval txt as string )
        gtk_entry_set_text( GTK_ENTRY(id_), txt )
    end sub

    function TGtkEntry.GetText() as string
        return *gtk_entry_get_text( GTK_ENTRY(id_) )
    end function

    sub TGtkEntry.SetEvent( byval ev as TGtkEvents, byval aMethod as gtkGenericCallback )

        var action = ""

        select case ev

        case ACTIVATE
            action = "activate"

        case else
            exit sub

        end select

        g_signal_connect( GTK_OBJECT( id_ ), action, G_CALLBACK( aMethod ), 0 )

    end sub

    sub TGtkEntry.SetActivate( byval aMethod as gtkGenericCallback )
        SetEvent( ACTIVATE, aMethod )
    end sub

end namespace
