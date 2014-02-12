#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

function TGtkAdjustment.connect(byref signal as string,byval func as GtkGenericCallback, byval fd as any ptr = 0 ) as uinteger
    return g_signal_connect(GTK_OBJECT(id_),signal,G_CALLBACK(func),fd)
end function

constructor TGtkAdjustment
    id_ = GTK_ADJUSTMENT(gtk_adjustment_new(0,0,0,0,0,0))
end constructor

constructor TGtkAdjustment( byval x as any ptr )
    id_ = GTK_ADJUSTMENT(x)
end constructor

property TGtkAdjustment.value () as double
    return gtk_adjustment_get_value(id_)
end property

property TGtkAdjustment.value( byval rhs as double )
    gtk_adjustment_set_value(id_,rhs)
end property

property TGtkAdjustment.lower () as double
    return gtk_adjustment_get_lower(id_)
end property

property TGtkAdjustment.lower( byval rhs as double )
    gtk_adjustment_set_lower(id_,rhs)
end property

property TGtkAdjustment.upper () as double
    return gtk_adjustment_get_upper(id_)
end property

property TGtkAdjustment.upper( byval rhs as double )
    gtk_adjustment_set_upper(id_,rhs)
end property

property TGtkAdjustment.stepIncrement() as double
    return gtk_adjustment_get_step_increment(id_)
end property

property TGtkAdjustment.stepIncrement( byval rhs as double )
    gtk_adjustment_set_step_increment(id_,rhs)
end property

property TGtkAdjustment.pageIncrement( ) as double
    return gtk_adjustment_get_page_increment(id_)
end property

property TGtkAdjustment.pageIncrement( byval rhs as double )
    gtk_adjustment_set_page_increment(id_,rhs)
end property

property TGtkAdjustment.pageSize( ) as double
    return gtk_adjustment_get_page_size(id_)
end property

property TGtkAdjustment.pageSize( byval rhs as double )
    gtk_adjustment_set_page_size(id_,rhs)
end property

operator TGtkAdjustment.cast() as GtkObject ptr
    return GTK_OBJECT(id_)
end operator

constructor TGtkScrollable()
    var hadj = gtk_adjustment_new(0,0,0,0,0,0)
    var vadj = gtk_adjustment_new(0,0,0,0,0,0)
    id_ = gtk_scrolled_window_new(GTK_ADJUSTMENT(hadj),GTK_ADJUSTMENT(vadj))
end constructor

function TGtkScrollable.connect(byref signal as string,byval func as GtkGenericCallback, byval fd as any ptr = 0 ) as uinteger
    return g_signal_connect(GTK_OBJECT(id_),signal,G_CALLBACK(func),fd)
end function

destructor TGtkScrollable
    if hadj_ <> 0 then delete hadj_
    if vadj_ <> 0 then delete vadj_
end destructor

function TGtkScrollable.getHadjustment() as TGtkAdjustment ptr
    if hadj_ = 0 then hadj_ = new TGtkAdjustment(gtk_scrolled_window_get_hadjustment(GTK_SCROLLED_WINDOW(id_)))
    return hadj_
end function

function TGtkScrollable.getVadjustment() as TGtkAdjustment ptr
    if vadj_ = 0 then vadj_ = new TGtkAdjustment(gtk_scrolled_window_get_vadjustment(GTK_SCROLLED_WINDOW(id_)))
    return vadj_
end function

    sub TGtkScrollable.Associate( byval p as GtkWidget pointer )
        'Will assign a new pointer for this class to reference so long
        'as the pointer type is appropriate for this class.

        if ( GetGtkWidgetType( p ) = gtype_ ) then
            id_ = p
        else
            RuntimeError( "Associate() failed - pointer type mismatch" )
        end if
    end sub

    sub TGtkScrollable.Show()
        gtk_widget_show( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkScrollable.Hide()
        gtk_widget_hide( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkScrollable.ShowAll()
        gtk_widget_show_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkScrollable.HideAll()
        gtk_widget_hide_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkScrollable.Destroy()
        gtk_widget_destroy( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkScrollable.SetName( byref newName as string )
        objname_ = newName
        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end sub

    function TGtkScrollable.GetName() as string
        dim p as string pointer
        dim s as string

        p = g_object_get_data( G_OBJECT( id_ ), "rapad.name" )
        s = *p

        return s
    end function

    sub TGtkScrollable.SetParent( byval p as GtkWidget Pointer )
        parent_ = p
        gtk_container_add( GTK_CONTAINER(parent_), GTK_WIDGET(id_) )
    end sub

    function TGtkScrollable.GetParent() as GtkWidget Pointer
        return parent_
    end function

sub TGtkScrollable.setSize(byval w_ as integer = -1, byval h_ as integer = -1)
    gtk_widget_set_size_request(id_,w_,h_)
end sub

sub TGtkScrollable.setScrollBarPolicy( byval h as GtkPolicyType, byval v as GtkPolicyType )
    gtk_scrolled_window_set_policy(GTK_SCROLLED_WINDOW(id_),h,v)
end sub

operator TGtkScrollable.cast() as GtkWidget ptr
    return id_
end operator

end namespace
