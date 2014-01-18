# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

google = NewsHub.create(name: 'Google News', url: 'https://news.google.com/')
google.xpath = '.section-content .esc-lead-article-title'
google.save
#NewsHub.create(name: 'Google News', url: 'https://news.google.com/').update(xpath: '.section-content .esc-lead-article-title')