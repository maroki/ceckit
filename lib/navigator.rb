class Navigator
  def self.navigate(from, to)
    res = ''
    while from[:x] != to[:x]
      if (from[:x] > to[:x])
        res << 'W'
        from[:x] = from[:x] - 1
      else
        res << 'E'
        from[:x] = from[:x] + 1
      end
    end

    while from[:y] != to[:y]
      if (from[:y] > to[:y])
        res << 'S'
        from[:y] = from[:y] - 1
      else
        res << 'N'
        from[:y] = from[:y] + 1
      end
    end
    res
  end
end
