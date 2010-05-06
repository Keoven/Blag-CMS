namespace 'ghub' do
  desc 'Update GitHub Repository'
  task :update, [:msg] do |t, args|
    if args.msg.nil?
      puts 'Please supply message for update.'
    else
      `git add .`
      `git commit #{"-am #{args.msg}"}`
      `git push github master`
    end
  end
end