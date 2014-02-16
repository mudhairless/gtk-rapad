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

            declare sub setIconFromFile( byref f as string )
            declare sub setIconFromName( byref n as string )
            declare sub setIcon( byval i as GdkPixbuf ptr )

            declare function ActivateFocus() as gboolean
            declare sub Move( byval x_ as integer, byval y_ as integer )

            declare sub SetDestroyCallback( byval aMethod as gtkGenericCallback )
            declare sub SetFocus( byval wid as GtkWidget pointer )
            declare sub setSize( byval width as integer, byval height as integer )

            declare property FullScreen() as gboolean
            declare property KeepAbove() as gboolean
            declare property Maximized() as gboolean
            declare property Minimized() as gboolean
            declare property Resizable() as gboolean
            declare property Sticky() as gboolean
            declare property Title() as string

            declare property FullScreen( byval b as gboolean )
            declare property KeepAbove( byval b as gboolean )
            declare property Maximized( byval b as gboolean )
            declare property Minimized( byval b as gboolean )
            declare property Position( byref position_ as GtkWindowPosition )
            declare property Resizable( byval b as gboolean )
            declare property Sticky( byval b as gboolean )
            declare property Title( byref newTitle as string )

            declare property modal() as gboolean
            declare property modal( byval t as gboolean )

            declare property skipTaskBarHint( byval t as gboolean )
            declare property skipPagerHint( byval t as gboolean )
            declare property decorated( byval t as gboolean )
            declare property hasFrame( byval t as gboolean )
            declare property urgencyHint( byval t as gboolean )

            declare property X( byval x_ as integer )
            declare property Y( byval y_ as integer )
            declare property Height( byval h_ as integer )
            declare property Width( byval w_ as integer )

            declare property X() as integer
            declare property Y() as integer
            declare property Height() as integer
            declare property Width() as integer

            DECLARE_COMMON_FUNCS()

            COMMON_MEMBERS()
            
        private:
            fullscreen_ as gboolean
            keepabove_ as gboolean
            maximize_ as gboolean
            minimized_ as gboolean
            posx_ as integer                'x position
            posy_ as integer                'y position
            resizable_ as gboolean
            sizeh_ as integer
            sizew_ as integer
            sticky_ as gboolean
            title_ as string                'title of the window
    end type

end namespace
