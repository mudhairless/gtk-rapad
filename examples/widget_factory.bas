'
'   widget_factory.bas
'
'   This is the test application I use to test and debug the library.
'

#include once "gtkrapad/gtkrapad.bi"

using GtkRapad

'Global object variables
dim shared GtkApp as TGtkApplication
dim shared frmMain as TGtkWindow
dim shared txtEntry as TGtkEntry
dim shared Label as TGtkLabel
dim shared btnOk as TGtkButton
dim shared btnClose as TGtkButton
dim shared btnTest as TGtkButton

dim shared chckBox as TGtkCheckBox
dim shared radio1 as TGtkRadioButton
dim shared radio2 as TGtkRadioButton
dim shared hPanel as TGtkHBox
dim shared vPanel as TGtkVBox

dim shared as TGtkMenuBar   MenuBar
dim shared as TGtkMenu      FileMenu, OptionsMenu, HelpMenu
dim shared as TGtkMenuItem  file_halp, file_lulz, file_save, file_open, file_font, opt_folder

dim shared S_COUNTER as integer = 0

'Prototyping each function of our application
declare sub Main()

declare sub btnClose_Click cdecl ( byval __ as any pointer )
declare sub btnTest_Click cdecl ( byval __ as any pointer )

declare sub btnOk_Click cdecl ( byval __ as any pointer )
declare sub btnOk_MouseEnter cdecl ( byval __ as any pointer )
declare sub btnOk_MouseLeave cdecl ( byval __ as any pointer )

declare sub txtEntry_Activate cdecl( byval __ as any pointer )

declare sub halp_menu_click cdecl ( byval __ as any pointer )
declare sub lulz_menu_click cdecl ( byval __ as any pointer )
declare sub save_menu_click cdecl ( byval __ as any pointer )
declare sub open_menu_click cdecl ( byval __ as any pointer )
declare sub folder_menu_click cdecl ( byval __ as any pointer )
declare sub font_menu_click cdecl ( byval __ as any pointer )

declare sub chk_tog_event cdecl ( byval __ as any pointer )

'------------+------------+------------+------------+------------+----------'
'   End the General Declarations ( if you speak Visual Basic )
'------------+------------+------------+------------+------------+----------'

sub Main()

    'Main function which will setup
    'the GUI and some system call backs. w00t.

    with frmMain
        .Title = "Can you click the OK Button?"
        .KeepAbove = false 
        .SetSize( 400, 100 )
    end with

    var Menu_VBox = type<TGtkVbox>(0,2)

    Menu_VBox.SetParent( frmMain )

    MenuBar.SetParent( Menu_VBox )

    file_halp.Label = "H_alp"
    file_halp.Activate(@halp_menu_click)

    file_save.Label = "_Save"
    file_save.Activate(@save_menu_click)

    file_open.Label = "Op_en"
    file_open.Activate(@open_menu_click)

    file_font.Label = "Font _Chooser"
    file_font.Activate(@font_menu_click)

    file_lulz.Label = "For the Lul_z"
    file_lulz.Activate(@lulz_menu_click)

    opt_folder.Label = "Choose _a Folder"
    opt_folder.Activate(@folder_menu_click)

    with FileMenu
        .AddChild(file_save)
        .AddChild(file_open)
        .AddChild(file_lulz)
    end with

    OptionsMenu.AddChild(file_font)
    OptionsMenu.AddChild(opt_folder)

    HelpMenu.AddChild(file_halp)

    with MenuBar
        .AddMenu("_File", FileMenu)
        .AddMenu("_Options", OptionsMenu)
        .AddMenu("_Help", HelpMenu)
    end with

    with hPanel
        .SetParent( Menu_VBox )
    end with

    with btnOk
        .SetCaption( "Ok" )

        .SetMouseClick( @btnOk_Click() )
        .SetMouseEnter( @btnOk_MouseEnter() )
        .SetMouseLeave( @btnOk_MouseLeave() )

        'alternate syntax
        '.SetEvent( MOUSE_CLICK, @btnOk_Click() )
        '.SetEvent( MOUSE_LEAVE, @btnOk_MouseLeave() )
        '.SetEvent( MOUSE_ENTER, @btnOk_MouseEnter() )

        .SetParent( hPanel )
    end with

    vPanel.SetParent( hPanel )

    with txtEntry
        .SetParent( vPanel )
        .Visibility = true
        .SetEvent( ACTIVATE, @txtEntry_Activate() )

        'Demonstrating what attempting to connect an event that doesn't get sent does: (hint: nothing)
        .SetEvent( MOUSE_CLICK, @btnTest_Click() )
    end with

    Label.SetText( "Hai World!" )
    Label.SetParent( vPanel )

    chckBox.SetLabel( "Are _you?" )
    chckBox.SetEvent( TOGGLED, @chk_tog_event )
    chckBox.SetParent( vPanel )

    with btnClose
        .SetCaption( "Close" )
        .SetEvent( MOUSE_CLICK, @btnClose_Click() )
        .SetParent( hPanel )
    end with


    with btnTest
        .SetCaption( "Test" )
        .SetEvent( MOUSE_CLICK, @btnTest_Click() )
        .SetParent( hPanel )
    end with

    frmMain.ShowAll()

    'the start line must be the last line when starting the application.
    'any gui framework be setup by now, cause after the gtk library has
    'focus, no other lines of code will get called unless by callback.

    gtkApp.Start( frmMain )
end sub



'------------+------------+------------+------------+------------+----------'
'   Code for all of our callback functions
'------------+------------+------------+------------+------------+----------'

sub btnClose_Click cdecl( byval __ as any pointer )
    frmMain.Destroy()
end sub

sub btnTest_Click cdecl( byval __ as any pointer )
    var x = GtkApp.SelectColorWithAlpha("What is your favorite color?")
    print using "Dec: &, Hex: &"; x; hex(x)
end sub

sub btnOk_Click cdecl( byval __ as any pointer )
    S_COUNTER += 1
    frmMain.Title = "'Ok' Button Clicked " & S_COUNTER & " Times!"
    print btnOk.GetCaption()
end sub

sub btnOk_MouseEnter cdecl( byval __ as any pointer )
    frmMain.Title = "You're over the button, Click it."
end sub

sub btnOk_MouseLeave cdecl( byval __ as any pointer )
    frmMain.Title = "Move over the 'Ok' button!"
end sub

sub txtEntry_Activate cdecl( byval __ as any pointer )
    with txtEntry
        print "Your message: " & .Text
        .clear
    end with
end sub

sub halp_menu_click cdecl ( byval __ as any pointer )

    GtkApp.MessageBox("You Clicked", !"The Halp option...\nPlease stand by.\nSomeone will be with you shortly.")

end sub

sub lulz_menu_click cdecl ( byval __ as any pointer )

    txtEntry.HasFrame = CNOT(txtEntry.HasFrame)

    'txtEntry.SetVisibility( cnot(txtEntry.GetVisibility()) )
    'txtEntry.SetMaxLength( txtEntry.GetMaxLength() + 1 )

    chckBox.SetChecked( CNOT( chckBox.isChecked() ) )

end sub


sub save_menu_click cdecl ( byval __ as any pointer )

    print GtkApp.FileSave("Give me the name of a file")

end sub

sub open_menu_click cdecl ( byval __ as any pointer )

    print GtkApp.FileSave("What file would you like?")

end sub

sub font_menu_click cdecl ( byval __ as any pointer )

    print GtkApp.SelectFont("Please choose a font")

end sub

sub folder_menu_click cdecl ( byval __ as any pointer )

    print GtkApp.SelectDirectory()

end sub

sub chk_tog_event cdecl ( byval __ as any pointer )
    if(chckBox.isChecked() = 0) then
        print "Unchecked"
    else
        print "Checked"
        chckBox.SetLabel( "Test: " & S_COUNTER )
    end if
end sub


'------------+------------+------------+------------+------------+----------'
'   Invoke the Main() function
'------------+------------+------------+------------+------------+----------'

Main()
