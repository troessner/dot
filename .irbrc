require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = '~/.irb-save-history'
IRB.conf[:PROMPT_MODE] = :SIMPLE
 
# Just for Rails...
if rails_env = ENV['RAILS_ENV']
 
  require 'logger'
  unless Object.const_defined?('RAILS_DEFAULT_LOGGER')
    Object.const_set('RAILS_DEFAULT_LOGGER', Logger.new(STDOUT))
  end
  rails_root = File.basename(Dir.pwd)
  IRB.conf[:PROMPT] ||= {}
  IRB.conf[:PROMPT][:RAILS] = {
    :PROMPT_I => "#{rails_root}> ",
    :PROMPT_S => "#{rails_root}* ",
    :PROMPT_C => "#{rails_root}? ",
    :RETURN => "=> %s\n"
  }
  IRB.conf[:PROMPT_MODE] = :RAILS
 
  # Called after the irb session is initialized and Rails has
  # been loaded (props: Mike Clark).
  # IRB.conf[:IRB_RC] = Proc.new do
  # ActiveRecord::Base.logger = Logger.new(STDOUT)
  # end
end

