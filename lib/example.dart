class Mammal{
  void breathe(){
    print('Breathe in... Breathe out...');
  }
}

mixin Agility{
  var speed = 10;
  void sitDown(){
    print('Sitting down...');
  }
}

class Person extends Mammal with Agility{
  String name;
  int age;

  Person(this.name, this.age);
}

void main(){
  var p = Person("Suman", 28);
  print(p.name);
  p.breathe();
  print('Speed is ${p.speed}');
  p.sitDown();
}