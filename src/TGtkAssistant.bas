#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkAssistant)

    constructor TGtkAssistant
        id_ = gtk_assistant_new()
        init()
    end constructor

    operator TGtkAssistant.cast() as GtkWidget ptr
        return id_
    end operator

    function TGtkAssistant.prependPage( byval p as GtkWidget ptr ) as integer
        return gtk_assistant_prepend_page(GTK_ASSISTANT(id_),p)
    end function

    function TGtkAssistant.appendPage( byval p as GtkWidget ptr ) as integer
        return gtk_assistant_append_page(GTK_ASSISTANT(id_),p)
    end function

    function TGtkAssistant.insertPage( byval p as GtkWidget ptr, byval i as integer ) as integer
        return gtk_assistant_insert_page(GTK_ASSISTANT(id_),p,i)
    end function

    property TGtkAssistant.currentPage() as integer
        return gtk_assistant_get_current_page(GTK_ASSISTANT(id_))
    end property

    property TGtkAssistant.currentPage( byval p as integer )
        gtk_assistant_set_current_page(GTK_ASSISTANT(id_),p)
    end property

    function TGtkAssistant.getPageType( byval child as GtkWidget ptr ) as GtkAssistantPageType
        return gtk_assistant_get_page_type(GTK_ASSISTANT(id_),child)
    end function

    sub TGtkAssistant.setPageType( byval child as GtkWidget ptr, byval t as GtkAssistantPageType )
        gtk_assistant_set_page_type(GTK_ASSISTANT(id_),child,t)
    end sub

    function TGtkAssistant.getPageTitle( byval child as GtkWidget ptr ) as string
        return *gtk_assistant_get_page_title(GTK_ASSISTANT(id_),child)
    end function

    sub TGtkAssistant.setPageTitle( byval child as GtkWidget ptr, byref t as string )
        gtk_assistant_set_page_title(GTK_ASSISTANT(id_),child,t)
    end sub

    function TGtkAssistant.getPageHeaderImage( byval child as GtkWidget ptr ) as GdkPixbuf ptr
        return gtk_assistant_get_page_header_image(GTK_ASSISTANT(id_),child)
    end function

    sub TGtkAssistant.setPageHeaderImage( byval child as GtkWidget ptr, byval i as GdkPixbuf ptr )
        gtk_assistant_set_page_header_image(GTK_ASSISTANT(id_),child,i)
    end sub

    function TGtkAssistant.getPageSideImage( byval child as GtkWidget ptr ) as GdkPixbuf ptr
        return gtk_assistant_get_page_side_image(GTK_ASSISTANT(id_),child)
    end function

    sub TGtkAssistant.setPageSideImage( byval child as GtkWidget ptr, byval i as GdkPixbuf ptr )
        gtk_assistant_set_page_side_image(GTK_ASSISTANT(id_),child,i)
    end sub

    function TGtkAssistant.isPageComplete( byval child as GtkWidget ptr ) as gboolean
        return gtk_assistant_get_page_complete(GTK_ASSISTANT(id_),child)
    end function

    sub TGtkAssistant.setPageComplete( byval child as GtkWidget ptr, byval t as gboolean )
        gtk_assistant_set_page_complete(GTK_ASSISTANT(id_),child,t)
    end sub

    sub TGtkAssistant.addActionWidget( byval w as GtkWidget ptr )
        gtk_assistant_add_action_widget(GTK_ASSISTANT(id_),w)
    end sub

    sub TGtkAssistant.removeActionWidget( byval w as GtkWidget ptr )
        gtk_assistant_remove_action_widget(GTK_ASSISTANT(id_),w)
    end sub

    sub TGtkAssistant.updateButtonState()
        gtk_assistant_update_buttons_state(GTK_ASSISTANT(id_))
    end sub

    sub TGtkAssistant.commit()
        gtk_assistant_commit(GTK_ASSISTANT(id_))
    end sub

    property TGtkAssistant.length() as integer
        return gtk_assistant_get_n_pages(GTK_ASSISTANT(id_))
    end property

    function TGtkAssistant.at( byval i as integer ) as GtkWidget ptr
        return gtk_assistant_get_nth_page(GTK_ASSISTANT(id_),i)
    end function

end namespace
