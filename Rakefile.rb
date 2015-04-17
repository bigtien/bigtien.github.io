task :default => :new

require 'fileutils'

desc "new post"
task :new do
  puts "input the post URL:"
	@url = STDIN.gets.chomp
	puts "input post title:"
	@name = STDIN.gets.chomp
	puts "input post tags:"
	@categories = STDIN.gets.chomp
	@slug = "#{@url}"
	@slug = @slug.downcase.strip.gsub(' ', '-')
	@date = Time.now.strftime("%F")
	@post_name = "_posts/#{@date}-#{@slug}.md"
	if File.exist?(@post_name)
			abort("Failed!filename exist")
	end
	FileUtils.touch(@post_name)
	open(@post_name, 'a') do |file|
			file.puts "---"
			file.puts "layout: post"
			file.puts "title: #{@name}"
			file.puts "date: #{Time.now}"
			file.puts "categories: #{@categories}"
			file.puts "---"
	end
	exec "vi #{@post_name}"
end
