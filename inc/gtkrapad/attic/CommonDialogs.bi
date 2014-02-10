
'this file was written by ebben.feagan@gmail.com
'i moved it to the attic so that i could merge it with the application
'object.  i dont think that these calls should pollute the name space
'so they will be wrapped inside of the TGtkApplication object.


'making up for missing declares in .18.3's headers
extern "C"
    declare sub gtk_file_chooser_set_do_overwrite_confirmation (byval __ as GtkFileChooser ptr, byval do_overwrite_confirmation as gboolean )
end extern

namespace GtkRapad

    declare sub GtkMessageBox( byref title as string = "Message", byref text as string = "" )

    'Choose Color Dialogs
    declare function GtkGetColor( byref title_ as string = "Choose a color" ) as uinteger
    declare function GtkGetColorWithAlpha( byref title_ as string = "Select a color" ) as uinteger

    'File Chooser Dialogs
    declare function GtkLoadFile( _
            byref title_ as string = "Choose a file", _
            byref dir_start as string = "" _
            ) as string

    declare function GtkSaveFile(  byref title_ as string = "Choose a filename", _
            byref dir_start as string = "", _
            byref default_name as string = "Untitled" _
            ) as string

    declare function GtkSelectDirectory( _
            byref title_ as string = "Choose a directory", _
            byref dir_start as string = "" _
            ) as string

    declare function GtkFontSelect( byref title_ as string = "Choose a font" ) as string

end namespace
