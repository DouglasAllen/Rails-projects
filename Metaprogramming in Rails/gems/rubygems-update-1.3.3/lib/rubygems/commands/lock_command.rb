#---
# Excerpted from "Metaprogramming Ruby: Program Like the Ruby Pros",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr for more book information.
#---
require 'rubygems/command'

class Gem::Commands::LockCommand < Gem::Command

  def initialize
    super 'lock', 'Generate a lockdown list of gems',
          :strict => false

    add_option '-s', '--[no-]strict',
               'fail if unable to satisfy a dependency' do |strict, options|
      options[:strict] = strict
    end
  end

  def arguments # :nodoc:
    "GEMNAME       name of gem to lock\nVERSION       version of gem to lock"
  end

  def defaults_str # :nodoc:
    "--no-strict"
  end

  def description # :nodoc:
    <<-EOF
The lock command will generate a list of +gem+ statements that will lock down
the versions for the gem given in the command line.  It will specify exact
versions in the requirements list to ensure that the gems loaded will always
be consistent.  A full recursive search of all effected gems will be
generated.

Example:

  gemlock rails-1.0.0 > lockdown.rb

will produce in lockdown.rb:

  require "rubygems"
  gem 'rails', '= 1.0.0'
  gem 'rake', '= 0.7.0.1'
  gem 'activesupport', '= 1.2.5'
  gem 'activerecord', '= 1.13.2'
  gem 'actionpack', '= 1.11.2'
  gem 'actionmailer', '= 1.1.5'
  gem 'actionwebservice', '= 1.0.0'

Just load lockdown.rb from your application to ensure that the current
versions are loaded.  Make sure that lockdown.rb is loaded *before* any
other require statements.

Notice that rails 1.0.0 only requires that rake 0.6.2 or better be used.
Rake-0.7.0.1 is the most recent version installed that satisfies that, so we
lock it down to the exact version.
    EOF
  end

  def usage # :nodoc:
    "#{program_name} GEMNAME-VERSION [GEMNAME-VERSION ...]"
  end

  def complain(message)
    if options[:strict] then
      raise Gem::Exception, message
    else
      say "# #{message}"
    end
  end

  def execute
    say "require 'rubygems'"

    locked = {}

    pending = options[:args]

    until pending.empty? do
      full_name = pending.shift

      spec = Gem::SourceIndex.load_specification spec_path(full_name)

      if spec.nil? then
        complain "Could not find gem #{full_name}, try using the full name"
        next
      end

      say "gem '#{spec.name}', '= #{spec.version}'" unless locked[spec.name]
      locked[spec.name] = true

      spec.runtime_dependencies.each do |dep|
        next if locked[dep.name]
        candidates = Gem.source_index.search dep

        if candidates.empty? then
          complain "Unable to satisfy '#{dep}' from currently installed gems"
        else
          pending << candidates.last.full_name
        end
      end
    end
  end

  def spec_path(gem_full_name)
    gemspecs = Gem.path.map do |path|
      File.join path, "specifications", "#{gem_full_name}.gemspec"
    end

    gemspecs.find { |gemspec| File.exist? gemspec }
  end

end

