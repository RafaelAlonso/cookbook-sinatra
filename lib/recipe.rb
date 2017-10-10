class Recipe
  attr_reader :name, :description, :cooking_time, :difficulty

  def initialize(name, description, cooking_time, difficulty)
    @name = name
    @cooking_time = cooking_time
    @difficulty = difficulty
    @description = description
    @done = false
  end

  def done?
    @done
  end

  def done!
    @done = true
  end
end
