'
'   TGtkApplication.bi
'
'   A wrapper for generic GTK calls
'

'making up for missing declares in .18.3's headers
extern "C"
    declare sub gtk_file_chooser_set_do_overwrite_confirmation (byval __ as GtkFileChooser ptr, byval do_overwrite_confirmation as gboolean )
end extern

#include once "gtkrapad/TGtkMessageDialog.bi"

namespace GtkRapad

    type TGtkApplication

        public:
            declare constructor()
            declare constructor( byval argc as integer ptr, byval argv as byte ptr ptr ptr )

            'declare destructor()

            declare sub Start( byval quitObj as GtkWidget pointer )
            declare sub Quit()

            declare sub MessageBox( byref title as string = "Message", byref text as string = "" )

            declare function FileOpen( _
                    byref title_ as string = "Choose a file", _
                    byref dir_start as string = "" _
                    ) as string

            declare function FileSave(  byref title_ as string = "Choose a filename", _
                    byref dir_start as string = "", _
                    byref default_name as string = "Untitled" _
                    ) as string

            'Choose Color Dialogs
            declare function SelectColor( byref title_ as string = "Choose a color" ) as uinteger

            declare function SelectColorWithAlpha( byref title_ as string = "Select a color" ) as uinteger

            declare function SelectFont( byref title_ as string = "Choose a font" ) as string

            declare function SelectDirectory( _
                    byref title_ as string = "Choose a directory", _
                    byref dir_start as string = "" _
                    ) as string

        private:
            id_ as GtkWidget pointer
    end type

end namespace

