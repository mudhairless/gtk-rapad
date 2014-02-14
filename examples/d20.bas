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
dim shared numDice as TGtkSpinButton
dim shared dLabel as TGtkLabel
dim shared numSides as TGtkSpinButton
dim shared rollList as TGtkListView
dim shared hPanel as TGtkVBox
dim shared iPanel as TGtkHBox
dim shared iScroll as TGtkScrollable

declare sub Main()
declare CALLBACK(Roll)
declare CALLBACK(listChanged)

sub Main()

    dim cols(0 to 1) as integer
    cols(0) = G_TYPE_STRING
    cols(1) = G_TYPE_STRING

    with frmMain
        .SetTitle( "Dice Roller" )
        .SetKeepAbove( false )
        .SetSize( 200, 200 )
    end with

    with hPanel
        .SetParent( frmMain )
    end with

    with iScroll
        .setScrollBarPolicy(GTK_POLICY_NEVER,GTK_POLICY_AUTOMATIC)
    end with

    with rollList
        .setColumnTypes(cols())
        .SetParent( iScroll )
        .setColumnTitle(0,"Dice")
        .setColumnTitle(1,"Result")
    end with

    with numDice
        .SetParent(iPanel)
        .setRange(1,30)
        .value = 1
        .onlyNumeric = true
        .wrap = true
        .tooltip = "The number of dice to roll."
    end with

    with dLabel
        .SetParent(iPanel)
        .SetText("d")
    end with

    with numSides
        .SetParent(iPanel)
        .setRange(2,100)
        .value = 20
        .onlyNumeric = true
        .wrap = true
        .tooltip = "How many sides the dice have."
    end with

    with cmdRoll
        .SetCaption("Roll!")
        .SetMouseClick( @Roll )
    end with

    hPanel.addChild(iScroll,true,true,0)
    hPanel.addChild(iPanel,false,false,0)
    hPanel.addChild(cmdRoll,false,false,0)

    frmMain.ShowAll()

    randomize timer

    iScroll.getVadjustment()->connect("changed", @listChanged)

    GtkApp.Start( frmMain )
end sub

CALLBACK(listChanged)

    iScroll.getVadjustment->value = iScroll.getVadjustment->upper

ENDCALLBACK

CALLBACK(Roll)

    var _numsides = numSides.intValue()
    var _numdice = numDice.intValue()

    if _numsides < 2 or _numdice < 1 then
        GtkApp.MessageBox("Oops!","One or both of those values doesn't make sense!")
    else
        var total = 0u
        for n as integer = 1 to _numdice
            var t = int(rnd(1)*_numsides) + 1
            total += t
        next
        rollList.appendRow()
        rollList.addString(_numdice & "d" & _numsides)
        rollList.addString(str(total),1)
    end if

ENDCALLBACK

Main()
