'
'   Author      : Michael Isaac <michael@thedevel.com>
'   Library     : GtkRapad
'   File        : gtkrapad.bi
'   Copyright   : (C) 2008, Michael Isaac.  All rights reserved.
'   Description :
'

#include once "gtk/gtk.bi"

namespace GtkRapad

    type GtkGenericCallback as sub cdecl( byval _data_ as any ptr )

    enum TGtkEvents
        MOUSE_ENTER
        MOUSE_LEAVE
        MOUSE_DOWN
        MOUSE_UP
        MOUSE_CLICK
        ACTIVATE
        TOGGLED
    end enum

    declare sub RuntimeError( byref error_ as string )
    declare function GetGtkWidgetType( byval wid as GtkWidget pointer ) as string

end namespace

#macro COMMON_MEMBERS()
    private:
    gtype_ as string
    objname_ as string
    parent_ as GtkWidget ptr
    id_ as GtkWidget ptr
#endmacro

#macro DECLARE_COMMON_FUNCS()
    declare sub Associate( byval p as GtkWidget pointer )
    declare sub Destroy()
    declare sub Hide()
    declare sub HideAll()
    declare sub Show()
    declare sub ShowAll()
    declare sub init()

    declare sub setParent( byval p as GtkWidget ptr )
    declare function GetParent() as GtkWidget pointer
    declare sub SetName( byref newName as string )
    declare function GetName() as string

    declare function connect(byref signal as string,byval func as GtkGenericCallback, byval fd as any ptr = 0 ) as uinteger
#endmacro

#macro COMMON_FUNCS(cname)

    sub cname.init()
        gtype_ = GetGtkWidgetType( id_ )
        objname_ = str( (gtype_ & "-" & id_) )
        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end sub

function cname.connect(byref signal as string,byval func as GtkGenericCallback, byval fd as any ptr = 0 ) as uinteger
    return g_signal_connect(GTK_OBJECT(id_),signal,G_CALLBACK(func),fd)
end function

    sub cname.Associate( byval p as GtkWidget pointer )
        'Will assign a new pointer for this class to reference so long
        'as the pointer type is appropriate for this class.

        if ( GetGtkWidgetType( p ) = gtype_ ) then
            id_ = p
        else
            RuntimeError( "Associate() failed - pointer type mismatch" )
        end if
    end sub

    sub cname.Show()
        gtk_widget_show( GTK_WIDGET( id_ ) )
    end sub

    sub cname.Hide()
        gtk_widget_hide( GTK_WIDGET( id_ ) )
    end sub

    sub cname.ShowAll()
        gtk_widget_show_all( GTK_WIDGET( id_ ) )
    end sub

    sub cname.HideAll()
        gtk_widget_hide_all( GTK_WIDGET( id_ ) )
    end sub

    sub cname.Destroy()
        gtk_widget_destroy( GTK_WIDGET( id_ ) )
    end sub

    sub cname.SetName( byref newName as string )
        objname_ = newName
        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end sub

    function cname.GetName() as string
        dim p as string pointer
        dim s as string

        p = g_object_get_data( G_OBJECT( id_ ), "rapad.name" )
        s = *p

        return s
    end function

    sub cname.SetParent( byval p as GtkWidget Pointer )
        parent_ = p
        gtk_container_add( GTK_CONTAINER(parent_), GTK_WIDGET(id_) )
    end sub

    function cname.GetParent() as GtkWidget Pointer
        return parent_
    end function


#endmacro

#define CALLBACK(x) sub x cdecl ( byval _data_ as any ptr )
#define ENDCALLBACK end sub
'
'   FreeBASIC does not have a logical not operator, so this
'   will have to do for now.
'

#define CNOT(x) (iif((x) = 0, 1, 0))
'#define converttostring(x) std::string(#x)

#ifndef NULL
#define NULL 0
#endif

'Special
#include once "gtkrapad/TGtkApplication.bi"
#include once "gtkrapad/TGtkWindow.bi"
'#include once "gtkrapad/CommonDialogs.bi"

'Containers
#include once "gtkrapad/TGtkFixed.bi"
#include once "gtkrapad/TGtkHBox.bi"
#include once "gtkrapad/TGtkVBox.bi"
#include once "gtkrapad/TGtkMenuBar.bi"
#include once "gtkrapad/TGtkMenu.bi"

'Widgets
#include once "gtkrapad/TGtkButton.bi"
#include once "gtkrapad/TGtkLabel.bi"
#include once "gtkrapad/TGtkEntry.bi"
#include once "gtkrapad/TGtkMenuItem.bi"
#include once "gtkrapad/TGtkCheckBox.bi"
#include once "gtkrapad/TGtkRadioButton.bi"
#include once "gtkrapad/TGtkTextView.bi"

#include once "gtkrapad/TGtkListView.bi"
'#include once "gtkrapad/TGtkListStore.bi"
'#include once "gtkrapad/TGtkListViewColumn.bi"
'#include once "gtkrapad/TGtkTreeView.bi"
#include once "gtkrapad/TGtkScrollable.bi"

#include once "gtkrapad/TGdkScreen.bi"

extern GtkApp as gtkrapad.TGtkApplication

#inclib "gtkrapad"
