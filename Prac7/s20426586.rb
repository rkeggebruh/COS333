class Employee
    attr_reader :earnings
  
    def initialize(baseSalary = 20000.00)
      @baseSalary = baseSalary
      @earnings = 0.0
      @baseSalaryPaid = false
    end
  
    def payEmployee
      unless @baseSalaryPaid
        @earnings += @baseSalary
        @baseSalaryPaid = true
      end
    end
  
    def newMonth
      @baseSalaryPaid = false
    end
  end
  
  class Manager < Employee
    def initialize(bonus)
      super()
      @bonus = bonus
    end
  
    def payEmployee
      super
      @earnings += @bonus
    end
  end
  
  class Programmer < Employee
    def initialize(percentage)
      super(20000.00 * percentage)
    end
  end
  
  class Team
    def initialize
      @members = []
    end
  
    def addMember(employee)
      if @members.size >= 2
        raise "Cannot add more than 2 members to a team"
      end
      @members << employee
    end
  
    def payTeam
      @members.each(&:payEmployee)
    end
  
    def newMonth
      @members.each(&:newMonth)
    end
  
    def printEarnings
      @members.each { |member| puts "Earnings: #{member.earnings}" }
    end
  end
  
  # Test code to create teams and manage payments
  teams = [Team.new, Team.new]
  
  puts "Enter manager's bonus:"
  bonus = gets.chomp.to_f
  manager = Manager.new(bonus)
  
  teams.each do |team|
    team.addMember(manager)
    puts "Enter programmer's salary percentage (e.g., 0.5 for 50%):"
    percentage = gets.chomp.to_f
    programmer = Programmer.new(percentage)
    team.addMember(programmer)
  end
  
  loop do
    puts "Do you want to pay the teams for another month of work? (y/n)"
    answer = gets.chomp.downcase
    break if answer == 'n'
  
    teams.each(&:payTeam)
    teams.each(&:newMonth)
  end
  
  teams.each(&:printEarnings)
  