#!/usr/bin/env ruby

trap("SIGINT") { puts "\n"; exit! }

require 'logger'
require 'git'
require 'highline/import'
require 'optparse'
require 'optparse/time'
require 'ostruct'
require 'pp'

class OptionsParser
  CODES = %w[iso-2022-jp shift_jis euc-jp utf8 binary]
  CODE_ALIASES = { "jis" => "iso-2022-jp", "sjis" => "shift_jis" }

  def self.parse(args)
    # The options specified on the command line will be collected in *options*.
    # We set default values here.
    options = OpenStruct.new
    options.filter_host = 'git@heroku'

    opts = OptionParser.new do |opts|
      opts.banner =   "Usage: deploy [options] [remote]"
      opts.banner +=  "\nWill deploy current branch on remote"

      opts.separator ""
      opts.separator "Specific options:"

      # Optional argument with keyword completion.
      opts.on('-f', "--filter [PATTERN]", "Filter remotes urls with PATTERN", "  default: git@heroku") do |t|
        options.filter_host = t
      end

      opts.separator ""
      opts.separator "Common options:"

      # No argument, shows at tail.  This will print an options summary.
      # Try it and see!
      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end

      # Another typical switch to print the version.
      opts.on_tail("--version", "Show version") do
        puts OptionParser::Version.join('.')
        exit
      end
    end

    opts.parse!(args)
    options
  end  # parse()
end

def are_you_sure?( question )
  print "#{question} [y/n]: "
  if gets.strip.downcase =~ /^(y|yes)$/
    return true
  else
    return false
  end
end

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
    menu.prompt = "\nPlease choose the remote to deploy to : "
    menu.choices *heroku_remotes.map(&:name) do |remote|
      @remote = remote
    end
  end
end

if are_you_sure? "Deploying branch #{git.current_branch} on #{@remote} ?"
  system "git push #{@remote} #{git.current_branch}:master"
else
  abort 'Nothing was made. Keep cool :)'
end
