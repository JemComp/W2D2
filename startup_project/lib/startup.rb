require "employee"

class Startup

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def name
        @name
    end

    def funding
        @funding
    end

    def salaries
        @salaries
    end

    def employees
        @employees
    end

    def valid_title?(title)
        @salaries.has_key?(title) ? true : false
    end

    def >(startup)
        self.funding > startup.funding ? true : false
    end

    def hire(name, title)
        if self.valid_title?(title)
            @employees << Employee.new(name,title)
        else
            raise ArgumentError.new "Not a valid title!"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        title_salary = @salaries[employee.title]
        if self.funding > title_salary
            employee.pay(title_salary)
            @funding -= title_salary
        else
            raise ArgumentError.new "Not Enough Funding!"
        end
    end
    
    def payday
        @employees.each { |employee| pay_employee(employee)}
    end

    def average_salary
        sum = 0
        @employees.each do |employee|
            sum += @salaries[employee.title]
        end

        sum * 1.0/self.size
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        
        startup.salaries.each do |title, pay|
            if !salaries.has_key?(title)
                @salaries[title] = pay
            end
        end


        @employees += startup.employees

        startup.close
    end










end
