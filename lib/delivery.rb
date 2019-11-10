require './navigator'

class Delivery
  attr_accessor :board_x, :board_y, :board

  def initialize(x, y)
    self.board_x = x
    self.board_y = y
    self.board = Array.new(board_x).map { Array.new(board_y) }
  end

  def put(pizza_house)
    board[pizza_house.x][pizza_house.y] = pizza_house
  end

  def path
    current_point = { x: 0, y: 0 }
    res = ''

    max_index.times do |t|
      points = find_points_in_circle(t)
      next unless points.any?
      points.reverse! if current_point_close_to_east?(points, current_point)
      points.each do |point|
        res << Navigator.navigate(current_point, point)
        current_point = point
        unless board[current_point[:x]][current_point[:y]].received
          res << 'D'
          board[current_point[:x]][current_point[:y]].received!
        end
      end
    end
    res
  end

  private

  def current_point_close_to_east?(points, current_point)
    points.first[:x] - current_point[:x] > points.last[:x] - current_point[:x]
  end

  def max_index
    [board_x, board_y].max
  end

  def find_points_in_circle(number)
    max_x = [board_x - 1, number].min
    max_y = [board_y - 1, number].min

    res = []
    if (max_y >= number)
      (0..max_x).each do |x|
        res << { x: x, y: max_y } unless board[x][max_y].nil?
      end
    end

    if (max_x >= number)
      (0..max_y).each do |y|
        res << { x: max_x, y: y } unless board[max_x][y].nil?
      end
    end
    res.uniq.sort_by { |point| point[:x] }
  end
end
