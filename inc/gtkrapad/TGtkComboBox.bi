namespace GtkRapad

type TGtkComboBox
    declare constructor
    declare constructor( byval w_entry as gboolean )
    declare constructor( byval model_ as GtkTreeModel ptr )
    declare constructor( byval model_ as GtkTreeModel ptr, byval w_entry as gboolean )
    declare constructor( byval i as GtkComboBox ptr )

    declare property wrapWidth() as integer
    declare property wrapWidth( byval i as integer )

    declare property rowSpanCol() as integer
    declare property rowSpanCol( byval i as integer )

    declare property colSpanCol() as integer
    declare property colSpanCol( byval i as integer )

    declare property active() as integer
    declare property active( byval i as integer )

    declare property model() as GtkTreeModel ptr
    declare property model( byval i as GtkTreeModel ptr )

    declare property addTearoffs() as gboolean
    declare property addTearoffs( byval t as gboolean )

    declare property title() as string
    declare property title( byref t as string )

    declare property focusOnClick() as gboolean
    declare property focusOnClick( byval t as gboolean )

    declare property hasEntry() as gboolean

    declare property entryTextColumn() as integer
    declare property entryTextColumn( byval i as integer )

    declare property buttonSensitivity() as GtkSensitivityType
    declare property buttonSensitivity( byval t as GtkSensitivityType )

    declare operator cast() as GtkWidget ptr
    DECLARE_COMMON_FUNCS()
    COMMON_MEMBERS()
end type

end namespace
