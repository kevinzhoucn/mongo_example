module DesignPattern
  class Payroll
    attr_reader :result
    def initialize
      @result = ''
    end
    def update( changed_employee )
      @result += "Cut a new check for #{changed_employee.name}!  \
                His salary is now #{changed_employee.salary}!"
    end
  end

  class TaxMan
    attr_reader :result
    def initialize
      @result = ''
    end
    def update( changed_employee )
      @result += "Send #{changed_employee.name} a new tax bill!"
    end
  end

  class Employee
    attr_reader :name, :title
    attr_reader :salary

    def initialize( name, title, salary, payroll )
      @name = name
      @title = title
      @salary = salary
      @payroll = payroll
    end

    def salary=(new_salary)
      @salary = new_salary
      @payroll.update(self)
    end
  end

  class Employee01
    attr_reader :name, :title
    attr_reader :salary

    def initialize( name, title, salary )
      @name = name
      @title = title
      @salary = salary
      @observers = []
    end

    def salary=(new_salary)
      @salary = new_salary
      notify_observers
    end

    def notify_observers
      @observers.each do |observer|
        observer.update(self)
      end
    end

    def add_observer(observer)
      @observers << observer
    end

    def delete_observer(observer)
      @observers.delete(observer)
    end
  end

  class Employee02
    include Iobserver::Subject
    attr_reader :name, :title
    attr_reader :salary

    def initialize( name, title, salary )
      super()
      @name = name
      @title = title
      @salary = salary
    end

    def salary=(new_salary)
      @salary = new_salary
      notify_observers
    end
  end

  class Employee03
    include Iobserver::Subject

    attr_reader :name, :address
    attr_reader :salary

    def initialize( name, title, salary )
      @name = name
      @title = title
      @salary = salary
    end

    def salary=(new_salary)
      @salary = new_salary
      changed
      notify_observers(self)
    end
  end

  class Employee04
    include Iobserver::Subject01
    attr_reader :name, :title
    attr_reader :salary

    def initialize( name, title, salary )
      super()
      @name = name
      @title = title
      @salary = salary
    end

    def salary=(new_salary)
      @salary = new_salary
      notify_observers
    end
  end
end