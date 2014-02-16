#macro DECLARE_RECENT_CHOOSER_COMMON()
    declare property showPrivate() as gboolean
    declare property showPrivate( byval t as gboolean )
    declare property showNotFound() as gboolean
    declare property showNotFound( byval t as gboolean )
    declare property showIcons() as gboolean
    declare property showIcons( byval t as gboolean )
    declare property selectMulti() as gboolean
    declare property selectMulti( byval t as gboolean )
    declare property localOnly() as gboolean
    declare property localOnly( byval t as gboolean )
    declare property limit() as integer
    declare property limit( byval t as integer )
    declare property showTips() as gboolean
    declare property showTips( byval t as gboolean )
    declare property sortType() as GtkRecentSortType
    declare property sortType( byval t as GtkRecentSortType )
    declare property currentURI() as string
    declare property currentURI( byref u as string )
    declare property currentItem() as TGtkRecentInfo
    declare sub addGlobFilter( byref g as string )
    declare sub addAgeFilter( byref max_days as integer )
    declare sub addMimeFilter( byref m as string )
    declare sub removeFilters()
#endmacro

#macro RECENT_CHOOSER_COMMON(cname)
    property cname.showPrivate() as gboolean
        return gtk_recent_chooser_get_show_private(GTK_RECENT_CHOOSER(id_))
    end property

    property cname.showPrivate( byval t as gboolean )
        gtk_recent_chooser_set_show_private(GTK_RECENT_CHOOSER(id_),t)
    end property

    property cname.showNotFound() as gboolean
        return gtk_recent_chooser_get_show_not_found(GTK_RECENT_CHOOSER(id_))
    end property

    property cname.showNotFound( byval t as gboolean )
        gtk_recent_chooser_set_show_not_found(GTK_RECENT_CHOOSER(id_),t)
    end property

    property cname.showIcons() as gboolean
        return gtk_recent_chooser_get_show_icons(GTK_RECENT_CHOOSER(id_))
    end property

    property cname.showIcons( byval t as gboolean )
        gtk_recent_chooser_set_show_icons(GTK_RECENT_CHOOSER(id_),t)
    end property

    property cname.selectMulti() as gboolean
        return gtk_recent_chooser_get_select_multiple(GTK_RECENT_CHOOSER(id_))
    end property

    property cname.selectMulti( byval t as gboolean )
        gtk_recent_chooser_set_select_multiple(GTK_RECENT_CHOOSER(id_),t)
    end property

    property cname.localOnly() as gboolean
        return gtk_recent_chooser_get_local_only(GTK_RECENT_CHOOSER(id_))
    end property

    property cname.localOnly( byval t as gboolean )
        gtk_recent_chooser_set_local_only(GTK_RECENT_CHOOSER(id_),t)
    end property

    property cname.limit() as integer
        return gtk_recent_chooser_get_limit(GTK_RECENT_CHOOSER(id_))
    end property

    property cname.limit( byval t as integer )
        gtk_recent_chooser_set_limit(GTK_RECENT_CHOOSER(id_),t)
    end property

    property cname.showTips() as gboolean
        return gtk_recent_chooser_get_show_tips(GTK_RECENT_CHOOSER(id_))
    end property

    property cname.showTips( byval t as gboolean )
        gtk_recent_chooser_set_show_tips(GTK_RECENT_CHOOSER(id_),t)
    end property

    property cname.sortType() as GtkRecentSortType
        return gtk_recent_chooser_get_sort_type(GTK_RECENT_CHOOSER(id_))
    end property

    property cname.sortType( byval t as GtkRecentSortType )
        gtk_recent_chooser_set_sort_type(GTK_RECENT_CHOOSER(id_),t)
    end property

    property cname.currentURI() as string
        return *gtk_recent_chooser_get_current_uri(GTK_RECENT_CHOOSER(id_))
    end property

    property cname.currentURI( byref u as string )
        gtk_recent_chooser_set_current_uri(GTK_RECENT_CHOOSER(id_),u,0)
    end property

    property cname.currentItem() as TGtkRecentInfo
        return TGtkRecentInfo(gtk_recent_chooser_get_current_item(GTK_RECENT_CHOOSER(id_)))
    end property

    sub cname.addGlobFilter( byref g as string )
        var f = gtk_recent_chooser_get_filter(GTK_RECENT_CHOOSER(id_))
        if f = 0 then
            f = gtk_recent_filter_new()
            gtk_recent_chooser_set_filter(GTK_RECENT_CHOOSER(id_),f)
        end if
        gtk_recent_filter_add_pattern(f,g)
    end sub

    sub cname.addAgeFilter( byref max_days as integer )
        var f = gtk_recent_chooser_get_filter(GTK_RECENT_CHOOSER(id_))
        if f = 0 then
            f = gtk_recent_filter_new()
            gtk_recent_chooser_set_filter(GTK_RECENT_CHOOSER(id_),f)
        end if
        gtk_recent_filter_add_age(f,max_days)
    end sub

    sub cname.addMimeFilter( byref m as string )
        var f = gtk_recent_chooser_get_filter(GTK_RECENT_CHOOSER(id_))
        if f = 0 then
            f = gtk_recent_filter_new()
            gtk_recent_chooser_set_filter(GTK_RECENT_CHOOSER(id_),f)
        end if
        gtk_recent_filter_add_mime_type(f,m)
    end sub

    sub cname.removeFilters()
        var f = gtk_recent_chooser_get_filter(GTK_RECENT_CHOOSER(id_))
        if f <> 0 then
            gtk_recent_chooser_remove_filter(GTK_RECENT_CHOOSER(id_),f)
        end if
    end sub
#endmacro
