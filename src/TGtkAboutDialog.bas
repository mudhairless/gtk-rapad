#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkAboutDialog)

    DIALOG_COMMON(TGtkAboutDialog)

    constructor TGtkAboutDialog
        id_ = gtk_about_dialog_new()
        init()
    end constructor

    operator TGtkAboutDialog.cast() as GtkWidget ptr
        return id_
    end operator

    property TGtkAboutDialog.programName() as string
        return *gtk_about_dialog_get_program_name(GTK_ABOUT_DIALOG(id_))
    end property

    property TGtkAboutDialog.programName( byref n as string )
        gtk_about_dialog_set_program_name(GTK_ABOUT_DIALOG(id_),n)
    end property

    property TGtkAboutDialog.version() as string
        return *gtk_about_dialog_get_version(GTK_ABOUT_DIALOG(id_))
    end property

    property TGtkAboutDialog.version( byref n as string )
        gtk_about_dialog_set_version(GTK_ABOUT_DIALOG(id_),n)
    end property

    property TGtkAboutDialog.copyright() as string
        return *gtk_about_dialog_get_copyright(GTK_ABOUT_DIALOG(id_))
    end property

    property TGtkAboutDialog.copyright( byref c as string )
        gtk_about_dialog_set_copyright(GTK_ABOUT_DIALOG(id_),c)
    end property

    property TGtkAboutDialog.comments() as string
        return *gtk_about_dialog_get_comments(GTK_ABOUT_DIALOG(id_))
    end property

    property TGtkAboutDialog.comments( byref c as string )
        gtk_about_dialog_set_comments(GTK_ABOUT_DIALOG(id_),c)
    end property

    property TGtkAboutDialog.license() as string
        return *gtk_about_dialog_get_license(GTK_ABOUT_DIALOG(id_))
    end property

    property TGtkAboutDialog.license( byref l as string )
        gtk_about_dialog_set_license(GTK_ABOUT_DIALOG(id_),l)
    end property

    property TGtkAboutDialog.wrap() as gboolean
        return gtk_about_dialog_get_wrap_license(GTK_ABOUT_DIALOG(id_))
    end property

    property TGtkAboutDialog.wrap( byval t as gboolean )
        gtk_about_dialog_set_wrap_license(GTK_ABOUT_DIALOG(id_),t)
    end property

    property TGtkAboutDialog.website() as string
        return *gtk_about_dialog_get_website(GTK_ABOUT_DIALOG(id_))
    end property

    property TGtkAboutDialog.website( byref w as string )
        gtk_about_dialog_set_website(GTK_ABOUT_DIALOG(id_),w)
    end property

    property TGtkAboutDialog.websiteLabel() as string
        return *gtk_about_dialog_get_website_label(GTK_ABOUT_DIALOG(id_))
    end property

    property TGtkAboutDialog.websiteLabel( byref l as string )
        gtk_about_dialog_set_website_label(GTK_ABOUT_DIALOG(id_),l)
    end property

    property TGtkAboutDialog.authors() as const gchar const ptr ptr
        return gtk_about_dialog_get_authors(GTK_ABOUT_DIALOG(id_))
    end property

    property TGtkAboutDialog.authors( byval a as const gchar ptr ptr )
        gtk_about_dialog_set_authors(GTK_ABOUT_DIALOG(id_),a)
    end property

    property TGtkAboutDialog.artists() as const gchar const ptr ptr
        return gtk_about_dialog_get_artists(GTK_ABOUT_DIALOG(id_))
    end property

    property TGtkAboutDialog.artists( byval a as const gchar ptr ptr )
        gtk_about_dialog_set_artists(GTK_ABOUT_DIALOG(id_),a)
    end property

    property TGtkAboutDialog.documenters() as const gchar const ptr ptr
        return gtk_about_dialog_get_documenters(GTK_ABOUT_DIALOG(id_))
    end property

    property TGtkAboutDialog.documenters( byval d as const gchar ptr ptr )
        gtk_about_dialog_set_documenters(GTK_ABOUT_DIALOG(id_),d)
    end property

    property TGtkAboutDialog.translatorCredits() as string
        return *gtk_about_dialog_get_translator_credits(GTK_ABOUT_DIALOG(id_))
    end property

    property TGtkAboutDialog.translatorCredits( byref t as string )
        gtk_about_dialog_set_translator_credits(GTK_ABOUT_DIALOG(id_),t)
    end property

    property TGtkAboutDialog.logo() as GdkPixbuf ptr
        return gtk_about_dialog_get_logo(GTK_ABOUT_DIALOG(id_))
    end property

    property TGtkAboutDialog.logo( byval l as GdkPixbuf ptr )
        gtk_about_dialog_set_logo(GTK_ABOUT_DIALOG(id_),l)
    end property

    property TGtkAboutDialog.logoIconName() as string
        return *gtk_about_dialog_get_logo_icon_name(GTK_ABOUT_DIALOG(id_))
    end property

    property TGtkAboutDialog.logoIconName( byref l as string )
        gtk_about_dialog_set_logo_icon_name(GTK_ABOUT_DIALOG(id_),l)
    end property

end namespace
