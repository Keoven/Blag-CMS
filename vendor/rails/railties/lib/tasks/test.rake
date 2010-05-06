desc 'this is just a test'
task :name do
  puts 'ako si test.rake sa lib task'
end

task :sanitize_email => :environment do
  Author.all.each do |user|
    user.email = user.email + 'ok'
    user.save
  end
end

task :show_users => [:environment, :sanitize_email] do
  Author.all.map {|u| puts u.email}
end

#rake show_user 1
task :show_user => :environment do
  Author.find(ARGV[0])
end

#rake show_user[1]
#task :show_userz[:user_id] => environment do
#  User.find(args.user_id)
#end
