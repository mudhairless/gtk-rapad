#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkImage)

    constructor TGtkImage()
        id_ = gtk_image_new()
        init()
    end constructor
    
    constructor TGtkImage( byref filen_ as string )
        id_ = gtk_image_new_from_file(filen_)
        init()
    end constructor
    
    constructor TGtkImage( byval pb as GdkPixbuf ptr )
        id_ = gtk_image_new_from_pixbuf(pb)
        init()
    end constructor

    constructor TGtkImage( byval im as GdkImage ptr, byval bm as GdkBitmap ptr )
        id_ = gtk_image_new_from_image(im,bm)
        init()
    end constructor

    constructor TGtkImage( byval pm as GdkPixmap ptr, byval bm as GdkBitmap ptr )
        id_ = gtk_image_new_from_pixmap(pm,bm)
        init()
    end constructor
    
    constructor TGtkImage( byref stock_n as string, byval s as GtkIconSize )
        id_ = gtk_image_new_from_stock(stock_n,s)
        init()
    end constructor
    
    constructor TGtkImage( byval ics as GtkIconSet ptr, byval s as GtkIconSize )
        id_ = gtk_image_new_from_icon_set(ics,s)
        init()
    end constructor
    
    constructor TGtkImage( byval ic as GIcon ptr, byval s as GtkIconSize )
        id_ = gtk_image_new_from_gicon(ic,s)
        init()
    end constructor
    
    constructor TGtkImage( byval anim as GdkPixbufAnimation ptr )
        id_ = gtk_image_new_from_animation(anim)
        init()
    end constructor

    sub TGtkImage.setFromFile( byref filen_ as string )
        gtk_image_set_from_file(GTK_IMAGE(id_),filen_)
    end sub
    
    sub TGtkImage.setFromPixbuf( byval pb as GdkPixbuf ptr )
        gtk_image_set_from_pixbuf(GTK_IMAGE(id_),pb)
    end sub

    sub TGtkImage.setFromImage( byval im as GdkImage ptr, byval bm as GdkBitmap ptr )
        gtk_image_set_from_image(GTK_IMAGE(id_),im,bm)
    end sub

    sub TGtkImage.setFromPixmap( byval pm as GdkPixmap ptr, byval bm as GdkBitmap ptr )
        gtk_image_set_from_pixmap(GTK_IMAGE(id_),pm,bm)
    end sub
    
    sub TGtkImage.setFromStock( byref stock_n as string, byval s as GtkIconSize )
        gtk_image_set_from_stock(GTK_IMAGE(id_),stock_n,s)
    end sub
    
    sub TGtkImage.setFromIcon( byval ic as GIcon ptr, byval s as GtkIconSize )
        gtk_image_set_from_gicon(GTK_IMAGE(id_),ic,s)
    end sub
    
    sub TGtkImage.setFromIconSet( byval ics as GtkIconSet ptr, byval s as GtkIconSize )
        gtk_image_set_from_icon_set(GTK_IMAGE(id_),ics,s)
    end sub
    
    sub TGtkImage.setFromIconName( byref icn as string, byval s as GtkIconSize )
        gtk_image_set_from_icon_name(GTK_IMAGE(id_),icn,s)
    end sub
    
    sub TGtkImage.setFromAnimation( byval anim as GdkPixbufAnimation ptr )
        gtk_image_set_from_animation(GTK_IMAGE(id_),anim)
    end sub

    function TGtkImage.getPixbuf() as GdkPixbuf ptr
        return gtk_image_get_pixbuf(GTK_IMAGE(id_))
    end function
    
    function TGtkImage.getImage( byval bm as GdkBitmap ptr ptr ) as GdkImage ptr
        dim x as GdkImage ptr
        gtk_image_get_image(GTK_IMAGE(id_),@x,bm)
        return x
    end function
    
    function TGtkImage.getPixmap( byval bm as GdkBitmap ptr ptr ) as GdkPixmap ptr
        dim x as GdkPixmap ptr
        gtk_image_get_pixmap(GTK_IMAGE(id_),@x,bm)
        return x
    end function
    
    function TGtkImage.getStock( byref s as GtkIconSize ) as string
        dim x as zstring ptr
        var ret = ""
        gtk_image_get_stock(GTK_IMAGE(id_),@x,@s)
        ret = *x
        return ret
    end function
    
    function TGtkImage.getIcon( byref s as GtkIconSize ) as GIcon ptr
        dim x as GIcon ptr
        gtk_image_get_gicon(GTK_IMAGE(id_),@x,@s)
        return x
    end function
    
    function TGtkImage.getIconSet( byref s as GtkIconSize ) as GtkIconSet ptr
        dim x as GtkIconSet ptr
        gtk_image_get_icon_set(GTK_IMAGE(id_),@x,@s)
        return x
    end function
    
    function TGtkImage.getIconName( byref s as GtkIconSize ) as string
        dim x as zstring ptr
        var ret = ""
        gtk_image_get_icon_name(GTK_IMAGE(id_),@x,@s)
        ret = *x
        return ret
    end function
    
    function TGtkImage.getAnimation() as GdkPixbufAnimation ptr
        return gtk_image_get_animation(GTK_IMAGE(id_))
    end function

    sub TGtkImage.clear()
        gtk_image_clear(GTK_IMAGE(id_))
    end sub

    sub TGtkImage.setPixelSize( byval ns as integer )
        gtk_image_set_pixel_size(GTK_IMAGE(id_),ns)
    end sub

    function TGtkImage.getPixelSize( ) as integer
        return gtk_image_get_pixel_size(GTK_IMAGE(id_))
    end function

    function TGtkImage.getStorageType() as GtkImageType
        return gtk_image_get_storage_type(GTK_IMAGE(id_))
    end function

    operator TGtkImage.cast() as GtkWidget ptr
        return id_
    end operator

end namespace
