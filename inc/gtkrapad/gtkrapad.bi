'
'   Author      : Michael Isaac <michael@thedevel.com>
'   Library     : GtkRapad
'   File        : gtkrapad.bi
'   Copyright   : (C) 2008, Michael Isaac.  All rights reserved.
'   Description :
'

#include once "gtk/gtk.bi"
#ifndef RAPAD_NO_SOURCEVIEW
#include once "gtksourceview/gtksourceview.bi"
#include once "gtksourceview/gtksourcelanguagemanager.bi"
#include once "gtksourceview/gtksourcestyleschememanager.bi"
#endif
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

    declare property hasTooltip() as gboolean
    declare property hasTooltip( byval t as gboolean )

    declare property tooltip() as string
    declare property tooltip( byref t as string )

    declare sub changeParent( byval p as GtkWidget ptr )
    declare sub setParent( byval p as GtkWidget ptr )
    declare function GetParent() as GtkWidget pointer
    declare sub setProperty overload( byref prop_name__ as string, byref value__ as string )
    declare sub setProperty overload( byref prop_name__ as string, byval value__ as integer )
    declare sub setProperty overload( byref prop_name__ as string, byval value__ as double )
    declare function getPropertyString ( byref prop_name__ as string ) as string
    declare function getPropertyInteger ( byref prop_name__ as string ) as integer
    declare function getPropertyDouble ( byref prop_name__ as string ) as double
    declare sub SetName( byref newName as string )
    declare function GetName() as string

    declare function connect(byref signal as string,byval func as GtkGenericCallback, byval fd as any ptr = 0 ) as uinteger
#endmacro

#macro COMMON_FUNCS(cname)

    sub cname.changeParent( byval p as GtkWidget ptr )
        gtk_widget_reparent(id_,p)
    end sub

    property cname.hasTooltip() as gboolean
        return gtk_widget_get_has_tooltip(id_)
    end property

    property cname.hasTooltip( byval t as gboolean )
        gtk_widget_set_has_tooltip(id_,t)
    end property

    property cname.tooltip() as string
        return *gtk_widget_get_tooltip_markup(id_)
    end property

    property cname.tooltip( byref t as string )
        gtk_widget_set_tooltip_markup(id_,t)
    end property

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

    sub cname.setProperty overload( byref prop_name__ as string, byref value__ as string )
        g_object_set_data( G_OBJECT(id_), prop_name__, @value__[0] )
    end sub

    sub cname.setProperty overload( byref prop_name__ as string, byval value__ as integer )
        g_object_set_data( G_OBJECT(id_), prop_name__, @value__ )
    end sub

    sub cname.setProperty overload( byref prop_name__ as string, byval value__ as double )
        g_object_set_data( G_OBJECT(id_), prop_name__, @value__ )
    end sub

    function cname.getPropertyString( byref prop_name__ as string ) as string
        var ret = ""
        var retp = @ret
        retp = g_object_get_data( G_OBJECT(id_), prop_name__ )
        ret = *retp
        return ret
    end function

    function cname.getPropertyInteger( byref prop_name__ as string ) as integer
        var ret = 0
        var retp = @ret
        retp = g_object_get_data( G_OBJECT(id_), prop_name__ )
        ret = *retp
        return ret
    end function

    function cname.getPropertyDouble( byref prop_name__ as string ) as double
        var ret = 0.0
        var retp = @ret
        retp = g_object_get_data( G_OBJECT(id_), prop_name__ )
        ret = *retp
        return ret
    end function

    sub cname.SetName( byref newName as string )
        objname_ = newName
        setProperty( "rapad.name", objname_ )
    end sub

    function cname.GetName() as string
        return getPropertyString( "rapad.name" )
    end function

    sub cname.SetParent( byval p as GtkWidget Pointer )
        parent_ = p
        gtk_container_add( GTK_CONTAINER(parent_), GTK_WIDGET(id_) )
    end sub

    function cname.GetParent() as GtkWidget Pointer
        return gtk_widget_get_parent(id_)
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
#include once "gtkrapad/TGtkAssistant.bi"
#include once "gtkrapad/TGtkAboutDialog.bi"
#include once "gtkrapad/TGtkClipboard.bi"

'Display Widgets
#include once "gtkrapad/TGtkLabel.bi"
#include once "gtkrapad/TGtkImage.bi"
#include once "gtkrapad/TGtkProgressBar.bi"
#include once "gtkrapad/TGtkStatusBar.bi"
#include once "gtkrapad/TGtkInfoBar.bi"
#include once "gtkrapad/TGtkStatusIcon.bi"
#include once "gtkrapad/TGtkSpinner.bi"

'Buttons and Toggles
#include once "gtkrapad/TGtkButton.bi"
#include once "gtkrapad/TGtkCheckBox.bi"
#include once "gtkrapad/TGtkRadioButton.bi"
#include once "gtkrapad/TGtkToggleButton.bi"
#include once "gtkrapad/TGtkLinkButton.bi"
#include once "gtkrapad/TGtkScaleButton.bi"
#include once "gtkrapad/TGtkVolumeButton.bi"

'Numericy/Text Data Entry
#include once "gtkrapad/TGtkEntry.bi"
#include once "gtkrapad/TGtkHScale.bi"
#include once "gtkrapad/TGtkVScale.bi"
#include once "gtkrapad/TGtkSpinButton.bi"

'Multiline Text Editor
#include once "gtkrapad/TGtkTextIter.bi"
#include once "gtkrapad/TGtkTextMark.bi"
#include once "gtkrapad/TGtkTextChildAnchor.bi"
#include once "gtkrapad/TGtkTextTag.bi"
#include once "gtkrapad/TGtkTextTagTable.bi"
#include once "gtkrapad/TGtkTextView.bi"

'Tree, List and Icon Grid Widgets
#include once "gtkrapad/TGtkListView.bi"

'Menus, Combo Box, Toolbar
#include once "gtkrapad/TGtkComboBoxText.bi"
#include once "gtkrapad/TGtkMenuBar.bi"
#include once "gtkrapad/TGtkMenu.bi"
#include once "gtkrapad/TGtkMenuItem.bi"
#include once "gtkrapad/TGtkImageMenuItem.bi"
#include once "gtkrapad/TGtkCheckMenuItem.bi"
#include once "gtkrapad/TGtkRadioMenuItem.bi"
#include once "gtkrapad/TGtkSeparatorMenuItem.bi"
#include once "gtkrapad/TGtkToolItem.bi"
#include once "gtkrapad/TGtkSeparatorToolItem.bi"
#include once "gtkrapad/TGtkToolButton.bi"
#include once "gtkrapad/TGtkMenuToolButton.bi"
#include once "gtkrapad/TGtkToggleToolButton.bi"
#include once "gtkrapad/TGtkToolbar.bi"

'Scrolling
#include once "gtkrapad/TGtkScrollable.bi"

'Containers
#include once "gtkrapad/containers/TGtkAlignment.bi"
#include once "gtkrapad/containers/TGtkAspectFrame.bi"
#include once "gtkrapad/containers/TGtkHBox.bi"
#include once "gtkrapad/containers/TGtkVBox.bi"
#include once "gtkrapad/containers/TGtkHButtonBox.bi"
#include once "gtkrapad/containers/TGtkVButtonBox.bi"
#include once "gtkrapad/containers/TGtkFixed.bi"
#include once "gtkrapad/containers/TGtkHPaned.bi"
#include once "gtkrapad/containers/TGtkVPaned.bi"
#include once "gtkrapad/containers/TGtkLayout.bi"
#include once "gtkrapad/containers/TGtkNotebook.bi"
#include once "gtkrapad/containers/TGtkTable.bi"
#include once "gtkrapad/containers/TGtkExpander.bi"

'Ornaments
#include once "gtkrapad/TGtkFrame.bi"
#include once "gtkrapad/TGtkHSeparator.bi"
#include once "gtkrapad/TGtkVSeparator.bi"

'Miscellaneous
#include once "gtkrapad/TGtkArrow.bi"
#include once "gtkrapad/TGtkCalendar.bi"
#include once "gtkrapad/TGtkDrawingArea.bi"
#include once "gtkrapad/TGtkEventBox.bi"
#include once "gtkrapad/TGdkScreen.bi"

#ifndef RAPAD_NO_SOURCEVIEW
'GtkSourceview
#include once "gtkrapad/TGtkSourceBuffer.bi"
#include once "gtkrapad/TGtkSourceView.bi"
#include once "gtkrapad/TGtkSourceLanguageManager.bi"
#include once "gtkrapad/TGtkSourceStyleSchemeManager.bi"
#endif

#inclib "gtkrapad"
