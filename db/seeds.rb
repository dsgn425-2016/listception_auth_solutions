# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create email: "alice@example.com", password: "123456"

board = Board.new
board.user_id = user.id
board.name = "Books to read"
board.save

7.times do
  list = List.new
  list.board_id = board.id
  list.name = Faker::Book.genre
  list.save

  rand(10).times do
    card = Card.new
    card.list_id = list.id
    card.name = Faker::Book.title
    card.description = "by #{Faker::Book.author}, from #{Faker::Book.publisher}"
    card.save
  end
end
