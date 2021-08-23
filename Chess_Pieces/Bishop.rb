require_relative 'ChessPiece'

class Bishop < ChessPiece

  def initialize is_white
    super is_white
  end

  #override
  def w; "B-w"; end

  def b; "B-b"; end

  def valid_move? from, to
    if validate_pos(from, to)
      axis = get_axis from, to
      if valid_axis?(axis[:x_from], axis[:y_from], axis[:x_to], axis[:y_to])
        diff_from = axis[:x_from] - axis[:y_from]
        diff_to = axis[:x_to] - axis[:y_to]
        return diff_from == diff_to
      else
        return false
      end
    else
      false
    end
  end

  # returns (false || nil || dest_box_piece)
  def can_move?(from, to, board)
    if valid_move? from, to
      axis = get_axis from, to
      from_box_piece = board.get_box axis[:x_from], axis[:y_from]
      dest_box_piece = board.get_box axis[:x_to], axis[:y_to]

      if dest_box_piece != ChessPiece.blank
        unless dest_box_piece.white? and from_box_piece.white?
          if check_midway_piece(axis[:x_from], axis[:y_from], axis[:x_to], axis[:y_to], board)
            move_to from, to, board
            dest_box_piece
          end
        end
      else
        if check_midway_piece(axis[:x_from], axis[:y_from], axis[:x_to], axis[:y_to], board)
          move_to from, to, board
          nil
        end
      end
    end
    false
  end

  # @private
  def check_midway_piece(x_from, y_from, x_to, y_to, board)

    # @type [Integer] y_axis_diff
    if (x_to > x_from and y_to > y_from) || (x_to < x_from and y_to < y_from)          #if top right or bottom left diagonal move
      diff = x_to - x_from
      if diff.positive?
        1.upto(diff) do |i|
          unless board.get_box(x_from + i, y_from + i).eql?(ChessPiece.blank)
            return false
          end
        end
      else
        -1.downto(diff) do |i|
          unless board.get_box(x_from + i, y_from + i).eql?(ChessPiece.blank)
            return false
          end
        end
      end
    elsif (x_to < x_from and y_to > y_from) || (x_to > x_from and y_to < y_from)      #if top left or bottom right diagonal move
      diff = x_to - x_from
      if diff.positive?   #if bottom right diagonal move
        1.upto(diff) do |i|
          unless board.get_box(x_from + i, y_from - i).eql?(ChessPiece.blank)
            return false
          end
        end
      else          #if top left diagonal move
        -1.downto(diff) do |i|
          unless board.get_box(x_from + i, y_from - i).eql?(ChessPiece.blank)
            return false
          end
        end
      end
    else; false; end
    true
  end

  private :check_midway_piece

end
