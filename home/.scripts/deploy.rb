#!/usr/bin/env ruby

require 'logger'
require 'pry'
require 'git'
require "highline/import"

git = Git.open Dir.pwd
heroku_remotes = git.remotes.select{|r| r.url.include? 'git@heroku.com:'}

if heroku_remotes.empty?
  abort 'No heroku remote was found'
end

choose do |menu|
  menu.prompt = "Please choose the remote to deploy to ? "

  menu.choices *heroku_remotes.map(&:name) do |remote|
    git.push remote
  end
end
