'
'   TGtkApplication.bi
'
'   A wrapper for generic GTK calls
'

#if not __FB_MIN_VERSION__(0,18,4)
'making up for missing declares in .18.3's headers
extern "C"
    declare sub gtk_file_chooser_set_do_overwrite_confirmation (byval __ as GtkFileChooser pointer, byval do_overwrite_confirmation as gboolean )
end extern
#endif

type TGtkClipboard_ as TGtkClipboard

namespace GtkRapad

    type TGtkApplication

        public:
            declare constructor()
            declare destructor

            declare sub Start( byval quitObj as GtkWidget pointer )
            declare sub Quit()

            declare sub MessageBox( byref title as string = "Message", byref text as string = "" )

            declare function FileOpen( byref title_ as string = "Choose a file", byref dir_start as string = "" ) as string
            declare function FileSave( byref title_ as string = "Choose a filename", byref dir_start as string = "", byref default_name as string = "Untitled" ) as string
            declare function SelectColor( byref title_ as string = "Choose a color" ) as uinteger
            declare function SelectColorWithAlpha( byref title_ as string = "Select a color" ) as uinteger
            declare function SelectFont( byref title_ as string = "Choose a font" ) as string
            declare function SelectDirectory( byref title_ as string = "Choose a directory", byref dir_start as string = "" ) as string

            declare sub SetName(byref nname_ as string)
            declare function GetName() as string

        Clipboard as TGtkClipboard_ ptr

        private:
            appname_ as string
    end type

end namespace

