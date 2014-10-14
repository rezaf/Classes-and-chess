class Employee
  attr_reader :name, :title
  attr_accessor :boss, :salary
  
  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
    @boss = nil
  end
  
  def bonus(multiplier)
    @salary * multiplier
  end

end

class Manager < Employee
  
  def initialize(name, title, salary)
    super(name, title, salary)
    @employees = []
  end
  
  def add_employee(employee)
    @employees << employee
    employee.boss = self
  end
  
  def bonus(multiplier)
    
    @employees.map do |employee|
      if employee.is_a?(Manager)
        employee.bonus(multiplier) + employee.salary * multiplier
      else
        employee.salary * multiplier
      end 
    end.inject(:+)
  end
end

tom = Manager.new('tom','manager',60_000)
fred = Employee.new('fred','teller',40_000)
jake = Manager.new('jake', 'bossman', 80_000)
tom.add_employee(fred)
jake.add_employee(tom)

p tom.salary
p fred.salary
p tom.bonus(1)
p fred.bonus(1)
p jake.bonus(1)
