namespace GtkRapad

    type TGtkListView
        public:
            col_count_ as integer

            declare constructor()

            'If you want to have more than 1 column this must be called first
            declare sub setColumnTypes( columns() as integer )

            declare operator cast() as GtkWidget pointer

            declare sub appendRow()
            declare sub Add overload( byval sText as string, byval col_n as integer = 0 )
            declare sub Add ( byval sDbl as double, byval col_n as integer = 0 )
            declare sub Add ( byval sFlt as single, byval col_n as integer = 0 )
            declare sub Add ( byval sUll as ulongint, byval col_n as integer = 0 )
            declare sub Add ( byval sLL as longint, byval col_n as integer = 0 )
            declare sub Add ( byval suL as ulong, byval col_n as integer = 0 )
            declare sub Add ( byval sLng as long, byval col_n as integer = 0 )
            declare sub Add ( byval sUint as uinteger, byval col_n as integer = 0 )
            declare sub Add ( byval sInt as integer, byval col_n as integer = 0 )
            declare sub Add ( byval sUbyte as ubyte, byval col_n as integer = 0 )
            declare sub Add ( byval sByte as byte, byval col_n as integer = 0 )
            declare sub AddBool ( byval sBool as gboolean, byval col_n as integer = 0 )
            declare sub Add ( byval sPtr as any ptr, byval col_n as integer = 0 )

            declare sub setColumnTitle( byval col_n as integer, byref sText as string )
            declare function getColumnTitle( byval col_n as integer ) as string

            DECLARE_COMMON_FUNCS()

        private:
            iter_ as GtkTreeIter            'an iter (or iteration) is a row within a colunm
            model_ as GtkListStore pointer  'Our list of data
            COMMON_MEMBERS()
    end type

end namespace
