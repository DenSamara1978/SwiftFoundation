import Cocoa

enum EngineStatus
{
    case stopped
    case started
}

enum MachineAction
{
    case startEngine
    case stopEngine
    case turboEngine
    case openWindows
    case closeWindows
    case loadCargo
    case unloadCargo
}

class Automobile
{
    private var brand: String
    private var producedYear: Int
    private var engineStatus: EngineStatus = .stopped
    private var windowsOpened: Bool = false
    
    init ( brand: String, producedYear: Int )
    {
        self.brand = brand
        self.producedYear = producedYear
    }
    
    public func action ( action: MachineAction )
    {
        switch ( action )
        {
        case .startEngine:
            startEngine ()
        case .stopEngine:
            stopEngine ()
        case .openWindows:
            windowsOpened = true
        case .closeWindows:
            windowsOpened = false
        default: break
        }
    }
    
    public func startEngine ()
    {
        engineStatus = EngineStatus.started
    }
    
    public func stopEngine ()
    {
        engineStatus = EngineStatus.stopped
    }
    
    public func printInstance ()
    {
        print ( "Марка: \(brand)" )
        print ( "Год выпуска: \(producedYear)" )
        print ( "Открыты окна: \(windowsOpened)" )
        print ( "Состояние двигателя: \(engineStatus)" )
    }
}

class Truck : Automobile
{
    private var hasCargo = false
        
    override init ( brand: String, producedYear: Int )
    {
        super.init ( brand: brand, producedYear: producedYear )
    }
        
    override func action ( action: MachineAction )
    {
        switch ( action )
        {
        case .loadCargo:
            hasCargo = true
        case .unloadCargo:
            hasCargo = false
        default:
            super.action(action: action )
        }
    }
    
    override func printInstance ()
    {
        super.printInstance()
        print ( "Загружен: \(hasCargo)" )
    }
}

class SportCar : Automobile
{
    var isEngineTurbed = false
    
    override init ( brand: String, producedYear: Int )
    {
        super.init ( brand: brand, producedYear: producedYear )
    }
        
    override func action ( action: MachineAction )
    {
        switch ( action )
        {
        case .turboEngine:
            isEngineTurbed = true
        case .stopEngine:
            isEngineTurbed = false
            fallthrough
        default:
            super.action(action: action )
        }
    }

    override func printInstance ()
    {
        super.printInstance()
        print ( "Турбирован: \(isEngineTurbed)" )
    }
}


var truck = Truck ( brand: "Volvo", producedYear: 1999 )
truck.action(action: .startEngine)
truck.action(action: .loadCargo)

var car = SportCar ( brand: "ВАЗ-2101", producedYear: 1974)
car.action ( action: .openWindows)
car.action(action: .startEngine)
car.action(action: .turboEngine)

truck.printInstance()
print ()
car.printInstance()

