namespace GtkRapad

type TGtkRecentChooserDialog

    declare constructor( byref title_ as string = "Recent Documents" )

    declare function addButton( byref btext as string, byval rid as integer ) as GtkWidget ptr
    declare property defaultResponse( byval r as integer )

    declare function run() as integer

    DECLARE_RECENT_CHOOSER_COMMON()
    DECLARE_COMMON_FUNCS()
    COMMON_MEMBERS()
end type

end namespace
