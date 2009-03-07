'
'   Author      : Michael Isaac <subjugator@gmail.com>
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
#include once "gtkrapad/TGdkScreen.bi"
#include once "gtkrapad/TGtkRapadBar.bi"

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


#inclib "gtkrapad"
