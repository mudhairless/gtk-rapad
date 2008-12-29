'
'   TGtkMessageDialog.bi
'

namespace GtkRapad

type TGtkMessageDialog

    public:
        declare constructor()
        declare destructor()

        declare sub Show()

        declare function ID() as GtkWidget Pointer

        declare sub SetTitle( byref newTitle as string )
        declare function GetTitle() as string

        declare sub SetText( byref newText as string )
        declare function GetText() as string

    private:
        id_ as GtkWidget Pointer    'pointer to this object

        title_ as string            'title of the window
        text_ as string             'header of the window

end type



end namespace
