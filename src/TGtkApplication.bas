
#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkApplication
        gtk_init( 0, 0 )
    end constructor

    constructor TGtkApplication( byval argc as integer pointer, byval argv as byte pointer pointer pointer )
        gtk_init( argc, argv )
    end constructor


    sub TGtkApplication.Start( byval quitObj as GtkWidget Pointer )
        'Once gtk_main() is called our application will enter a loop
        'which does not end until gtk_main_quit() is invoked, thus we
        'hook the gtk_main_quit() call to the closing of our "Main"
        'object.  Then we start the gtk_main() function.

        g_signal_connect( GTK_OBJECT( quitObj ), "destroy", G_CALLBACK(@gtk_main_quit()), quitObj )
        gtk_main()
    end sub


    sub TGtkApplication.Quit()
        gtk_main_quit()
    end sub


    sub TGtkApplication.MessageBox( byref title as string = "Message", byref text as string = "" )

        var msgdlg = gtk_message_dialog_new_with_markup( 0, GTK_DIALOG_MODAL, GTK_MESSAGE_INFO, GTK_BUTTONS_OK, "" )

        gtk_window_set_title(GTK_WINDOW(msgdlg), title)
        gtk_message_dialog_set_markup(GTK_MESSAGE_DIALOG(msgdlg), text)

        gtk_dialog_run(GTK_DIALOG(msgdlg))
        gtk_widget_destroy(GTK_WIDGET(msgdlg))

    end sub


    function TGtkApplication.FileOpen( byref title_ as string = "Choose a file", byref dir_start as string = "" ) as string

        var dialog = gtk_file_chooser_dialog_new (title_, _
                      NULL, _
                      GTK_FILE_CHOOSER_ACTION_OPEN, _
                      GTK_STOCK_CANCEL, GTK_RESPONSE_CANCEL, _
                      GTK_STOCK_OPEN, GTK_RESPONSE_ACCEPT, _
                      NULL)

        var filename = ""

        if (gtk_dialog_run (GTK_DIALOG(dialog)) = GTK_RESPONSE_ACCEPT) then
            filename = *(gtk_file_chooser_get_filename (GTK_FILE_CHOOSER(dialog)))
        end if

        gtk_widget_destroy(dialog)

        return filename

    end function


    function TGtkApplication.FileSave( byref title_ as string = "Choose a filename", byref dir_start as string = "", byref default_name as string = "Untitled" ) as string

        var dialog = gtk_file_chooser_dialog_new ("Save File", _
                      NULL, _
                      GTK_FILE_CHOOSER_ACTION_SAVE, _
                      GTK_STOCK_CANCEL, GTK_RESPONSE_CANCEL, _
                      GTK_STOCK_SAVE, GTK_RESPONSE_ACCEPT, _
                      NULL)

        gtk_file_chooser_set_do_overwrite_confirmation (GTK_FILE_CHOOSER (dialog), 1)

        if dir_start <> "" then
            gtk_file_chooser_set_current_folder (GTK_FILE_CHOOSER (dialog), dir_start)
        end if

        gtk_file_chooser_set_current_name (GTK_FILE_CHOOSER (dialog), default_name)

        var filename = ""

        if (gtk_dialog_run (GTK_DIALOG (dialog)) = GTK_RESPONSE_ACCEPT) then
            filename = *(gtk_file_chooser_get_filename (GTK_FILE_CHOOSER (dialog)))
        end if

        gtk_widget_destroy (dialog)

        return filename

    end function


    function TGtkApplication.SelectColor( byref title_ as string = "Select a color" ) as uinteger

        var colorseldlg = gtk_color_selection_dialog_new(title_)
        var colorsel = GTK_COLOR_SELECTION(GTK_COLOR_SELECTION_DIALOG (colorseldlg)->colorsel)
        var response = gtk_dialog_run(GTK_DIALOG (colorseldlg))

        dim _color as GdkColor

        if response = GTK_RESPONSE_OK then
            gtk_color_selection_get_current_color (colorsel, @_color)
            gtk_widget_hide (colorseldlg)

            return rgb(_color.red shr 8, _color.green shr 8, _color.blue shr 8)
        else
            gtk_widget_hide (colorseldlg)
            return 0
        end if

    end function

    function TGtkApplication.SelectColorWithAlpha( byref title_ as string = "Select a color" ) as uinteger

        var colorseldlg = gtk_color_selection_dialog_new (title_)
        var colorsel = GTK_COLOR_SELECTION (GTK_COLOR_SELECTION_DIALOG (colorseldlg)->colorsel)

        gtk_color_selection_set_has_opacity_control(colorsel, 1)

        var response = gtk_dialog_run (GTK_DIALOG (colorseldlg))

        dim _color as GdkColor

        if response = GTK_RESPONSE_OK then
            gtk_color_selection_get_current_color (colorsel, @_color)
            var gAlpha = gtk_color_selection_get_current_alpha (colorsel)

            gtk_widget_hide (colorseldlg)

            return rgba(_color.red shr 8, _color.green shr 8, _color.blue shr 8, gAlpha shr 8)
        else
            gtk_widget_hide (colorseldlg)
            return 0
        end if

    end function

    function TGtkApplication.SelectDirectory( byref title_ as string = "Choose a directory", byref dir_start as string = "" ) as string
        var dialog = gtk_file_chooser_dialog_new (title_, _
                      NULL, _
                      GTK_FILE_CHOOSER_ACTION_CREATE_FOLDER, _
                      GTK_STOCK_CANCEL, GTK_RESPONSE_CANCEL, _
                      GTK_STOCK_OPEN, GTK_RESPONSE_ACCEPT, _
                      NULL)

        var filename = ""

        if (gtk_dialog_run (GTK_DIALOG (dialog)) = GTK_RESPONSE_ACCEPT) then
            filename = *(gtk_file_chooser_get_filename (GTK_FILE_CHOOSER (dialog)))
        end if

        gtk_widget_destroy(dialog)

        return filename

    end function

    function TGtkApplication.SelectFont( byref title_ as string = "Choose a font" ) as string

        var dialog = gtk_font_selection_dialog_new(title_)
        var response = gtk_dialog_run(GTK_DIALOG (dialog))
        var retval = ""

        if response = GTK_RESPONSE_OK then
            retval = *(gtk_font_selection_dialog_get_font_name(GTK_FONT_SELECTION_DIALOG(dialog)))
        end if

        gtk_widget_destroy(dialog)

        return retval

    end function

    sub TGtkApplication.SetName( byref nname_ as string )
        appname_ = nname_
    end sub

    function TGtkApplication.GetName() as string
        return appname_
    end function

    'Global Functions

    sub RuntimeError( byref error_ as string )
        print "Runtime Error: " & error_
    end sub

    function GetGtkWidgetType( byval wid as GtkWidget pointer ) as string
        dim p as integer

        dim p_str as zstring pointer
        dim s_str as string

        gtk_widget_class_path( wid, 0, @p_str, 0 )

        s_str = *p_str

        while (instr(p + 1, s_str, "." )) > 0
            p = instr( p + 1, s_str, "." )
        wend

        return mid(s_str, (p + 1))
    end function

end namespace
