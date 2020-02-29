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

protocol Automobilable : class
{
    var brand: String {get set}
    var producedYear: Int {get set}
    var engineStatus: EngineStatus {get set}
    var windowsOpened: Bool {get set}

    func action ( action: MachineAction )
}

extension Automobilable
{
    func generalAction ( action: MachineAction )
    {
        switch action {
        case .openWindows:
            openWindow ()
        case .closeWindows:
            closeWindow ()
        case .startEngine:
            startEngine ()
        case .stopEngine:
            stopEngine ()
        default:
            return
        }
    }
    
    func openWindow () { windowsOpened = true }
    func closeWindow () { windowsOpened = false }
    func startEngine () { engineStatus = .started }
    func stopEngine () { engineStatus = .stopped }
}

class Truck: Automobilable, CustomStringConvertible
{
    var brand: String
    var producedYear: Int
    var engineStatus: EngineStatus
    var windowsOpened: Bool
    
    private var hasCargo = false
        
    init ( brand: String, producedYear: Int )
    {
        self.brand = brand
        self.producedYear = producedYear
        self.engineStatus = .stopped
        self.windowsOpened = false
    }
        
    func action ( action: MachineAction )
    {
        switch ( action )
        {
        case .loadCargo:
            hasCargo = true
        case .unloadCargo:
            hasCargo = false
        default:
            generalAction(action: action )
        }
    }
    
    var description: String
    {
        "Марка: \(brand)\n" +
        "Год выпуска: \(producedYear)\n" +
        "Открыты окна: \(windowsOpened)\n" +
        "Состояние двигателя: \(engineStatus)\n" +
        "Загружен: \(hasCargo)\n"
    }
}

class SportCar: Automobilable, CustomStringConvertible
{
    var isEngineTurbed = false
    
    init ( brand: String, producedYear: Int )
    {
        self.brand = brand
        self.producedYear = producedYear
        self.engineStatus = .stopped
        self.windowsOpened = false
    }

    var brand: String
    var producedYear: Int
    var engineStatus: EngineStatus
    var windowsOpened: Bool
    func action(action: MachineAction) {
        switch action{
            case .turboEngine:
                isEngineTurbed = true
            case .stopEngine:
                isEngineTurbed = false
                fallthrough
            default:
                generalAction(action: action )
        }
    }
    
    var description: String
    {
        "Марка: \(brand)\n" +
        "Год выпуска: \(producedYear)\n" +
        "Открыты окна: \(windowsOpened)\n" +
        "Состояние двигателя: \(engineStatus)\n" +
        "Турбирован: \(isEngineTurbed)\n"
    }

}




var truck = Truck ( brand: "Volvo", producedYear: 1999 )
truck.action(action: .startEngine)
truck.action(action: .loadCargo)

var car = SportCar ( brand: "ВАЗ-2101", producedYear: 1974)
car.action ( action: .openWindows)
car.action(action: .startEngine)
car.action(action: .turboEngine)

print ( truck )
print ()
print ( car )

