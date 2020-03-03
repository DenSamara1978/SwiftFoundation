class Queue<T>
{
    private var elements: [T] = []
    
    public init ()
    {
    }
    
    public func push ( _ element: T )
    {
        elements.append ( element )
    }
    
    public func pop () -> T?
    {
        if ( elements.count == 0 )
        {
            return nil
        }
        let popElement = elements [0]
        elements.remove(at: 0)
        return popElement
    }
    
    public subscript ( _ index: Int ) -> T?
    {
        return ( index < elements.count ) ? elements [index] : nil
    }
    
    public func firstSeekedDoubler ( _ value: T, _ lyambda: ( _ first: T, _ second: T ) -> Bool )
    {
        for index in stride ( from: 0, through: elements.count - 1, by: 1 )
        {
            if ( lyambda ( value, elements [index] ))
            {
                self.push ( elements [index] )
                return
            }
        }
    }
}

var queue = Queue<Int> ()


queue.push ( 1 )
queue.push ( 2 )
queue.push ( 3 )

print ( queue [1] ?? "nil" )
print ( queue [10] ?? "nil" )

let closure = { ( first: Int, second: Int ) -> Bool in first == second }

queue.firstSeekedDoubler ( 2, closure )
queue.firstSeekedDoubler ( 4, closure )
queue.firstSeekedDoubler ( 1, closure )

print ( queue.pop () ?? "nil")
print ( queue.pop () ?? "nil")
print ( queue.pop () ?? "nil")
print ( queue.pop () ?? "nil")
print ( queue.pop () ?? "nil")
print ( queue.pop () ?? "nil")

