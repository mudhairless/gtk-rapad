'
'   TGtkMessageDialog.bi
'

namespace GtkRapad

type TGtkMessageDialog

    public:
        declare constructor()
        declare destructor()

        declare operator cast() as GtkWidget pointer

        declare sub Show()

        declare function GetText() as string
        declare function GetTitle() as string
        declare function GetName() as string

        '---------------------------------------

        declare sub SetName( byref newName as string )
        declare sub SetText( byref newText as string )
        declare sub SetTitle( byref newTitle as string )

    private:
        id_ as GtkWidget pointer    'pointer to this object
        text_ as string             'header of the window
        title_ as string            'title of the window
        objname_ as string
end type



end namespace
