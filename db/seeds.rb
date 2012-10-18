# encoding: UTF-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require File.expand_path('../seed_cities.rb', __FILE__)

Admin.create(email: "jr.schnorr@gmail.com", password: "123123")
Admin.create(email: "eduardofsilva182@gmail.com", password: "123123")

if Rails.env.development?
  User.create(email: "user@user.com", password: "123123")
  Admin.create(email: "admin@admin.com", password: "123123")
  city = City.find_by_name("Sapucaia do Sul")
  party = Party.new(:description => "Descrição", :name => "Minha festa!", :street => "Rua Dona Ecilda", :street_number => 400, :city_id => city.id, :start_at => 9.weeks.from_now)
  party.user = User.first
  party.save
end