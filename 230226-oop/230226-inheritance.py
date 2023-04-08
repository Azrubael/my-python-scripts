class Animal:
  def __init__(self, name, sound):
    self.name = name
    self.sound = sound
  def __str__(self):
    return("The {} makes '{}' sound!".format(self.name, self.sound))


class Piglet(Animal):
  years = 0
  def speak(self):
    print("{0} I'm a {1}! {0}".format(self.sound, self.name))
  def piggy_age(self):
    return self.years*18

class Cow(Animal):
  years = 0
  def speak(self):
    print("{0} I'm a {1}! {0}".format(self.sound, self.name))
  def cow_age(self):
    return self.years*5


hamlet = Piglet("Piglet", "Oink!")
hamlet.speak()

petunia = Cow("Petunia", "Moooo!")
petunia.speak()

print(hamlet)
print(petunia)

"""
Another inheritance example
"""
print()
class Clothing:
  material = "tissue"
  def __init__(self,name):
    self.name = name
  def checkmaterial(self):
	  print("This {} is made of {}".format(self.name,self.material))
			
class Shirt(Clothing):
  material="Cotton"

polo = Shirt("Polo")
polo.checkmaterial()
