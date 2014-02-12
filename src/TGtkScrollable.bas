#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

COMMON_FUNCS(TGtkAdjustment)

constructor TGtkAdjustment
    id_ = GTK_WIDGET(gtk_adjustment_new(0,0,0,0,0,0))
end constructor

constructor TGtkAdjustment( byval x as any ptr )
    id_ = GTK_WIDGET(x)
end constructor

property TGtkAdjustment.value () as double
    return gtk_adjustment_get_value(GTK_ADJUSTMENT(id_))
end property

property TGtkAdjustment.value( byval rhs as double )
    gtk_adjustment_set_value(GTK_ADJUSTMENT(id_),rhs)
end property

property TGtkAdjustment.lower () as double
    return gtk_adjustment_get_lower(GTK_ADJUSTMENT(id_))
end property

property TGtkAdjustment.lower( byval rhs as double )
    gtk_adjustment_set_lower(GTK_ADJUSTMENT(id_),rhs)
end property

property TGtkAdjustment.upper () as double
    return gtk_adjustment_get_upper(GTK_ADJUSTMENT(id_))
end property

property TGtkAdjustment.upper( byval rhs as double )
    gtk_adjustment_set_upper(GTK_ADJUSTMENT(id_),rhs)
end property

property TGtkAdjustment.stepIncrement() as double
    return gtk_adjustment_get_step_increment(GTK_ADJUSTMENT(id_))
end property

property TGtkAdjustment.stepIncrement( byval rhs as double )
    gtk_adjustment_set_step_increment(GTK_ADJUSTMENT(id_),rhs)
end property

property TGtkAdjustment.pageIncrement( ) as double
    return gtk_adjustment_get_page_increment(GTK_ADJUSTMENT(id_))
end property

property TGtkAdjustment.pageIncrement( byval rhs as double )
    gtk_adjustment_set_page_increment(GTK_ADJUSTMENT(id_),rhs)
end property

property TGtkAdjustment.pageSize( ) as double
    return gtk_adjustment_get_page_size(GTK_ADJUSTMENT(id_))
end property

property TGtkAdjustment.pageSize( byval rhs as double )
    gtk_adjustment_set_page_size(GTK_ADJUSTMENT(id_),rhs)
end property

operator TGtkAdjustment.cast() as GtkObject ptr
    return GTK_OBJECT(GTK_ADJUSTMENT(id_))
end operator

constructor TGtkScrollable()
    hadj_ = new TGtkAdjustment(gtk_adjustment_new(0,0,0,0,0,0))
    vadj_ = new TGtkAdjustment(gtk_adjustment_new(0,0,0,0,0,0))
    id_ = gtk_scrolled_window_new(GTK_ADJUSTMENT(cast(GtkObject ptr,*hadj_)),GTK_ADJUSTMENT(cast(GtkObject ptr,*vadj_)))
    init()
end constructor

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

sub TGtkScrollable.setSize(byval w_ as integer = -1, byval h_ as integer = -1)
    gtk_widget_set_size_request(id_,w_,h_)
end sub

sub TGtkScrollable.setScrollBarPolicy( byval h as GtkPolicyType, byval v as GtkPolicyType )
    gtk_scrolled_window_set_policy(GTK_SCROLLED_WINDOW(id_),h,v)
end sub

operator TGtkScrollable.cast() as GtkWidget ptr
    return id_
end operator

COMMON_FUNCS(TGtkScrollable)

end namespace
