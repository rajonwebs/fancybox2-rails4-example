# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Address.create(name: 'Molly The Cat', street: '123 Main Street',
               city: 'Hometown', state: 'ME', zip: '12312')
Address.create(name: 'Frank the Dog', street: '321 Second Ave',
               city: 'Hometown', state: 'ME', zip: '12312')
