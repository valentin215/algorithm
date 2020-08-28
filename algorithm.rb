# Is unique 
def is_unique(string)
  hash = Hash.new(0)

  string.chars.each do |letter|
    hash[letter] += 1
  end 

  hash.each do |key, value|
    return false if value != 1
  end 
  return true
end 

# Check permutation
def permutations(first_string, second_string)
  first_hash = Hash.new(0)
  second_hash = Hash.new(0) 

  first_string.chars.each do |char|
    first_hash[char] += 1
  end 

  second_string.chars.each do |char|
    second_hash[char] += 1
  end
  
  return true if first_hash == second_hash
  return false
end 

# palindrome
def palindrome(string)
  palindrome_string = []
  string.reverse.chars.each do |char|
    palindrome_string << char
  end 
  if palindrome_string.join('') == string
    return true
  else
    return false
  end 
end 


# Palindrome permutation
def permutation_palindrome(input) 
  hash = Hash.new(0)
  input.delete(' ').chars.each do |char|
    hash[char.downcase] += 1
  end 

  odd = 0
  even = 0

  hash.each do |key, value|
    if value.even?
      even += 1
    else
      odd += 1
    end 
  end
  
  if odd > 1
    return false
  else
    return true
  end     
end 

# coin algorithm

def change(price_coins, price_item)
  diff_price = 0
  return O if price_coins == price_item
  if price_coins > price_item
      diff_price = price_coins - price_item
  end

  array_coins = [1, 2, 5, 10, 20, 50, 100, 300, 400]
  
  price = (diff_price * 100).to_i
  number_of_coins = 0
  final_number_coins = 0
  new_price = 0 

  array_coins.reverse.each do |coin|
      if (price / coin) >= 1
          quotient = price / coin
          price = price - quotient * coin
          final_number_coins += quotient
      end 
  end 
  final_number_coins
end 

# map 

class Array
  def my_map
    new_arr = []
    self.each { |e| new_arr << yield(e) }
    new_arr
  end 
end 

ok = [1, 3, 4].my_map { |e| e * e }

# deminor

class DeminorGround
  def initialize(bombs, size_ground)
    @bombs = bombs
    @size_ground = size_ground
  end 

  def array_memo
   @oui ||= Array.new(@size_ground) { Array.new(@size_ground) }
  end 

  def fill_bombs
    while @bombs != 0
      row_position = rand(0..@size_ground - 1)
      col_position = rand(0..@size_ground - 1)
      unless array_memo[row_position][col_position] == 'BOMBS'
        array_memo[row_position][col_position] = 'BOMBS'
        @bombs = @bombs - 1
      end 
    end 
    array_memo
  end 
end 


