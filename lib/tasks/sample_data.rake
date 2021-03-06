require 'faker'

namespace :db do
	desc "Fill database with sample data"
	task :populate => :environment do
	
	  10.times do |n|
	    name =Faker::Name.name
	    email= "user-#{n}@example.com"
	    User.create(:name => name,:email =>email,
		:password => '123456', :password_confirmation =>'123456')
	  end
	
	  User.all.each do |user|
	    20.times do
		content=Faker::Lorem.sentence(5)
		title=Faker::Name.name
		user.microposts.create(:content =>content,
				       :title => title)
	    end
	  end
	end
end
