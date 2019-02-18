require 'csv'
class Cookbook
  attr_accessor :recipes
  def initialize(csv_path_file)
    @csv_filepath = csv_path_file
    @recipes      = []
    loading_csv
  end

  def all
    return @recipes
  end

  def add_recipe(recipe_object)
    @recipes << recipe_object
    CSV.open(@csv_filepath, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.done]
      end
    end
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    CSV.open(@csv_filepath, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.done]
      end
    end
  end

  def loading_csv
    CSV.foreach(@csv_filepath) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end
end
