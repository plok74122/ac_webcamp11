namespace :dev do
  desc "重建一些假資料"
  task :rebuild => ["db:reset", :fake]
  task :fake => :environment do
    Group.create(:name => "Ruby")
    Group.create(:name => "PHP")
    Group.create(:name => ".NET")
    Group.create(:name => "Python")
    Group.create(:name => "C#")
    Category.create(:name => "Category A")
    Category.create(:name => "Category B")
    Category.create(:name => "Category C")
    Category.create(:name => "Category D")
    Category.create(:name => "Category E")
    20.times do
      capacity = (5..10).to_a.sample
      event = Event.create(:name => Faker::Name.name, :description => Faker::Hipster.paragraph, :category => Category.all.sample, :capacity => capacity)
      puts "create event id is #{event.id}"
      capacity.times do
        attendee = event.attendees.create(:name => Faker::Pokemon.name)
        puts "create attendee id is #{attendee.id}"
      end
      event.group_ids = Group.all.map { |g| g.id if [true, false].sample }.compact
    end
  end
end
