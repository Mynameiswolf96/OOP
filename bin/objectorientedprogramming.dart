import 'package:objectorientedprogramming/objectorientedprogramming.dart' as objectorientedprogramming;

//пример использования интерфейсов
abstract interface class Action {
  void move();

  void age();

  void say();
}

class Cat implements Action {
  String sayCat;
  int ageCat;
  String moveCat;

  Cat(this.sayCat, this.moveCat, this.ageCat);

  @override
  void move() {
    print(moveCat);
  }

  @override
  void age() {
    print(ageCat);
  }

  @override
  void say() {
    print(sayCat);
  }
}

class Man extends Action {
  String sayMan;
  int ageMan;
  String moveMan;

  Man(this.sayMan, this.moveMan, this.ageMan);

  @override
  void move() {
    print(moveMan);
  }

  @override
  void age() {
    print(ageMan);
  }

  @override
  void say() {
    print(sayMan);
  }
}

class Sparrow extends Action {
  String saySparrow;
  int ageSparrow;
  String moveSparrow;

  Sparrow(this.saySparrow, this.moveSparrow, this.ageSparrow);

  @override
  void move() {
    print(moveSparrow);
  }

  @override
  void age() {
    print(ageSparrow);
  }

  @override
  void say() {
    print(saySparrow);
  }
}

//пример использования абстрактого класса
abstract class Human {
  void say();

  void years();
}

class Child extends Human {
  int age;
  String babySay;

  Child(this.age, this.babySay);

  @override
  void say() {
    print(babySay);
  }

  @override
  void years() {
    if (age > 0 || age < 12) {
      print("Child");
    } else {
      return;
    }
  }
}

class Adult extends Human {
  int age;
  String adultSay;
  List<int> monthlySalary;

  Adult(this.age, this.adultSay, this.monthlySalary);

  @override
  void say() {
    print(adultSay);
  }

  @override
  void years() {
    if (age > 30 || age < 60) {
      print("Human is adult, he's age: $age");
    } else {
      return;
    }
  }

  int yearSalary() {
    int earnedMoney = 0;
    for (int i = 0; i < monthlySalary.length; i++) {
      earnedMoney += monthlySalary[i];
    }
    return earnedMoney;
  }
}

//пример полиморфизма
class Person {
  String _firstName;
  String _lastName;
  int _age;

  Person(this._firstName, this._age, this._lastName, {String ls = ' '});

  void greeting() {
    print('привет, я человек и меня зовут $_firstName');
  }
}

class Employe extends Person {
  int _snils;
  int _number;

  Employe(
      this._number, this._snils, super._firstName, super._age, super._lastName);

  @override
  void greeting() {
    print(
        'привет, я работник и меня зовут $_firstName, моя фамилия $_lastName,мой возраст $_age и номер $_number');
  }
}

class Developer extends Employe {
  String _language;
  String _lvl;

  Developer(this._language, this._lvl, super._firstName, super._age,
      super._lastName, super._snils, super._number);

  void greeting() {
    print(
        'привет, я программист и меня зовут $_firstName, моя фамилия $_lastName, пишу на $_language,уровень $_lvl');
  }
}

//Пример принципа single responsibility
class Monkey {
  String name;
  int age;

  Monkey(this.age, this.name);

  @override
  String toString() {
// TODO: implement toString
    return 'Возраст мартышки $age, её зовут $name';
  }
}

class AgeCalculate extends Monkey {
// класс отвечает за перевод возраста мартышки в возраст других существ
  AgeCalculate(super.age, super.name);

  double ageTranslationToHuman(int age) {
    return age * 1.5;
  }
}

class PrintAgeOtherCreature extends AgeCalculate {
//класс отвечает за вывод результатов перевода возраста
  PrintAgeOtherCreature(super.age, super.name);

  double get ageCreature {
    return ageTranslationToHuman(age);
  }

  String get nameCreature {
    return name;
  }

  @override
  String toString() {
// TODO: implement toString
    return 'Человеку по имени $nameCreature будет $ageCreature';
  }
}

//Пример Open-Closed principe и Liskov Substitution
abstract class Shape {
  double getArea();
}

class Rectangle extends Shape {
  final double width;
  final double height;

  Rectangle({required this.width, required this.height});

  @override
  double getArea() {
    return width * height;
  }
}

class Square extends Shape {
  final double side;

  Square({required this.side});

  @override
  double getArea() {
    return side * side;
  }
}

class Circle extends Shape {
  final double radius;

  Circle({required this.radius});

  @override
  double getArea() {
    return 3.14 * radius * radius;
  }
}

class AreaCalculator {
  double calculateTotalArea(List<Shape> shapes) {
    double totalArea = 0;

    for (var shape in shapes) {
      totalArea += shape.getArea();
    }

    return totalArea;
  }
}

//Пример interface segregation principe.Тут продемонтсрировано разбиение интерфейса на маленькие, т.к. в моём примере нож не может иметь перезарядки.
abstract interface class Information {
  void printInformation();
}

abstract interface class Damage {
  int damage();
}

abstract interface class Recharge {
  void recharge();
}

class Knife implements Damage, Information {
  @override
  int damage() => 10;

  @override
  void printInformation() {
    print('Нож наносит $damageWeap');
  }

  int get damageWeap {
    return damage();
  }
}

class Gun implements Damage, Recharge, Information {
  @override
  void recharge() {
    print('Перезарядка');
  }

  @override
  int damage() => 15;

  @override
  void printInformation() {
    print('Оружее наносит $damageWeap');
  }

  int get damageWeap {
    return damage();
  }
}

//Пример Dependency inversion principe.
abstract class Animal {
  void eat();
}

class Kitty extends Animal {
  @override
  void eat() {
    print('Cat is eating');
  }
}

class Dog extends Animal {
  @override
  void eat() {
    print('Dog is eating');
  }
}

class Feeder {
  final Animal _animal;

  Feeder(this._animal);

  void giveFood() {
    _animal.eat();
  }
}

void main() {
//экземляры классов для примера работы с интерфейсами
  Sparrow sparrow = Sparrow("CHICKCHIRICK", "fly", 5);
  Man man = Man('Hi', 'walk', 40);
  man.age();
  man.say();
  man.move();
  sparrow.age();
  sparrow.move();
  sparrow.say();
  Adult adult = Adult(45, "HI",
      [1000, 1500, 1500, 2000, 1000, 1300, 2000, 4000, 3500, 1111, 2222, 3333]);
  print(adult.yearSalary());
  print(adult.adultSay);
  print(adult.age);
//экземпляры классов для примера работы с абстрактными классами
  Child child = Child(5, "MAAAAAAAAAAAM");
  print(child.babySay);
  print(child.age);
//экземпляры классов для примера работы с полиморфизмом
  int age = 40;
  Person person = Person("Valera", age, 'Klitor');
  Employe employe = Employe(1, 15, 'Vadis', age, 'Evteev');
  Developer developer = Developer("Dart", 'Junior', 23, 23, 'Zdor', 15, 'Den');
  List<Person> list = [person, employe, developer];
  messGreeting(list);
//экземпляры классов для примера single responsibility
  Monkey monkey = Monkey(20, 'Анфиса');
  PrintAgeOtherCreature printAgeOtherCreature =
  PrintAgeOtherCreature(10, "volkov");
  print(printAgeOtherCreature.toString());
//экземпляры классов для примера open-closed responsibility В этом примере, если мы хотим добавить новый тип фигуры, например, треугольник,
// мы можем создать новый класс Triangle, реализовать метод getArea() и добавить его в список shapes, без необходимости изменять код AreaCalculator
  Rectangle rectangle = Rectangle(width: 5, height: 10);
  Circle circle = Circle(radius: 7);

  List<Shape> shapes = [rectangle, circle];

  AreaCalculator areaCalculator = AreaCalculator();
  double totalArea = areaCalculator.calculateTotalArea(shapes);

  print('Total area: $totalArea');

//экземпляры классов для примера Liskov Substitution. В данном примере показано, что Rectangle и Square могут использоваться вместо
// Shape т.к. они корректно реализовывают унаследованный метод getArea.
  List<Shape> shapess = [Rectangle(width: 5, height: 10), Square(side: 7)];
  for (var shape in shapess) {
    printArea(shape);
  }
//экземпляры классов для примера interface segregation principle.
  Gun gun = Gun();
  gun.printInformation();
  Knife knife = Knife();
  knife.printInformation();
//экземерляры класса для примера Dependency inversion principle.класс Feeder зависит от абстракции Animal, а не от конкретных реализаций,
// таким образом, модули могут быть легко изменены или заменены новыми реализациями животных
 // без внесения изменений в класс Feeder.
  Animal cat = Kitty();
  Feeder catFeeder = Feeder(cat);
  catFeeder.giveFood();

  Animal dog = Dog();
  Feeder dogFeeder = Feeder(dog);
  dogFeeder.giveFood();
  }

//глобальная функция для примера Liskov Substitution
void printArea(Shape shape) {
  print('Area: ${shape.getArea()}');
}

void messGreeting(List<Person> list) {
//глобальная функция для примера работы полиморфизма
  for (int i = 0; i < list.length; i++) {
    Person person = list[i];
    person.greeting();
  }
}