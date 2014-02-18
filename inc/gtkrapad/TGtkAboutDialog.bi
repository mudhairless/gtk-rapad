namespace GtkRapad

type TGtkAboutDialog

    declare constructor
    declare operator cast() as GtkWidget ptr

    declare property programName() as string
    declare property programName( byref n as string )

    declare property version() as string
    declare property version( byref n as string )

    declare property copyright() as string
    declare property copyright( byref c as string )

    declare property comments() as string
    declare property comments( byref c as string )

    declare property license() as string
    declare property license( byref l as string )

    declare property wrap() as gboolean
    declare property wrap( byval t as gboolean )

    declare property website() as string
    declare property website( byref w as string )

    declare property websiteLabel() as string
    declare property websiteLabel( byref l as string )

    declare property authors() as const gchar const ptr ptr
    declare property authors( byval a as const gchar ptr ptr )

    declare property artists() as const gchar const ptr ptr
    declare property artists( byval a as const gchar ptr ptr )

    declare property documenters() as const gchar const ptr ptr
    declare property documenters( byval d as const gchar ptr ptr )

    declare property translatorCredits() as string
    declare property translatorCredits( byref t as string )

    declare property logo() as GdkPixbuf ptr
    declare property logo( byval l as GdkPixbuf ptr )

    declare property logoIconName() as string
    declare property logoIconName( byref l as string )

    DECLARE_DIALOG_COMMON()

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
