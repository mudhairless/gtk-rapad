namespace GtkRapad

type TGtkProgressBar

    declare constructor
    
    declare sub pulse()
    declare sub setPulseStep( byval v as double )
    declare function getPulseStep() as double

    declare sub setText( byref t as string )
    declare function getText() as string

    declare sub setFraction( byval v as double )
    declare function getFraction() as double

    declare sub setOrientation( byval d as GtkProgressBarOrientation )
    declare function getOrientation() as GtkProgressBarOrientation

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
