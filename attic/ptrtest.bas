

type XButton
    public:
        declare constructor()
        declare operator cast() as integer pointer
        declare function TestMe() as string

    private:
        id_ as integer pointer
end type

constructor XButton
    dim x as integer

    x = 100

    id_ = @x
end constructor

operator XButton.cast() as integer pointer
    return id_
end operator

function XButton.TestMe() as string
    return "TEST!"
end function

'--------------------------------------------------------------

const objCount          as integer = 15
dim ButtonArray         as XButton pointer

ButtonArray = Allocate(objCount * SizeOf( XButton ))

If (0 = ButtonArray) Then
    Print "Error: unable to allocate memory, quitting."
    End -1
End If

print ButtonArray[0].TestMe()

deallocate( ButtonArray )

End 0
