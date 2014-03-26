#!/usr/bin/env ruby

trap("SIGINT") { puts "\n"; exit! }

require 'logger'
require 'pry'
require 'git'
require 'highline/import'

system "cd `git rev-parse --show-toplevel`"
puts '# For debugging informations about this deploy, please see'
puts "# #{Dir.pwd}/log/deploy.log\n\n"

git = Git.open Dir.pwd, log: Logger.new("#{Dir.pwd}/log/deploy.log")
heroku_remotes = git.remotes.select{|r| r.url.include? 'git@heroku'}

abort 'No heroku remote was found' if heroku_remotes.empty?

if heroku_remotes.count == 1
  @remote = heroku_remotes.first
else
  puts 'Remotes available :'
  choose do |menu|
    menu.prompt = "\nPlease choose the remote to deploy to ? "
    menu.choices *heroku_remotes.map(&:name) do |remote|
      @remote = remote
    end
  end
  puts "\n"
end

puts "Deploying branch #{git.current_branch} on #{@remote}\n"
system "git push #{@remote} #{git.current_branch}:master"
