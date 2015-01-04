# require "rubygems"
# require "bundler/setup"
# require "stringex"
# # require 'pry'

# ## -- Misc Configs -- ##

# posts_dir       = "_posts"    # directory for blog files
# page_dir        = "page"       # directory for blog pages
# new_post_ext    = "markdown"  # default new post file extension when using the new_post task
# new_page_ext    = "markdown"  # default new page file extension when using the new_page task
# server_port     = "4000"      # port for preview server eg. localhost:4000


# # usage rake new_post[my-new-post] or rake new_post['my new post'] or rake new_post (defaults to "new-post")
# desc "Begin a new post in #{posts_dir}"
# task :new_post, :title do |t, args|
#   if args.title
#     title = args.title
#   else
#     title = get_stdin("Enter a title for your post: ")
#   end
#   raise "### You haven't set anything up yet. First run `rake install` to set up an Octopress theme." unless File.directory?(posts_dir)
#   mkdir_p "#{posts_dir}"
#   filename = "#{posts_dir}/#{Time.now.strftime('%Y-%m-%d')}-#{title.to_url}.#{new_post_ext}"
#   if File.exist?(filename)
#     abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
#   end
#   puts "Creating new post: #{filename}"
#   open(filename, 'w') do |post|
#     post.puts "---"
#     post.puts "layout: post"
#     post.puts "title: \"#{title.gsub(/&/,'&amp;')}\""
#     post.puts "date: #{Time.now.strftime('%Y-%m-%d %H:%M:%S %z')}"
#     post.puts "categories: "
#     post.puts "---"
#   end
# end

# # usage rake new_page[my-new-page] or rake new_page[my-new-page.html] or rake new_page (defaults to "new-page.markdown")
# desc "Create a new page in #{page_dir}/(filename)/index.#{new_page_ext}"
# task :new_page, :filename do |t, args|
#   # raise "### You haven't set anything up yet. First run `rake install` to set up an Octopress theme." unless File.directory?(page_dir)
#   args.with_defaults(:filename => 'new-page')
#   if args.filename.downcase =~ /(^.+\/)?(.+)/
#     filename, dot, extension = $2.rpartition('.').reject(&:empty?)         # Get filename and extension
#     title = filename
#     page_dir.concat($1.downcase.sub(/^\//, '').split('/')) unless $1.nil?  # Add path to page_dir Array
#     if extension.nil?
#       page_dir << filename
#       filename = "index"
#     end
#     extension ||= new_page_ext
#     # page_dir = page_dir.map! { |d| d = d.to_url }.join('/')                # Sanitize path
#     filename = filename.downcase.to_url

#     mkdir_p page_dir
#     file = "#{page_dir}/#{filename}.#{extension}"
#     if File.exist?(file)
#       abort("rake aborted!") if ask("#{file} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
#     end
#     puts "Creating new page: #{file}"
#     open(file, 'w') do |page|
#       page.puts "---"
#       page.puts "layout: page"
#       page.puts "title: \"#{title}\""
#       page.puts "date: #{Time.now.strftime('%Y-%m-%d %H:%M')}"
#       page.puts "comments: true"
#       page.puts "sharing: true"
#       page.puts "footer: true"
#       page.puts "---"
#     end
#   else
#     puts "Syntax error: #{args.filename} contains unsupported characters"
#   end
# end


# def get_stdin(message)
#   print message
#   STDIN.gets.chomp
# end

# def ask(message, valid_options)
#   if valid_options
#     answer = get_stdin("#{message} #{valid_options.to_s.gsub(/"/, '').gsub(/, /,'/')} ") while !valid_options.include?(answer)
#   else
#     answer = get_stdin(message)
#   end
#   answer
# end

task :default => :generate

desc 'Create new post with rake "post[post-name]"'
task :post, [:title] do |t, args|
  if args.title then
    new_post(args.title)
  else
    puts 'rake "post[post-name]"'
  end
end

desc 'Build site with Jekyll'
task :generate => [:clean, :scss] do
  `jekyll`
end

desc 'Generate css'
task :scss do
  `scss media/css/style.scss media/css/style.css`
end

desc 'Start server'
task :server => [:clean, :scss] do
  `jekyll server -w`
end

desc 'Deploy with rake "depoly[comment]"'
task :deploy, [:comment] => :generate do |t, args|
  if args.comment then
    `git commit . -m '#{args.comment}' && git push`
  else
    `git commit . -m 'new deployment' && git push`
  end
end

desc 'Clean up'
task :clean do
  `rm -rf _site`
end

def new_post(title)
  time = Time.now
  filename = "_posts/" + time.strftime("%Y-%m-%d-") + title + '.md'
  if File.exists? filename then
    puts "Post already exists: #{filename}"
    return
  end
  uuid = `uuidgen | tr "[:upper:]" "[:lower:]" | tr -d "\n"`
  File.open(filename, "wb") do |f|
    f << <<-EOS
---
title: #{title}
layout: post
guid: urn:uuid:#{uuid}
date: #{time.strftime("%Y-%m-%d %H:%M:%S")}
tags:
  - 
---


EOS
  %x[echo "#{filename}" | pbcopy]
  end
  puts "created #{filename}"
  `git add #{filename}`
end
