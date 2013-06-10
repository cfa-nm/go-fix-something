# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create the dev user and 4 others
FactoryGirl.create :user, email: 'ben@example.com', password: 'password'
4.times do
  FactoryGirl.create :user
end

users = User.all
users.each do |user|
  5.times do
    FactoryGirl.create :idea, user: user
  end
end

Idea.all.each do |idea|
  5.times do
    attrs = FactoryGirl.attributes_for(:comment, author_id: users.sample.id)
    idea.comments.create! attrs
  end
end
