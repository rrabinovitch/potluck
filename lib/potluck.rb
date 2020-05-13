class Potluck
  attr_reader :date, :dishes

  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
    @dishes.find_all do |dish|
      dish.category == category
    end
  end

  def menu
    menu = {appetizers: [],
    entres: [],
    desserts: []}

    @dishes.map do |dish|
      if dish.category == :appetizer
        menu[:appetizers] << dish.name
      elsif dish.category == :entre
        menu[:entres] << dish.name
      elsif dish.category == :dessert
        menu[:desserts] << dish.name
      end
    end

    menu
  end
end











    #
    # @dishes.map do |dish|
    #   if dish.category == :appetizer
    #     menu[:appetizers] << dish.name
    #   elsif dish.category == :entre
    #     menu[:entres] << dish.name
    #   elsif dish.category == [:dessert]
    #     menu[:desserts] << dish.name
    #   end
    # end
    #
    # p menu
