#!usr/bin/env python#
# -*- coding: utf-8 -*-
"""Learning Python Class"""

class Person():
    def __init__(self, name, job=None, pay=0):
        self.name = name
        self.job = job
        self.pay = pay
    def lastName(self):
        return self.name.split()[-1]
    def giveRaise(self, percent):
        self.pay = int(self.pay * (1 + percent))
    def __repr__(self):
        return '[Person: %s, %s]' % (self.name, self.pay)

class Manager(Person):
    def __init__(self, name, pay):
        Person.__init__(self, name, 'mgr', pay)
    def giveRaise(self, percent, bonus=.10):
        Person.giveRaise(self, percent + bonus)  
        

if __name__ == '__main__':
    #selftest Code
    bob = Person('Bob Smith')
    sue = Person('Sue Jones', job='dev', pay=1000000)
    print(sue.pay)
    print(bob)
    print(sue)
    print(bob.name, bob.pay)
    print(sue.name, sue.pay)
    print(bob.name.split()[-1])
    print(bob.lastName(), sue.lastName())
    print(sue)
    tom = Manager('Tom Jones', 50000)
    tom.giveRaise(.10)
    print(tom.lastName())

    for obj in (bob, sue, tom):
        obj.giveRaise(.10)
        print(obj)
        
    
    
