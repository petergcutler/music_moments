# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Post.destroy_all
Comment.destroy_all

Post.create(title: "Galantis - Peanut Butter Jelly", song_url: "https://www.youtube.com/watch?v=4jBDnYE1WjI", moment: "This just reminds me of random dance parties in living rooms. Sometimes, you just want to dance.", tags: "dance party", ups: 0)
Post.create(title: "Chromeo - Jealous (I Ain't With It)", song_url: "https://www.youtube.com/watch?v=RhmUnk454MA", moment: "This reminds me of hanging out with my friend Dylan and singing along to every Chromeo song. We even made a bracket to decide the best Chromeo song from their discography. We have too much time on our hands.", tags: "bros", ups: 0)
