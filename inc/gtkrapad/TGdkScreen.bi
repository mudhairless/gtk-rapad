'
'   TGdkScreen.bi
'
'   A simple screen object to obtain geometry.
'

namespace GtkRapad

    type TGdkScreen

        public:
            declare constructor()
            declare operator cast() as GdkScreen pointer

            declare function GetHeight() as integer
            declare function GetWidth() as integer

        private:
            id_ as GdkScreen pointer        'pointer to this object
    end type

end namespace
