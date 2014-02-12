#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkEntry)

    constructor TGtkEntry
        id_ = gtk_entry_new()
        init()
    end constructor

    constructor TGtkEntry ( byref max_length as integer )
        id_ = gtk_entry_new_with_max_length( max_length )
        init()
    end constructor

    operator TGtkEntry.cast() as GtkWidget Pointer
        return id_
    end operator

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

        connect( action, aMethod )

    end sub

    sub TGtkEntry.SetActivate( byval aMethod as gtkGenericCallback )
        SetEvent( ACTIVATE, aMethod )
    end sub

end namespace
