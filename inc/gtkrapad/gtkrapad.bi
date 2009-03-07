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


#include once "gtkrapad/TGtkApplication.bi"     'Special
#include once "gtkrapad/TGtkWindow.bi"          'Special
#include once "gtkrapad/TGdkScreen.bi"          'Special
#include once "gtkrapad/TGtkMenu.bi"            'Container
#include once "gtkrapad/TGtkMenuBar.bi"         'Container
#include once "gtkrapad/TGtkMenuItem.bi"        'Widget     (used by TGtkRapadBar)
#include once "gtkrapad/TGtkRapadBar.bi"        'Special

#include once "gtkrapad/TGtkFixed.bi"           'Container
#include once "gtkrapad/TGtkHBox.bi"            'Container
#include once "gtkrapad/TGtkVBox.bi"            'Container

#include once "gtkrapad/TGtkButton.bi"          'Widget
#include once "gtkrapad/TGtkLabel.bi"           'Widget
#include once "gtkrapad/TGtkEntry.bi"           'Widget
#include once "gtkrapad/TGtkCheckBox.bi"        'Widget
#include once "gtkrapad/TGtkRadioButton.bi"     'Widget
#include once "gtkrapad/TGtkTextView.bi"        'Widget
#include once "gtkrapad/TGtkListView.bi"        'Widget


#inclib "gtkrapad"
