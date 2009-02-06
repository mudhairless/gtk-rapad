'
'   TGtkWindow.bi
'

'---------------------------------------------------------------
' Still to do
'---------------------------------------------------------------
'   gtk_window_add_accel_group
'   gtk_window_remove_accel_group
'   gtk_window_set_position
'   gtk_window_activate_default
'   gtk_window_set_modal
'   gtk_window_set_default_size
'   gtk_window_set_deletable
'   gtk_window_move
'   gtk_window_set_transient_for
'   gtk_window_set_destroy_with_parent
'   gtk_window_set_opacity
'
'---------------------------------------------------------------
'the following will not be wrapped by design
'---------------------------------------------------------------
'   gtk_window_set_wmclass      per API document
'   gtk_window_set_role         only works on X11
'   gtk_window_set_policy       deprecated

namespace GtkRapad

    type TGtkWindow

        public:
            declare constructor()

            declare operator cast() as GtkWidget pointer

            declare function ActivateFocus() as gboolean
            declare sub Associate( byval p as GtkWidget pointer )
            declare sub Destroy()
            declare sub Hide()
            declare sub HideAll()
            declare sub Move( byval x_ as integer, byval y_ as integer )
            declare sub Show()
            declare sub ShowAll()

            declare function GetFullScreen() as gboolean
            declare function GetKeepAbove() as gboolean
            declare function GetMaximized() as gboolean
            declare function GetMinimized() as gboolean
            declare function GetName() as string
            declare function GetParent() as GtkWidget pointer
            declare function GetResizable() as gboolean
            declare function GetSticky() as gboolean
            declare function GetTitle() as string

            '---------------------------------------

            declare sub SetDestroyCallback( byval aMethod as gtkGenericCallback )
            declare sub SetFocus( byval wid as GtkWidget pointer )
            declare sub SetFullScreen( byval b as gboolean )
            declare sub SetKeepAbove( byval b as gboolean )
            declare sub SetMaximized( byval b as gboolean )
            declare sub SetMinimized( byval b as gboolean )
            declare sub SetName( byref newName as string )
            declare sub SetParent( byval p as GtkWidget pointer )
            declare sub SetPosition( byref position as GtkWindowPosition )
            declare sub SetResizable( byval b as gboolean )
            declare sub SetSize( byval width as integer, byval height as integer )
            declare sub SetSticky( byval b as gboolean )
            declare sub SetTitle( byref newTitle as string )

            declare sub SetX( byref x_ as integer )
            declare sub SetY( byref y_ as integer )
            declare sub SetHeight( byref h_ as integer )
            declare sub SetWidth( byref w_ as integer )

            declare function GetX() as integer
            declare function GetY() as integer
            declare function GetHeight() as integer
            declare function GetWidth() as integer


        private:
            fullscreen_ as gboolean
            gtype_ as string                'GtkWidget type
            id_ as GtkWidget pointer        'pointer to this object
            keepabove_ as gboolean
            maximize_ as gboolean
            minimized_ as gboolean
            objname_ as string
            parent_ as GtkWidget pointer    'pointer to our parent object
            posx_ as integer                'x position
            posy_ as integer                'y position
            resizable_ as gboolean
            sizeh_ as integer
            sizew_ as integer
            sticky_ as gboolean
            title_ as string                'title of the window
    end type

end namespace
