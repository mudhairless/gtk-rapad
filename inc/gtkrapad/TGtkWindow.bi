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
            declare sub Associate( byval p as GtkWidget pointer )
            declare sub Show()
            declare sub Hide()
            declare sub ShowAll()
            declare sub HideAll()
            declare sub Destroy()
            declare sub SetParent( byval p as GtkWidget Pointer )
            declare function GetParent() as GtkWidget Pointer

            '---------------------------------------

            declare sub SetSize( byval width as integer, byval height as integer )

            declare sub SetTitle( byref newTitle as string )
            declare function GetTitle() as string

            declare function ActivateFocus() as gboolean

            declare sub SetPosition( byref position as GtkWindowPosition )
            declare sub SetFocus( byval wid as GtkWidget Pointer )

            declare sub SetFullScreen( byval b as gboolean )
            declare sub SetKeepAbove( byval b as gboolean )
            declare sub SetMaximized( byval b as gboolean )
            declare sub SetMinimized( byval b as gboolean )
            declare sub SetResizable( byval b as gboolean )
            declare sub SetSticky( byval b as gboolean )

            declare function GetFullScreen() as gboolean
            declare function GetKeepAbove() as gboolean
            declare function GetMaximized() as gboolean
            declare function GetMinimized() as gboolean
            declare function GetResizable() as gboolean
            declare function GetSticky() as gboolean

        private:
            id_ as GtkWidget Pointer        'pointer to this object
            parent_ as GtkWidget pointer    'pointer to our parent object
            gtype_ as string                'GtkWidget type

            title_ as string                'title of the window

            fullscreen_ as gboolean
            keepabove_ as gboolean
            maximize_ as gboolean
            minimized_ as gboolean
            resizable_ as gboolean
            sticky_ as gboolean
    end type

end namespace
