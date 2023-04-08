#!/usr/bin/env python3
class Piglet:
  name = "piglet"
  years = 0
  def speak(self):
    print("Oink! I'm {}! Oink!".format(self.name))
  def piggyage(self):
    return self.years*18

    
class Apple:
  def __init__(self, color, flavor):
    self.color = color
    self.flavor = flavor
  def __str__(self):
    return("This apple is {} and have {} flavor!".format(self.color, self.flavor))


hamlet = Piglet()
hamlet.name = "Hamlet"
hamlet.speak()

jonagold = Apple("red", "sweet")
print(jonagold)



""" One more example """
class Person:
    def __init__(self, name):
        self.name = name
    def greeting(self):
        # Should return "hi, my name is " followed by the name of the Person.
        return "Hi, my name is {}".format(self.name) 

# Create a new instance with a name of your choice
some_person = Person("Petunia")  
# Call the greeting method
print(some_person.greeting())