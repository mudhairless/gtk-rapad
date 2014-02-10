#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    enum
        COL_SINGLE,
        COL_MAX
    end enum

    constructor TGtkListStore()
        'for some reason you cant add columns later
        'for now a list store will only be single column

        id_ = gtk_list_store_new( COL_MAX, COL_SINGLE )
    end constructor

    operator TGtkListStore.cast() as GtkListStore Pointer
        return id_
    end operator

    '-----------------------------------------------
end namespace
