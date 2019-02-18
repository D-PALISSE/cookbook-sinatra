class View
  def ask_user_for_recipe_name
    puts "What is the name of the recipe you want to add?"
    print ">"
    return gets.chomp
  end

  def ask_user_for_recipe_description
    puts "What is the description of the recipe you want to add?"
    print ">"
    return gets.chomp
  end

  def display_all(recipes)
    puts "Here is the list of the recipes in your cookbook:"
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. [#{check_if_done(recipe)}] #{recipe.name} - #{recipe.description}"
    end
  end

  def ask_user_for_recipe_index
    puts "What is the index of the recipe you want to add?"
    print ">"
    return gets.chomp.to_i - 1
  end

  def ask_user_for_type_keyword
    puts "Type a keyword for search some recipes"
    ingredient2 = gets.chomp
    return ingredient2
  end

  def ask_user_for_type_resultdisplaying
    puts "How many result would you display ? [1-15]"
    user_choice_display1 = gets.chomp.to_i
    return user_choice_display1
  end

  def display_search_list(recipes_titles)
    puts "------------------------------------"
    recipes_titles.each_with_index do |recipie, index|
      puts "#{index +1}- #{recipie}"
    end
  end

  def ask_user_recipe_he_wants
    puts "------------------------------------"
    puts "Which recipe want you to save ? (type index)"
    user_index_choice = gets.chomp.to_i
    return user_index_choice
  end

  def check_if_done(recipe)
    if recipe.done
      return 'X'
    else
      return ' '
    end
  end

  def ask_user_which_recipe_to_mark_done(recipes)
    display_all(recipes)
    puts ""
    puts "Which recipe you wanna mark as done? (type index)"
    response = gets.chomp.to_i
    return response
  end

  def type_marked_done
    puts "recipe marked done!"
  end
end
