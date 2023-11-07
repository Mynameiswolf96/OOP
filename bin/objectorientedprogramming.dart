import 'package:objectorientedprogramming/objectorientedprogramming.dart'
    as objectorientedprogramming;
import 'package:test/test.dart';

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

class Man implements Action {
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

class Sparrow implements Action {
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

  int get ageBaby => age;

  @override
  void years() {
    print(ageBaby);
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

  int get ageAdult => age;

  @override
  void years() {
    print(age);
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
    this._number,
    this._snils,
    super._firstName,
    super._age,
    super._lastName,
  );

  @override
  void greeting() {
    print(
        'привет, я работник и меня зовут $_firstName, моя фамилия $_lastName,мой возраст $_age и номер $_number');
  }
}

class Developer extends Employe {
  String _language;
  String _lvl;

  Developer(
    this._language,
    this._lvl,
    super._firstName,
    super._age,
    super._lastName,
    super._snils,
    super._number,
  );

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

  int get ageMonkey => age;

  @override
  String toString() {
// TODO: implement toString
    return 'Возраст мартышки $age, её зовут $name';
  }
}

class AgeCalculate {
// класс отвечает за перевод возраста мартышки в возраст других существ
  Monkey monkey;

  AgeCalculate(this.monkey);

  double ageTranslationToHuman(Monkey monkey) {
    return monkey.age * 1.5;
  }

  double get humanAge => ageTranslationToHuman(monkey);
}

class PrintAgeOtherCreature {
//класс отвечает за вывод результатов перевода возраста
  AgeCalculate ageCalculate;
  Monkey monkey;

  PrintAgeOtherCreature(this.ageCalculate, this.monkey);

  void printAge(AgeCalculate ageCalculate) {
    print('На человеческий возраст будет ${ageCalculate.humanAge}');
  }
}

//Open-Closed principe
abstract interface class InformationAboutCar {
  void informationAboutCar();
}

abstract class Car implements InformationAboutCar {
  int _speed;

  Car(this._speed);

  @override
  void informationAboutCar() {}
}

class Mazda extends Car {
  Mazda(super._speed);

  @override
  void informationAboutCar() {
    print('Мазда едет со скоростью $_speed');
  }
}

class Honda extends Car {
  Honda(super._speed);

  @override
  void informationAboutCar() {
    print('Хонда едет со скоростью $_speed');
  }
}

class Character {
  Car car;
  String name;

  Character(this.name, this.car);

  changeCar(Car newCar) {
    car = newCar;
  }

  inform() {
    car.informationAboutCar();
  }
}

//Пример  Liskov Substitution
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
//экземпляры классов для примера single responsibility. Каждый класс несёт единую ответственность. Monkey: характеристики мартышки, AgeCalculate:
// перевод возраста мартышки в возраст другой сущности, PrintAgeOtherCreature выводит результат перевода возраста.
  Monkey monkey = Monkey(20, 'Анфиса');
  AgeCalculate ageCalculate = AgeCalculate(monkey);
  PrintAgeOtherCreature printAgeOtherCreature =
      PrintAgeOtherCreature(ageCalculate, monkey);
  printAgeOtherCreature.printAge(ageCalculate);

//экземпляры классов для примера open-closed responsibility
  Mazda mazda = Mazda(100);
  Character character = Character('Valera', mazda);
  character.inform();

  Honda honda = Honda(60);
  character.changeCar(honda);
  character.inform();

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
