// Попробовал совместить два пункта ТЗ в одном классе, надеюсь верно понял ТЗ

enum CoffeeType
{
    case Americano
    case Capuccino
}

struct CoffeeData
{
    let type: CoffeeType
    let coffeeBeans: Float
    let water: Float
    let milk: Float
}

enum CoffeeMachineError: Error
{
    case invalidSelection
    case outOfCoffeeBeans
    case outOfWater
    case outOfMilk
}

class CoffeeMachine
{
    private var coffeeBeans: Float
    private var water: Float
    private var milk: Float
    
    var coffeeKind = [
        "Americano": CoffeeData (type: .Americano, coffeeBeans: 2.0, water: 3.0, milk: 0.0 ),
        "Capuccino": CoffeeData (type: .Capuccino, coffeeBeans: 1.0, water: 1.5, milk: 1.0 )
    ]
    
    init ()
    {
        coffeeBeans = 0.0
        water = 0.0
        milk = 0.0
    }
    
    func addwater ( _ amount: Float )
    {
        if amount > 0.0
        {
            water += amount;
        }
    }
    
    func addCoffeeBeans ( _ amount: Float )
    {
        if amount > 0.0
        {
            coffeeBeans += amount;
        }
    }
    
    func addMilk ( _ amount: Float )
    {
        if amount > 0.0
        {
            milk += amount
        }
    }
    
    func makeCup ( _ type: String ) throws -> CoffeeType
    {
        guard let data = coffeeKind [type] else
        {
            throw CoffeeMachineError.invalidSelection
        }
        guard data.coffeeBeans <= coffeeBeans else
        {
            throw CoffeeMachineError.outOfCoffeeBeans
        }
        guard data.water <= water else
        {
            throw CoffeeMachineError.outOfWater
        }
        guard data.milk <= milk else
        {
            throw CoffeeMachineError.outOfMilk
        }
        water -= data.milk
        coffeeBeans -= data.coffeeBeans
        milk -= data.milk
        print ( "Приготовлен напиток: \(type)" )
        return data.type
    }
}

let cm = CoffeeMachine ()
cm.addMilk(1.0)
cm.addwater(3.0)
cm.addCoffeeBeans(0.0)
do {
    try cm.makeCup("Americano")
} catch CoffeeMachineError.invalidSelection {
    print ( "Неверный тип напитка" )
} catch CoffeeMachineError.outOfCoffeeBeans {
    print ( "Не хватает кофейных зерен" )
} catch CoffeeMachineError.outOfWater {
    print ( "Не хватает воды" )
} catch CoffeeMachineError.outOfMilk {
    print ( "Не хватает молока" )
}
