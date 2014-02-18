
#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkWindow)

    property TGtkWindow.modal() as gboolean
        return gtk_window_get_modal(GTK_WINDOW(id_))
    end property

    property TGtkWindow.modal( byval t as gboolean )
        gtk_window_set_modal(GTK_WINDOW(id_),t)
    end property

    property TGtkWindow.skipTaskBarHint( byval t as gboolean )
        gtk_window_set_skip_taskbar_hint(GTK_WINDOW(id_),t)
    end property

    property TGtkWindow.skipPagerHint( byval t as gboolean )
        gtk_window_set_skip_pager_hint(GTK_WINDOW(id_),t)
    end property

    property TGtkWindow.decorated( byval t as gboolean )
        gtk_window_set_decorated(GTK_WINDOW(id_),t)
    end property

    property TGtkWindow.hasFrame( byval t as gboolean )
        gtk_window_set_has_frame(GTK_WINDOW(id_),t)
    end property

    property TGtkWindow.urgencyHint( byval t as gboolean )
        gtk_window_set_urgency_hint(GTK_WINDOW(id_),t)
    end property

    constructor TGtkWindow
        id_ = gtk_window_new( GTK_WINDOW_TOPLEVEL )

        gtk_window_set_title( GTK_WINDOW( id_ ), "window" )
        gtk_window_set_destroy_with_parent( GTK_WINDOW( id_ ), true)

        gtk_window_resize( GTK_WINDOW( id_ ), 320, 240 )

        connect( "destroy", cast(GtkGenericCallback,@gtk_widget_destroy), id_ )

        init()
    end constructor

    operator TGtkWindow.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkWindow.Move( byval x_ as integer, byval y_ as integer )
        posx_ = x_
        posy_ = y_

        gtk_window_move( GTK_WINDOW( id_ ), posx_, posy_ )
    end sub

    sub TGtkWindow.SetFocus( byval wid as GtkWidget Pointer )
        gtk_window_set_focus( GTK_WINDOW( id_ ), wid )
    end sub

    function TGtkWindow.ActivateFocus() as gboolean
        return gtk_window_activate_focus( GTK_WINDOW( id_ ) )
    end function

    property TGtkWindow.Position( byref position_ as GtkWindowPosition )
        gtk_window_set_position( GTK_WINDOW( id_ ), position_ )
    end property

    property TGtkWindow.Resizable( byval b as gboolean )
        gtk_window_set_resizable( GTK_WINDOW( id_ ), resizable_ )
    end property

    property TGtkWindow.Minimized( byval b as gboolean )
        minimized_ = b
        if (minimized_ = false) then
            gtk_window_deiconify( GTK_WINDOW( id_ ) )
        else
            gtk_window_iconify( GTK_WINDOW( id_ ) )
        end if
    end property

    property TGtkWindow.Sticky( byval b as gboolean )
        sticky_ = b
        if (sticky_ = false) then
            gtk_window_unstick( GTK_WINDOW( id_ ) )
        else
            gtk_window_stick( GTK_WINDOW( id_ ) )
        end if
    end property

    property TGtkWindow.Maximized( byval b as gboolean )
        maximize_ = b
        if (maximize_ = false) then
            gtk_window_unmaximize( GTK_WINDOW( id_ ) )
        else
            gtk_window_maximize( GTK_WINDOW( id_ ) )
        end if
    end property

    property TGtkWindow.FullScreen( byval b as gboolean )
        fullscreen_ = b
        if (fullscreen_ = false) then
            gtk_window_unfullscreen( GTK_WINDOW( id_ ) )
        else
            gtk_window_fullscreen( GTK_WINDOW( id_ ) )
        end if
    end property

    property TGtkWindow.KeepAbove( byval b as gboolean )
        keepabove_ = b
        gtk_window_set_keep_above( GTK_WINDOW( id_ ), keepabove_ )
    end property

    property TGtkWindow.Resizable() as gboolean
        return gtk_window_get_resizable(GTK_WINDOW(id_))
    end property

    property TGtkWindow.Minimized() as gboolean
        return minimized_
    end property

    property TGtkWindow.Sticky() as gboolean
        return sticky_
    end property

    property TGtkWindow.Maximized() as gboolean
        return maximize_
    end property

    property TGtkWindow.FullScreen() as gboolean
        return fullscreen_
    end property

    property TGtkWindow.KeepAbove() as gboolean
        return keepabove_
    end property

    sub TGtkWindow.SetDestroyCallback( byval aMethod as gtkGenericCallback )
        connect( "destroy", aMethod, id_ )
    end sub

    property TGtkWindow.Title( byref newTitle as string )
        title_ = newTitle
        gtk_window_set_title( GTK_WINDOW( id_ ), title_ )
    end property

    property TGtkWindow.Title() as string
        return title_
    end property

    property TGtkWindow.X() as integer
        var myx = 0
        var myy = 0
        gtk_window_get_position(GTK_WINDOW(id_),@myx,@myy)
        return myx
    end property

    property TGtkWindow.X( byval x_ as integer )
        var myx = 0
        var myy = 0
        gtk_window_get_position(GTK_WINDOW(id_),@myx,@myy)
        gtk_window_move(GTK_WINDOW(id_),x_,myy)
    end property

    property TGtkWindow.Y() as integer
        var myx = 0
        var myy = 0
        gtk_window_get_position(GTK_WINDOW(id_),@myx,@myy)
        return myy
    end property

    property TGtkWindow.Y( byval y_ as integer )
        var myx = 0
        var myy = 0
        gtk_window_get_position(GTK_WINDOW(id_),@myx,@myy)
        gtk_window_move(GTK_WINDOW(id_),myx,y_)
    end property

    property TGtkWindow.width() as integer
        var myx = 0
        var myy = 0
        gtk_window_get_size(GTK_WINDOW(id_),@myx,@myy)
        return myx
    end property

    property TGtkWindow.width( byval x_ as integer )
        var myx = 0
        var myy = 0
        gtk_window_get_size(GTK_WINDOW(id_),@myx,@myy)
        gtk_window_resize(GTK_WINDOW(id_),x_,myy)
    end property

    property TGtkWindow.height() as integer
        var myx = 0
        var myy = 0
        gtk_window_get_size(GTK_WINDOW(id_),@myx,@myy)
        return myy
    end property

    property TGtkWindow.height( byval y_ as integer )
        var myx = 0
        var myy = 0
        gtk_window_get_size(GTK_WINDOW(id_),@myx,@myy)
        gtk_window_resize(GTK_WINDOW(id_),myx,y_)
    end property

    sub TGtkWindow.setIcon( byval x_ as GdkPixbuf ptr )
        gtk_window_set_icon(GTK_WINDOW(id_),x_)
    end sub

    sub TGtkWindow.SetSize( byval width_ as integer, byval height_ as integer )
        'gtk_window_set_default_size( GTK_WINDOW( id_ ), width_, height_ )
        gtk_window_resize( GTK_WINDOW( id_ ), width_, height_ )
    end sub

end namespace
