namespace 'ghub' do
  desc 'Update GitHub Repository'
  task :update, [:msg] do |t, args|
    if args.msg.nil?
      puts 'Please supply message for update.'
    else
      system('git add', '.')
      system('git commit', "-am #{args.msg}")
      system('git push', 'github master')
    end
  end
end