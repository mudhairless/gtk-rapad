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
    
    function TGtkImage.getStorageType() as GtkImageType
        return gtk_image_get_storage_type(GTK_IMAGE(id_))
    end function

    operator TGtkImage.cast() as GtkWidget ptr
        return id_
    end operator

end namespace
