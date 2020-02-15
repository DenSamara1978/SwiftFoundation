import Cocoa


//
// Поиск корней квадратного уравнения
//
print ( "Решение квадратного уравнения." )

// Исходные коэффициенты
let a = 4.0
let b = 2.0
let c = -2.0

// Решение
let d : Double = b * b - 4 * a * c
if d < 0
{
    print ( "Уравнение не имеет действительных корней." )
}
else if d == 0
{
    let r = -b
    print ( "Корень уравнения " + String ( r ))
}
else
{
    let r1 = -b - sqrt ( d )
    let r2 = -b + sqrt ( d )
    print ( "Корни уравнения " + String ( r1 ) + " и " + String ( r2 ))
}

//
// Нахождение параметров прямоугольного треугольника
//
print ( "\nНахождение параметров прямоугольного треугольника." )

let catet1 = 2.0
let catet2 = 4.0

let s = catet1 * catet2 * 0.5
let hypotenusus = sqrt ( catet1 * catet1 + catet2 * catet2 )
let p = catet1 + catet2 + hypotenusus

print ( "Гипотенуза " + String ( hypotenusus ))
print ( "Периметр " + String ( p ))
print ( "Площадь " + String ( s ))

//
// Расчет финансового результата инвестиций
//
print ( "\nРасчет финансового результата инвестиций." )

let startAmount = 100000.0
let depositPercent = 5.29

var amount = startAmount * ( 1 + depositPercent / 100 ) // Депозит на конец 1 года
amount = amount * ( 1 + depositPercent / 100 ) // Депозит на конец 2 года
amount = amount * ( 1 + depositPercent / 100 ) // Депозит на конец 3 года
amount = amount * ( 1 + depositPercent / 100 ) // Депозит на конец 4 года
amount = amount * ( 1 + depositPercent / 100 ) // Депозит на конец 5 года
print ( "Сумма в начале срока размещения " + String ( startAmount ))
print ( "Сумма к концу срока размещения в 5 лет при проценте " + String ( depositPercent ) + " составит " + String ( amount ))
