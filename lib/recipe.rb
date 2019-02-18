class Recipe
  attr_accessor :name, :description, :done
  def initialize(name, description)
    @name = name
    @description = description
    @done = false
  end
end
