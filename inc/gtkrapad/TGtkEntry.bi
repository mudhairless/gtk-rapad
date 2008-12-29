'
'   TGtkEntry.bi
'

'def set_invisible_char(ch)
'def get_invisible_char()

'def set_activates_default(setting)
'def get_activates_default()
'def set_width_chars(n_chars)
'def get_width_chars()
'def get_layout()
'def get_layout_offsets()
'def set_alignment(xalign)
'def get_alignment()
'def set_completion(width_chars)
'def get_completion()
'def set_inner_border(border)
'def get_inner_border()
'def set_cursor_hadjustment(adjustment)
'def get_cursor_hadjustment()

namespace GtkRapad

    type TGtkEntry

        public:
            declare constructor()
            declare constructor( byref max_length as integer )

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

            declare sub SetEvent( byval ev as TGtkEvents, byval aMethod as gtkGenericCallback )

            declare sub SetActivate( byval aMethod as gtkGenericCallback )

            declare sub SetMaxLength( byval iv as integer )
            declare function GetMaxLength() as integer

            declare sub SetHasFrame( byval b as gboolean )
            declare function GetHasFrame() as gboolean

            declare sub SetVisibility( byval b as gboolean )
            declare function GetVisibility() as gboolean

            declare sub Clear()

            declare sub SetText( byval txt as string )
            declare function GetText() as string

        private:
            id_ as GtkWidget Pointer        'pointer to this object
            parent_ as GtkWidget pointer    'pointer to our parent object
            gtype_ as string                'GtkWidget type
    end type

end namespace
