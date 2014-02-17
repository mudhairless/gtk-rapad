#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkEntry)

    constructor TGtkEntry
        id_ = gtk_entry_new()
        init()
    end constructor

    constructor TGtkEntry( byval i as GtkEntry ptr )
        id_ = GTK_WIDGET(i)
        init()
    end constructor

    constructor TGtkEntry ( byref max_length as integer )
        id_ = gtk_entry_new_with_max_length( max_length )
        init()
    end constructor

    operator TGtkEntry.cast() as GtkWidget ptr
        return id_
    end operator

    property TGtkEntry.MaxLength( byval mlen as integer )
        gtk_entry_set_max_length( GTK_ENTRY(id_), mlen )
    end property

    property TGtkEntry.MaxLength() as integer
        return gtk_entry_get_max_length( GTK_ENTRY(id_) )
    end property

    property TGtkEntry.HasFrame( byval b as gboolean )
        gtk_entry_set_has_frame( GTK_ENTRY(id_), b )
    end property

    property TGtkEntry.HasFrame() as gboolean
        return gtk_entry_get_has_frame( GTK_ENTRY(id_) )
    end property

    property TGtkEntry.Visibility( byval b as gboolean )
        gtk_entry_set_visibility( GTK_ENTRY(id_), b )
    end property

    property TGtkEntry.Visibility() as gboolean
        return gtk_entry_get_visibility( GTK_ENTRY(id_) )
    end property

    sub TGtkEntry.Clear()
        gtk_entry_set_text( GTK_ENTRY(id_), "" )
    end sub

    property TGtkEntry.Text( byref txt as string )
        gtk_entry_set_text( GTK_ENTRY(id_), txt )
    end property

    property TGtkEntry.Text() as string
        return *gtk_entry_get_text( GTK_ENTRY(id_) )
    end property

    sub TGtkEntry.prependText( byref txt as string )
        gtk_entry_prepend_text(GTK_ENTRY(id_),txt)
    end sub

    sub TGtkEntry.appendText( byref txt as string )
        gtk_entry_append_text(GTK_ENTRY(id_),txt)
    end sub

    property TGtkEntry.editable() as gboolean
        return getPropertyInteger("editable")
    end property

    property TGtkEntry.editable( byval t as gboolean )
        gtk_entry_set_editable(GTK_ENTRY(id_),t)
    end property

    property TGtkEntry.alignment() as single
        return gtk_entry_get_alignment(GTK_ENTRY(id_))
    end property

    property TGtkEntry.alignment( byval v as single )
        gtk_entry_set_alignment(GTK_ENTRY(id_),v)
    end property

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
