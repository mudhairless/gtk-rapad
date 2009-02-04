
#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkWindow
        id_ = gtk_window_new( GTK_WINDOW_TOPLEVEL )
        gtype_ = GetGtkWidgetType( id_ )
        objname_ = str( (gtype_ & "-" & id_) )

        gtk_window_set_title( GTK_WINDOW( id_ ), "window" )
        gtk_window_set_default_size( GTK_WINDOW( id_ ), 480, 240 )
        gtk_window_set_destroy_with_parent( GTK_WINDOW( id_ ), true)

        gtk_widget_set_size_request ( GTK_WIDGET( id_ ), 100, 100 )
        'gtk_widget_set_uposition( id_, 200, 100 )

        g_object_set( G_OBJECT( id_ ), "rapad.name" )
        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )

        g_signal_connect( GTK_OBJECT( id_ ), "destroy", G_CALLBACK(@gtk_widget_destroy()), id_ )
    end constructor

    operator TGtkWindow.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkWindow.Associate( byval p as GtkWidget pointer )
        'Will assign a new pointer for this class to reference so long
        'as the pointer type is appropriate for this class.

        if ( GetGtkWidgetType( p ) = gtype_ ) then
            id_ = p
        else
            RuntimeError( "Associate() failed - pointer type mismatch" )
        end if
    end sub

    sub TGtkWindow.Show()
        gtk_widget_show( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkWindow.Hide()
        gtk_widget_hide( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkWindow.ShowAll()
        gtk_widget_show_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkWindow.HideAll()
        gtk_widget_hide_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkWindow.Destroy()
        gtk_widget_destroy( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkWindow.SetName( byref newName as string )
        objname_ = newName
        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end sub

    function TGtkWindow.GetName() as string
        dim p as string pointer
        dim s as string

        p = g_object_get_data( G_OBJECT( id_ ), "rapad.name" )
        s = *p

        return s
    end function

    sub TGtkWindow.SetParent( byval p as GtkWidget Pointer )
        parent_ = p
        gtk_container_add( GTK_CONTAINER(parent_), GTK_WIDGET(id_) )
    end sub

    function TGtkWindow.GetParent() as GtkWidget Pointer
        return parent_
    end function

    '-----------------------------------------------


    sub TGtkWindow.SetFocus( byval wid as GtkWidget Pointer )
        gtk_window_set_focus( GTK_WINDOW( id_ ), wid )
    end sub

    function TGtkWindow.ActivateFocus() as gboolean
        return gtk_window_activate_focus( GTK_WINDOW( id_ ) )
    end function

    sub TGtkWindow.SetPosition( byref position as GtkWindowPosition )
        gtk_window_set_position( GTK_WINDOW( id_ ), position )
    end sub

    sub TGtkWindow.SetResizable( byval b as gboolean )
        resizable_ = b
        gtk_window_set_resizable( GTK_WINDOW( id_ ), resizable_ )
    end sub

    sub TGtkWindow.SetMinimized( byval b as gboolean )
        minimized_ = b
        if (minimized_ = false) then
            gtk_window_deiconify( GTK_WINDOW( id_ ) )
        else
            gtk_window_iconify( GTK_WINDOW( id_ ) )
        end if
    end sub

    sub TGtkWindow.SetSticky( byval b as gboolean )
        sticky_ = b
        if (sticky_ = false) then
            gtk_window_unstick( GTK_WINDOW( id_ ) )
        else
            gtk_window_stick( GTK_WINDOW( id_ ) )
        end if
    end sub

    sub TGtkWindow.SetMaximized( byval b as gboolean )
        maximize_ = b
        if (maximize_ = false) then
            gtk_window_unmaximize( GTK_WINDOW( id_ ) )
        else
            gtk_window_maximize( GTK_WINDOW( id_ ) )
        end if
    end sub

    sub TGtkWindow.SetFullScreen( byval b as gboolean )
        fullscreen_ = b
        if (fullscreen_ = false) then
            gtk_window_unfullscreen( GTK_WINDOW( id_ ) )
        else
            gtk_window_fullscreen( GTK_WINDOW( id_ ) )
        end if
    end sub

    sub TGtkWindow.SetKeepAbove( byval b as gboolean )
        keepabove_ = b
        gtk_window_set_keep_above( GTK_WINDOW( id_ ), keepabove_ )
    end sub

    function TGtkWindow.GetResizable() as gboolean
        return resizable_
    end function

    function TGtkWindow.GetMinimized() as gboolean
        return minimized_
    end function

    function TGtkWindow.GetSticky() as gboolean
        return sticky_
    end function

    function TGtkWindow.GetMaximized() as gboolean
        return maximize_
    end function

    function TGtkWindow.GetFullScreen() as gboolean
        return fullscreen_
    end function

    function TGtkWindow.GetKeepAbove() as gboolean
        return keepabove_
    end function

    sub TGtkWindow.SetDestroyCallback( byval aMethod as gtkGenericCallback )
        g_signal_connect( GTK_OBJECT( id_ ), "destroy", G_CALLBACK( aMethod ), id_ )
    end sub

    sub TGtkWindow.SetTitle( byref newTitle as string )
        title_ = newTitle
        gtk_window_set_title( GTK_WINDOW( id_ ), title_ )
    end sub

    function TGtkWindow.GetTitle() as string
        return title_
    end function

    sub TGtkWindow.SetSize( byval width_ as integer, byval height_ as integer )
        gtk_window_set_default_size( GTK_WINDOW( id_ ), width_, height_ )
    end sub

end namespace
