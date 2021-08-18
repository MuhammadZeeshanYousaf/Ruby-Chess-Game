class Player
  def initialize name, is_color_white
    @name = name
    @is_white = is_color_white
    @is_eliminated = false
  end

  def change_name=(value)
    @name = value
  end

  def white?
    @is_white
  end

  def eliminated?
    @is_eliminated
  end

  def eliminate
    @is_eliminated = true
  end

  def to_s
    @name
  end
end
