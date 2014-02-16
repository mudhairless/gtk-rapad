#ifndef RAPAD_NO_SOURCEVIEW

#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkSourceLanguageManager
        id_ = gtk_source_language_manager_get_default()
        if id_ = null then
            id_ = gtk_source_language_manager_new()
        end if
    end constructor

    property TGtkSourceLanguageManager.searchPath() as zstring ptr ptr
        return gtk_source_language_manager_get_search_path(id_)
    end property

    property TGtkSourceLanguageManager.searchPath( byval v as zstring ptr ptr )
        gtk_source_language_manager_set_search_path(id_,v)
    end property

    property TGtkSourceLanguageManager.langIDs() as zstring ptr ptr
        return gtk_source_language_manager_get_language_ids(id_)
    end property

    function TGtkSourceLanguageManager.getLanguage(byref id as string) as GtkSourceLanguage ptr
        return gtk_source_language_manager_get_language(id_,id)
    end function

    function TGtkSourceLanguageManager.guessLanguage(byref fn as string, byref mimetype as string ) as GtkSourceLanguage ptr
        return gtk_source_language_manager_guess_language(id_,fn,mimetype)
    end function

end namespace

#endif
