#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkNotebook)

    constructor TGtkNotebook
        id_ = gtk_notebook_new()
        init()
    end constructor

    function TGtkNotebook.appendPage( byref lbl as string, byval child as GtkWidget ptr ) as integer
        var tlbl = TGtkLabel(lbl)
        return gtk_notebook_append_page_menu(GTK_NOTEBOOK(id_),child,tlbl,0)
    end function

    function TGtkNotebook.appendPage( byval lbl as GtkWidget ptr, byval child as GtkWidget ptr, byval menulbl as GtkWidget ptr = 0 ) as integer
        return gtk_notebook_append_page_menu(GTK_NOTEBOOK(id_),child,lbl,menulbl)
    end function

    function TGtkNotebook.prependPage( byref lbl as string, byval child as GtkWidget ptr ) as integer
        var tlbl = TGtkLabel(lbl)
        return gtk_notebook_prepend_page_menu(GTK_NOTEBOOK(id_),child,tlbl,0)
    end function

    function TGtkNotebook.prependPage( byval lbl as GtkWidget ptr, byval child as GtkWidget ptr, byval menulbl as GtkWidget ptr = 0 ) as integer
        return gtk_notebook_prepend_page_menu(GTK_NOTEBOOK(id_),child,lbl,menulbl)
    end function

    function TGtkNotebook.insertPageAt( byval ind as integer, byref lbl as string, byval child as GtkWidget ptr ) as integer
        var tlbl = TGtkLabel(lbl)
        return gtk_notebook_insert_page_menu(GTK_NOTEBOOK(id_),child,tlbl,0,ind)
    end function

    function TGtkNotebook.insertPageAt( byval ind as integer, byval lbl as GtkWidget ptr, byval child as GtkWidget ptr, byval menulbl as GtkWidget ptr = 0 ) as integer
        return gtk_notebook_insert_page_menu(GTK_NOTEBOOK(id_),child,lbl,menulbl,ind)
    end function

    sub TGtkNotebook.removePage( byval ind as integer )
        gtk_notebook_remove_page(GTK_NOTEBOOK(id_),ind)
    end sub

    sub TGtkNotebook.moveChild( byval child as GtkWidget ptr, byval ind as integer )
        gtk_notebook_reorder_child(GTK_NOTEBOOK(id_),child,ind)
    end sub

    sub TGtkNotebook.setPage( byval ind as integer )
        gtk_notebook_set_current_page(GTK_NOTEBOOK(id_),ind)
    end sub

    function TGtkNotebook.currentPage() as integer
        return gtk_notebook_get_current_page(GTK_NOTEBOOK(id_))
    end function

    sub TGtkNotebook.nextPage()
        gtk_notebook_next_page(GTK_NOTEBOOK(id_))
    end sub

    sub TGtkNotebook.prevPage()
        gtk_notebook_prev_page(GTK_NOTEBOOK(id_))
    end sub

    function TGtkNotebook.at( byval ind as integer ) as GtkWidget ptr
        return gtk_notebook_get_nth_page(GTK_NOTEBOOK(id_),ind)
    end function

    function TGtkNotebook.length() as integer
        return gtk_notebook_get_n_pages(GTK_NOTEBOOK(id_))
    end function

    sub TGtkNotebook.enablePopup()
        gtk_notebook_popup_enable(GTK_NOTEBOOK(id_))
    end sub

    sub TGtkNotebook.disablePopup()
        gtk_notebook_popup_disable(GTK_NOTEBOOK(id_))
    end sub

    sub TGtkNotebook.setTabLabel( byval child as GtkWidget ptr, byval lbl as GtkWidget ptr = 0 )
        gtk_notebook_set_tab_label(GTK_NOTEBOOK(id_),child,lbl)
    end sub
    
    sub TGtkNotebook.setTabLabelText( byval child as GtkWidget ptr, byref t as string )
        gtk_notebook_set_tab_label_text(GTK_NOTEBOOK(id_),child,t)
    end sub
    
    function TGtkNotebook.getTabLabel( byval child as GtkWidget ptr ) as GtkWidget ptr
        return gtk_notebook_get_tab_label(GTK_NOTEBOOK(id_),child)
    end function

    sub TGtkNotebook.setMenuLabel( byval child as GtkWidget ptr, byval menulbl as GtkWidget ptr = 0 )
        gtk_notebook_set_menu_label(GTK_NOTEBOOK(id_),child,menulbl)
    end sub

    sub TGtkNotebook.setMenuLabelText( byval child as GtkWidget ptr, byref t as string )
        gtk_notebook_set_menu_label_text(GTK_NOTEBOOK(id_),child,t)
    end sub

    function TGtkNotebook.getMenuLabel( byval child as GtkWidget ptr ) as GtkWidget ptr
        return gtk_notebook_get_menu_label(GTK_NOTEBOOK(id_),child)
    end function
    

    property TGtkNotebook.tabsPosition() as GtkPositionType
        return gtk_notebook_get_tab_pos(GTK_NOTEBOOK(id_))
    end property

    property TGtkNotebook.tabsPosition( byval p as GtkPositionType )
        gtk_notebook_set_tab_pos(GTK_NOTEBOOK(id_),p)
    end property

    property TGtkNotebook.scrollable() as gboolean
        return gtk_notebook_get_scrollable(GTK_NOTEBOOK(id_))
    end property

    property TGtkNotebook.scrollable( byval t as gboolean )
        gtk_notebook_set_scrollable(GTK_NOTEBOOK(id_),t)
    end property

    property TGtkNotebook.showBorder() as gboolean
        return gtk_notebook_get_show_border(GTK_NOTEBOOK(id_))
    end property

    property TGtkNotebook.showBorder( byval t as gboolean )
        gtk_notebook_set_show_border(GTK_NOTEBOOK(id_),t)
    end property

    property TGtkNotebook.hBorder() as ushort
        return gtk_notebook_get_tab_hborder(GTK_NOTEBOOK(id_))
    end property

    property TGtkNotebook.hBorder( byval w as ushort )
        gtk_notebook_set_tab_hborder(GTK_NOTEBOOK(id_),w)
    end property

    property TGtkNotebook.vBorder() as ushort
        return gtk_notebook_get_tab_vborder(GTK_NOTEBOOK(id_))
    end property

    property TGtkNotebook.vBorder( byval w as ushort )
        gtk_notebook_set_tab_vborder(GTK_NOTEBOOK(id_),w)
    end property

end namespace
