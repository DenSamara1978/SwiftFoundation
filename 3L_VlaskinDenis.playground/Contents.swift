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
    case openWindows
    case closeWindows
    case loadUnifyItem
    case unloadUnifyItem
}

let unifyBaggageItem = 5.0

struct Car
{
    var brand: String
    var producedYear: Int
    var baggageVolume: Double
    var engineStatus: EngineStatus = .stopped
    var windowsOpened: Bool = false
    var baggageVolumeBusy: Double = 0.0
    
    init ( brand: String, producedYear: Int, baggageVolume: Double )
    {
        self.brand = brand
        self.producedYear = producedYear
        self.baggageVolume = baggageVolume
    }
    
    mutating func action ( action: MachineAction )
    {
        switch ( action )
        {
        case .startEngine:
            engineStatus = EngineStatus.started
        case .stopEngine:
            engineStatus = EngineStatus.stopped
        case .openWindows:
            windowsOpened = true
        case .closeWindows:
            windowsOpened = false
        case .loadUnifyItem:
            baggageVolumeBusy += unifyBaggageItem
            if ( baggageVolumeBusy > baggageVolume )
            {
                baggageVolumeBusy = baggageVolume
            }
        case .unloadUnifyItem:
            baggageVolumeBusy -= unifyBaggageItem
            if ( baggageVolumeBusy < 0.0 )
            {
                baggageVolumeBusy = 0.0
            }
        }
    }
}

struct Truck
{
    var brand: String
    var producedYear: Int
    var baggageVolume: Double
    var engineStatus: EngineStatus = .stopped
    var windowsOpened: Bool = false
    var baggageVolumeBusy: Double = 0.0
        
    init ( brand: String, producedYear: Int, baggageVolume: Double )
    {
        self.brand = brand
        self.producedYear = producedYear
        self.baggageVolume = baggageVolume
    }
        
    mutating func action ( action: MachineAction )
    {
        switch ( action )
        {
        case .startEngine:
            engineStatus = EngineStatus.started
        case .stopEngine:
            engineStatus = EngineStatus.stopped
        case .openWindows:
            windowsOpened = true
        case .closeWindows:
            windowsOpened = false
        case .loadUnifyItem:
            baggageVolumeBusy += unifyBaggageItem
            if ( baggageVolumeBusy > baggageVolume )
            {
               baggageVolumeBusy = baggageVolume
            }
        case .unloadUnifyItem:
            baggageVolumeBusy -= unifyBaggageItem
            if ( baggageVolumeBusy < 0.0 )
            {
                baggageVolumeBusy = 0.0
            }
        }
    }
}

var truck = Truck ( brand: "Volvo", producedYear: 1999, baggageVolume: 10_000 )
truck.action(action: .startEngine)
truck.action(action: .loadUnifyItem)

var car = Car ( brand: "ВАЗ-2101", producedYear: 1974, baggageVolume: 150 )
car.action ( action: .openWindows)
car.action(action: .startEngine)
car.action(action: .unloadUnifyItem)
car.action(action: .stopEngine)

print ( truck )
print ( car )

