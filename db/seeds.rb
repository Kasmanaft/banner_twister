# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

site = Site.create({name: "Test site", url: "http://localhost:3001"})

Banner.create([
  {
    name: "First test banner",
    site: site,
    target_url: 'http://google.com',
    target: '_blank',
    showed: 0,
    clicks: 0,
    max_showing: 500,
    image_file_name: 'third.png',
    image_content_type: 'image/png',
    image_file_size: 18932
  },
  {
    name: "Second test banner",
    site: site,
    target_url: 'http://yahoo.com',
    target: '_blank',
    showed: 0,
    clicks: 0,
    max_showing: 1058,
    image_file_name: 'second.png',
    image_content_type: 'image/png',
    image_file_size: 16177
  },
  {
    name: "Third test banner",
    site: site,
    target_url: 'http://yandex.com',
    target: '_blank',
    showed: 0,
    clicks: 0,
    max_showing: 80,
    image_file_name: 'first.png',
    image_content_type: 'image/png',
    image_file_size: 23686
  }
])