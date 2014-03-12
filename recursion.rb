def exp1(base, power)
  (power == 0) ? 1 : (base * exp1(base, power - 1))
end

def exp2(base, power)
  case power
  when 0
    1
  when 1
    base
  else
    exp2(base, (power / 2.0).floor) * exp2(base, (power / 2.0).ceil)
  end
end

class Array
  def deep_dup
    map { |el| el.is_a?(Array) ? el.dd_map : el }
  end
end

def fibs(n)
  case n
  when 1
    [0]
  when 2
    [0, 1]
  else
    fibs = fibs(n - 1)
    fibs << fibs[-2] + fibs[-1]
  end
end


def make_change(target, coins = [25, 10, 5, 1])
  # stores coins descending in size
  coins = coins.sort.reverse

  return [] if (coins.empty? || target < coins.last)

  best_change = nil
  coins.each_with_index do |coin, index|
    next if coin > target

    remainder = target - coin

    # finds best way to make change.
    # Avoids double counting by using larger coins first.
    best_remainder = make_change(remainder, coins[index..-1])

    this_change = [coin] + best_remainder

    if (best_change.nil? || (this_change.count < best_change.count))
      best_change = this_change
    end
  end

  best_change
end

class Array
  def subsets
    return [[]] if empty?
    subs = take(count - 1).subsets
    subs + subs.map { |sub| sub + [last] }
  end
end