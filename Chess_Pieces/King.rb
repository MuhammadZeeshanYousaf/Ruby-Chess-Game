require_relative 'ChessPiece'

class King < ChessPiece

  def initialize(is_white)
    super is_white
  end

  #override
  def w; "K-w"; end

  def b; "K-b"; end

  def valid_move?(from, to)
    if validate_pos(from, to)
      axis = get_axis from, to  #get axis from string input (e.g, from = "e4")
      if valid_axis?(axis[:x_from], axis[:y_from], axis[:x_to], axis[:y_to])
        #All possible coordinates positions
        x = [1, -1, 0, 0, 1, -1, -1, 1]
        y = [0, 0, 1, -1, 1, -1, 1, -1]
        for i in 0...(x.length)
          test_x = axis[:x_from] + x[i]
          test_y = axis[:y_from] + y[i]
          if valid_axis?(test_x, test_y)
            if test_x == axis[:x_to] and test_y == axis[:y_to]
              return true
            end
          end
        end
        #if no axis match in loop then return false
        return false
      else
        return false
      end
    else
      false
    end
  end

  def can_move(from, to, board) end

  def move_to(from, to, board) end

end
