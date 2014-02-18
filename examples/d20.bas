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
dim shared bPanel as TGtkHBox
dim shared cmdClear as TGtkButton
dim shared cmdRoll as TGtkButton
dim shared numDice as TGtkSpinButton
dim shared dLabel as TGtkLabel
dim shared numSides as TGtkSpinButton
dim shared rolls as TGtkListStore
dim shared rollList as TGtkTreeView
dim shared hPanel as TGtkVBox
dim shared iPanel as TGtkHBox
dim shared iScroll as TGtkScrollable

declare sub Main()
declare CALLBACK(Roll)
declare CALLBACK(listChanged)
declare CALLBACK(clearDaList)

sub Main()

    with frmMain
        .Title = "Dice Roller"
        .KeepAbove = false
        .SetSize( 200, 200 )
    end with

    with hPanel
        .SetParent( frmMain )
    end with

    with iScroll
        .setScrollBarPolicy(GTK_POLICY_NEVER,GTK_POLICY_AUTOMATIC)
    end with

    dim cols(0 to 1) as integer
    cols(0) = G_TYPE_STRING
    cols(1) = G_TYPE_STRING

    with rolls
        .setColumnTypes(cols())
    end with

    with rollList
        .initWithModel(rolls,rolls.numColumns)
        .SetParent( iScroll )
    end with

    for n as integer = 0 to 1
        var col = gtk_cell_renderer_text_new()
        var lcol = rollList.column(n)
        with lcol
            .packStart(col,true)
            .expand = true
            .addAttribute(col,"text",n)
            if n = 0 then
                .title = "Dice"
            else
                .title = "Results"
            end if
        end with
    next

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

    with cmdClear
        .label = "Clear"
        .SetMouseClick( @clearDaList )
        .setParent(bPanel)
    end with

    with cmdRoll
        .label = "Roll!"
        .SetMouseClick( @Roll )
        .setParent(bPanel)
    end with

    hPanel.addChild(iScroll,true,true,0)
    hPanel.addChild(iPanel,false,false,0)
    hPanel.addChild(bPanel,false,false,0)

    frmMain.ShowAll()

    randomize timer

    iScroll.getVadjustment()->connect("changed", @listChanged)

    GtkApp.Start( frmMain )
end sub

CALLBACK(clearDaList)

    var x = TGtkListStore(rollList.store)
    x.clear()

ENDCALLBACK

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
        var x = TGtkListStore(rollList.store)
        with x
            .appendRow()
            .add(_numdice & "d" & _numsides)
            .add(str(total),1)
        end with
    end if

ENDCALLBACK

Main()
