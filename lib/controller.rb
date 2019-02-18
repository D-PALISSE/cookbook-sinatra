require_relative 'view'
require_relative 'recipe'
require_relative 'scrapemarmitonservice'
require 'open-uri'
require 'nokogiri'

class Controller
  def initialize(cookbook)
    @view = View.new
    @cookbook = cookbook
    @ingredient = ''
    # @marmiton_recipes_titles = []
    # @html_doc = ''
  end

  def create
    name = @view.ask_user_for_recipe_name
    description = @view.ask_user_for_recipe_description
    recipe_object = Recipe.new(name, description)
    @cookbook.add_recipe(recipe_object)
  end

  def list
    recipes = @cookbook.all
    @view.display_all(recipes)
  end

  def destroy
    index_recipe = @view.ask_user_for_recipe_index
    @cookbook.remove_recipe(index_recipe)
  end

  def import
    @ingredient = @view.ask_user_for_type_keyword
    instancescrap = ScrapeMarmitonService.new(@ingredient)
    my_hash = instancescrap.call
    marmiton_recipe = Recipe.new("#{my_hash[:name]} (#{my_hash[:duration]})", "difficulty: #{my_hash[:difficulty]}")
    @cookbook.add_recipe(marmiton_recipe)

    # url = "https://www.marmiton.org/recettes/recherche.aspx?aqt=#{ingredient}"
    # html_file = open(url).read
    # @html_doc = Nokogiri::HTML(html_file)
    # @html_doc.search('.recipe-card__title').each do |element|
    #   @marmiton_recipes_titles << element.text
    # end
    # displaying_result
  end

  # def displaying_result
  #  user_choice_display = @view.ask_user_for_type_resultdisplaying
  #  @marmiton_recipes_titles = @marmiton_recipes_titles[0, user_choice_display]
  #  @view.display_search_list(@marmiton_recipes_titles)
  #  do_import_recipe
  # end

  # def do_import_recipe
  #   all_recipes_link = []
  #   @html_doc.search('.recipe-card-link').each do |element|
  #     all_recipes_link << "https://www.marmiton.org#{element.attribute('href').value}"
  #   end
  #   user_choice_recipe_wanted = @view.ask_user_recipe_he_wants
  #   selected_url = all_recipes_link[user_choice_recipe_wanted-1]
  #   html_file1 = open(selected_url).read
  #   html_doc1 = Nokogiri::HTML(html_file1)
  #   recipe_scrapped_hash = {}
  #   html_doc1.search('.main-title').each do |element|
  #     recipe_scrapped_hash[:name]= element.text
  #   end
  #   duration_array = []
  #   @html_doc.search('.recipe-card__duration__value').each do |element|
  #     duration_array << element.text
  #   end
  #   recipe_scrapped_hash[:duration]= duration_array[user_choice_recipe_wanted -1]
  #   difficulty_array = []
  #   html_doc1.search('.recipe-infos__item-title').each do |element|
  #     difficulty_array << element.text.chomp
  #   end
  #   recipe_scrapped_hash[:difficulty]= difficulty_array[2]

  #   marmiton_recipe = Recipe.new("#{recipe_scrapped_hash[:name]} (#{recipe_scrapped_hash[:duration]})", "difficulty: #{recipe_scrapped_hash[:difficulty]}")
  #   @cookbook.add_recipe(marmiton_recipe)
  # end

  def mark_as_done
  recipes = @cookbook.all
  user_response = @view.ask_user_which_recipe_to_mark_done(recipes)
  @cookbook.recipes[user_response -1].done = true
  @view.type_marked_done
  end
end
