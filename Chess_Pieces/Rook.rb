require_relative 'ChessPiece'

class Rook < ChessPiece

  def initialize is_white
    super is_white
  end

  #override
  def w; "R-w"; end

  def b; "R-b"; end

  def valid_move? from, to
    if validate_pos(from, to)
      axis = get_axis from, to
      if valid_axis?(axis[:x_from], axis[:y_from], axis[:x_to], axis[:y_to])
        if axis[:x_from] == axis[:x_to]
          return (axis[:y_from] - axis[:y_to]) != 0
        elsif axis[:y_from] == axis[:y_to]
          return (axis[:x_from] - axis[:x_to]) != 0
        else
          return false
        end
      else
        return false
      end
    else
      false
    end
  end

  #return attacked piece or nil or false
  def can_move?(from, to, board)
    if valid_move? from, to
      axis = get_axis from, to
      from_box_piece = board.get_box axis[:x_from], axis[:y_from]
      dest_box_piece = board.get_box axis[:x_to], axis[:y_to]

      if dest_box_piece != ChessPiece.blank
        unless dest_box_piece.white? and from_box_piece.white?
          if check_midway_piece axis[:x_from], axis[:y_from], axis[:x_to], axis[:y_to], board
            move_to from, to, board
            dest_box_piece
          end
        end
      else
        if check_midway_piece axis[:x_from], axis[:y_from], axis[:x_to], axis[:y_to], board
          move_to from, to, board
          nil
        end
      end
    end
    false
  end

  def check_midway_piece(x_from, y_from, x_to, y_to, board)

    # @type [Integer] y_axis_diff
    if x_from.eql? x_to           #if vertical move
      y_axis_diff = y_to - y_from
      if y_axis_diff.positive?    #if vertically up move
        1.upto(y_axis_diff) do |i|
          unless board.get_box(x_from, y_from + i).eql?(ChessPiece.blank)
            return false
          end
        end
      else                        #if vertically down move
        -1.downto(y_axis_diff) do |i|
          unless board.get_box(x_from, y_from + i).eql?(ChessPiece.blank)
            return false
          end
        end
      end
    elsif y_from.eql? y_to        #if horizotal move
      # @type [Integer] x_axis_diff
      x_axis_diff = x_to - x_from
      if x_axis_diff.positive?    #if horizontly right move
        1.upto(x_axis_diff) do |i|
          unless board.get_box(x_from + i, y_from).eql?(ChessPiece.blank)
            return false
          end
        end
      else                        #if horizontly left move
        -1.downto(x_axis_diff) do |i|
          unless board.get_box(x_from + i, y_from).eql?(ChessPiece.blank)
            return false
          end
        end
      end
    else; false; end
    true
  end

  private :check_midway_piece

end
