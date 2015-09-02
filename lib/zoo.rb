class Zoo
  attr_reader :cages, :employees

  def initialize(name)
    @name = name
    @employees = []
    @cages = []
    10.times do
      @cages << Cage.new
    end
  end

  def add_employee(name)
    @employees << name
  end

  def add_animal(animal)
    empty_cages = cages.map { |cages| cages.empty? }
    if empty_cages.include?(true)
      cages.each do |cage|
        if cage.empty?
          cage.animal = animal
          break
        end
      end
    else
      raise ZooAtCapacity
    end
  end

  def visit
    string = ""
    employees.each do |employee|
      string << employee.greet + "\n"
    end
    cages.each do |cage|
      if cage.empty? == false
        string << cage.animal.speak + "\n"
      end
    end
    string
  end
end

class ZooAtCapacity < StandardError
end
