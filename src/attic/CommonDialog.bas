'this file was written by ebben.feagan@gmail.com
'i moved it to the attic so that i could merge it with the application
'object.  i dont think that these calls should pollute the name space
'so they will be wrapped inside of the TGtkApplication object.

#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    sub GtkMessageBox( byref title as string, byref text as string )
        dim b as TGtkMessageDialog

        b.SetText( text )
        b.SetTitle( title )
        b.Show()
    end sub

    function GtkGetColor( byref title_ as string = "Select a color" ) as uinteger

        var colorseldlg = gtk_color_selection_dialog_new (title_)

        var colorsel = GTK_COLOR_SELECTION (GTK_COLOR_SELECTION_DIALOG (colorseldlg)->colorsel)

        var response = gtk_dialog_run (GTK_DIALOG (colorseldlg))

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

    function GtkGetColorWithAlpha( byref title_ as string = "Select a color" ) as uinteger

        var colorseldlg = gtk_color_selection_dialog_new (title_)

        var colorsel = GTK_COLOR_SELECTION (GTK_COLOR_SELECTION_DIALOG (colorseldlg)->colorsel)

        gtk_color_selection_set_has_opacity_control( colorsel, 1 )

        var response = gtk_dialog_run (GTK_DIALOG (colorseldlg))

        dim _color as GdkColor

        if response = GTK_RESPONSE_OK then
            gtk_color_selection_get_current_color (colorsel, @_color)
            var alpha = gtk_color_selection_get_current_alpha (colorsel)

            gtk_widget_hide (colorseldlg)

            return rgba(_color.red shr 8, _color.green shr 8, _color.blue shr 8, alpha shr 8)
        else
            gtk_widget_hide (colorseldlg)
            return 0
        end if

    end function

    function GtkLoadFile( byref title_ as string = "Choose a file", byref dir_start as string = "" ) as string

        var dialog = gtk_file_chooser_dialog_new (title_, _
                      NULL, _
                      GTK_FILE_CHOOSER_ACTION_OPEN, _
                      GTK_STOCK_CANCEL, GTK_RESPONSE_CANCEL, _
                      GTK_STOCK_OPEN, GTK_RESPONSE_ACCEPT, _
                      NULL)

        var filename = ""

        if (gtk_dialog_run (GTK_DIALOG (dialog)) = GTK_RESPONSE_ACCEPT) then

            filename = *(gtk_file_chooser_get_filename (GTK_FILE_CHOOSER (dialog)))

        end if

        gtk_widget_destroy (dialog)

        return filename

    end function

    function GtkSaveFile( byref title_ as string = "Choose a filename", byref dir_start as string = "", byref default_name as string = "Untitled" ) as string

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

    function GtkSelectDirectory( byref title_ as string = "Choose a directory", byref dir_start as string = "" ) as string

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

        gtk_widget_destroy (dialog)

        return filename

    end function

    function GtkFontSelect( byref title_ as string = "Choose a font" ) as string

        var dlg = gtk_font_selection_dialog_new (title_)

        var response = gtk_dialog_run (GTK_DIALOG (dlg))

        var retval = ""

        if response = GTK_RESPONSE_OK then
            retval = *(gtk_font_selection_dialog_get_font_name(GTK_FONT_SELECTION_DIALOG(dlg))      )

        end if

        gtk_widget_destroy (dlg)

        return retval

    end function
end namespace
