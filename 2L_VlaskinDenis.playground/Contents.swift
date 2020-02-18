import Cocoa

// 1

func isEven ( _ arg: Int ) -> Bool
{
    return arg % 2 == 0
}

print ( "2 четное? " + String ( isEven ( 2 )))
print ( "5 четное? " + String ( isEven ( 5 )))
print ()

// 2

func isThreeDividable ( _ arg: Int ) -> Bool
{
    return arg % 3 == 0
}

print ( "3 делится на 3? " + String ( isThreeDividable ( 3 )))
print ( "7 делится на 3? " + String ( isThreeDividable ( 7 )))
print ()

// 3

var arr = Array ( 0...99 )

// 4

for index in stride ( from: 99, through: 0, by: -1 )
{
    if isEven ( arr [index]) || !isThreeDividable ( arr [index] )
    {
        arr.remove ( at: index )
    }
}
print ( arr )
print ()

// 5

func fibonacci ( _ arr: inout [Decimal] )
{
    if ( arr.count < 2 )
    {
        arr.append ( 1 )
    }
    else
    {
        arr.append ( arr.last! + arr [arr.count - 2] )
    }
}

var fibArr : [Decimal] = []
for _ in 0...99
{
    fibonacci ( &fibArr )
}
print ( fibArr )
print ()

// 6 - упростил, происходит последовательное заполнение

func nextSimple ( _ cur: Int ) -> Int
{
    if cur == 0
    {
        return 1
    }
    else
    {
        var number = cur + 1
        while ( true )
        {
            var isSimple = true
            for num in 2..<number
            {
                if number % num == 0
                {
                    isSimple = false
                    break
                }
            }
            if isSimple
            {
                return number
            }
            number += 1
        }
    }
}

var arrSimple: [Int] = []
for _ in 0...99
{
    arrSimple.append ( nextSimple ( arrSimple.last ?? 0 ))
}
print ( arrSimple )
