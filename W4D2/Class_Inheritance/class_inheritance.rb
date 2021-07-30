

class Employee

    attr_accessor :boss
    attr_reader :salary

    def initialize(name, title, salary)
        @name = name
        @title = title
        @salary = salary
        @boss = nil
    end

    def bonus(multiplier) 
        @bonus = self.salary * multiplier
    end

    def add_boss=(manager)
        @boss = manager
        self.boss.add_employee(self)
    end
end
    

class Manager < Employee

    attr_reader :employees
    
    def initialize(name, title, salary)
        super
        @employees = []
    end

    def salary_sum
        salary_sum = 0

        self.employees.each do |sub_employee|
            if sub_employee.is_a?(Manager)
                salary_sum += sub_employee.salary_sum + sub_employee.salary
            else
                salary_sum += sub_employee.salary
            end
        end
        salary_sum
    end

    def bonus(multiplier)
        # multiply the sum by multiplier to return bonus
        @bonus = self.salary_sum * multiplier        
    end

    def add_employee(employee)
        self.employees << employee
        return employee
    end
end

Ned = Manager.new("Ned", "Founder", 1000000)
Darren = Manager.new("Darren", "TA Manager", 78000)
Shawna = Employee.new("Shawna", "TA", 12000)
David = Employee.new("David", "TA", 10000)

p David.add_boss=(Darren)
p Shawna.add_boss=(Darren)
p Darren.add_boss=(Ned)

p Ned.salary_sum

