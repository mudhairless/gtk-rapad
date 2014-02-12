namespace GtkRapad

type TGtkAdjustment
    declare constructor
    declare constructor ( byval x as any ptr )

    declare property value () as double
    declare property value( byval rhs as double )
    declare property lower () as double
    declare property lower( byval rhs as double )
    declare property upper () as double
    declare property upper( byval rhs as double )
    declare property stepIncrement() as double
    declare property stepIncrement( byval rhs as double )
    declare property pageIncrement( ) as double
    declare property pageIncrement( byval rhs as double )
    declare property pageSize( ) as double
    declare property pageSize( byval rhs as double )

    declare function connect(byref signal as string,byval func as GtkGenericCallback, byval fd as any ptr = 0 ) as uinteger

    declare operator cast() as GtkObject ptr
private:
    id_ as GtkAdjustment ptr
end type

type TGtkScrollable
    declare constructor()

    declare sub setParent( byval p as GtkWidget ptr )
    declare sub setScrollBarPolicy( byval h as GtkPolicyType, byval v as GtkPolicyType )
    declare sub setSize(byval w_ as integer = -1, byval h_ as integer = -1)

    declare sub Associate( byval p as GtkWidget pointer )
    declare sub Destroy()
    declare sub Hide()
    declare sub HideAll()
    declare sub Show()
    declare sub ShowAll()

    declare function GetParent() as GtkWidget pointer
    declare sub SetName( byref newName as string )
    declare function GetName() as string

    declare function getHadjustment() as TGtkAdjustment ptr
    declare function getVadjustment() as TGtkAdjustment ptr

    declare function connect(byref signal as string,byval func as GtkGenericCallback, byval fd as any ptr = 0 ) as uinteger
    
    declare operator cast() as GtkWidget ptr
    declare destructor
    private:
    hadj_ as TGtkAdjustment ptr
    vadj_ as TGtkAdjustment ptr
    gtype_ as string
    objname_ as string
    parent_ as GtkWidget ptr
    id_ as GtkWidget ptr
end type

end namespace
