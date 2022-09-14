require_relative '../item'
class Genre
  attr_accessor :items
  attr_reader :id

  def initialize(name)
    id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.genre=(self) unless item.genre == self
  end
end

# item = Item.new('2010-01-01', false)
# genre = Genre.new('test')

# genre.add_item(item)

# p genre
# p item