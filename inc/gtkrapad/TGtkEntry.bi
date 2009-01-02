'
'   TGtkEntry.bi
'


'def get_activates_default()
'def get_alignment()
'def get_completion()
'def get_cursor_hadjustment()
'def get_inner_border()
'def get_invisible_char()
'def get_layout()
'def get_layout_offsets()
'def get_width_chars()

'def set_activates_default(setting)
'def set_alignment(xalign)
'def set_completion(width_chars)
'def set_cursor_hadjustment(adjustment)
'def set_inner_border(border)
'def set_invisible_char(ch)
'def set_width_chars(n_chars)

namespace GtkRapad

    type TGtkEntry

        public:
            declare constructor()
            declare constructor( byref max_length as integer )

            declare operator cast() as GtkWidget pointer

            declare sub Associate( byval p as GtkWidget pointer )
            declare sub Destroy()
            declare sub Hide()
            declare sub HideAll()
            declare sub Show()
            declare sub ShowAll()

            declare function GetHasFrame() as gboolean
            declare function GetMaxLength() as integer
            declare function GetName() as string
            declare function GetParent() as GtkWidget Pointer
            declare function GetText() as string
            declare function GetVisibility() as gboolean

            '---------------------------------------

            declare sub SetActivate( byval aMethod as gtkGenericCallback )
            declare sub SetEvent( byval ev as TGtkEvents, byval aMethod as gtkGenericCallback )
            declare sub SetHasFrame( byval b as gboolean )
            declare sub SetMaxLength( byval iv as integer )
            declare sub SetName(byref newName as string)
            declare sub SetParent( byval p as GtkWidget Pointer )
            declare sub SetText( byval txt as string )
            declare sub SetVisibility( byval b as gboolean )

            declare sub Clear()

        private:
            id_ as GtkWidget Pointer        'pointer to this object
            parent_ as GtkWidget pointer    'pointer to our parent object
            gtype_ as string                'GtkWidget type
            objname_ as string
    end type

end namespace
