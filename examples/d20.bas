'
'   d20.bas
'
'   Nothing important
'

#include once "gtkrapad/gtkrapad.bi"

using GtkRapad

'Global object variables
dim shared GtkApp as TGtkApplication
dim shared frmMain as TGtkWindow
dim shared cmdRoll as TGtkButton
dim shared numDice as TGtkEntry
dim shared dLabel as TGtkLabel
dim shared numSides as TGtkEntry
dim shared rollList as TGtkListView
dim shared hPanel as TGtkVBox
dim shared iPanel as TGtkHBox

declare sub Main()
declare CALLBACK(Roll)

sub Main()

    with frmMain
        .SetTitle( "D20 Roller" )
        .SetKeepAbove( false )
        .SetSize( 200, 50 )
    end with

    with hPanel
        .SetParent( frmMain )
    end with

    with rollList
        .SetParent( hPanel )
        .addColumn("Results",0)
    end with

    with numDice
        .SetParent(iPanel)
        .SetText("1")
        .SetMaxLength(3)
    end with

    with dLabel
        .SetParent(iPanel)
        .SetText("d")
    end with

    with numSides
        .SetParent(iPanel)
        .SetText("20")
        .SetMaxLength(4)
    end with

    with iPanel
        .SetParent( hPanel )
    end with

    with cmdRoll
        .SetCaption("Roll!")
        .SetMouseClick( @Roll )
        .SetParent( hPanel )
    end with

    frmMain.ShowAll()

    randomize timer

    GtkApp.Start( frmMain )
end sub

CALLBACK(Roll)

    var _numsides = valint(numSides.getText())
    var _numdice = valint(numDice.getText())

    if _numsides = 0 orelse _numdice = 0 then
        GtkApp.MessageBox("Oops!","One or both of those values doesn't make sense!")
    else
        var total = 0u
        for n as integer = 1 to _numdice
            var t = int(rnd(1)*_numsides) + 1
            total += t
        next
        rollList.addString(_numdice & "d" & _numsides & ": " & total,0)
        'GtkApp.MessageBox("Your Roll","You rolled a " & _numdice & "d" & _numsides & " and got: " & total)
    end if

ENDCALLBACK

Main()
