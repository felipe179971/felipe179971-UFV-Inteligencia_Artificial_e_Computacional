#Classes 1 #####################################################################
class Dog: 
    'A simple dog model.'

    def __init__(self, name, age): 
        'Construct name and age attributes for an instance of Dog'
        self.name = name.title()
        self.age = age

    def sit(self):
        'Simulate a dog sitting in response to a command.'
        print(self.name + " is now sitting.")

    def roll_over(self):
        'Simulate rolling over in response to a command.'
        print(self.name + " rolled over!")

my_dog = Dog(name='willie', age=6)

print("My dog's name is " + my_dog.name + ".")
print("My dog is " + str(my_dog.age) + " years old.")
my_dog.sit()
my_dog.roll_over()
#Classes 2 #####################################################################
class Car:
  'modelagem d e carro atraves de classe'
  def __init__(self,make,model,year):
    'Inicializar os atributos qu descrevem o carro'
    self.make=make
    self.model=model
    self.year=year
    self.odometer_reading=0
    
  def get_despriptive_name(self):
    'Retorna um nome descritivo para o carro.'
    long_name=f"{self.year} {self.make} {self.model}"
    return long_name.title()
  
  def read_odometer(self):
    'impreim a distancia percorrida pelo carro'
    print(f"Esse carro rodou {self.odometer_reading} mi.")
    
  def update_odometer(self, mileage):
    'Atualiza valor do odometro para o valor fornecido.'
    self.odometer_reading=mileage
    
  def increment_odometer(self,miles):
    self.odometer_reading+=miles
my_new_car=Car('audi','a4',2019)
print(my_new_car.get_despriptive_name())
my_new_car.read_odometer()

my_new_car.odometer_reading=23
my_new_car.read_odometer()

my_new_car.update_odometer(24)
my_new_car.read_odometer()

my_new_car.increment_odometer(20)
my_new_car.read_odometer()
