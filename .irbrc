IRB.conf[:PROMPT_MODE]  = :SIMPLE
IRB.conf[:USE_READLINE] = true
IRB.conf[:AUTO_INDENT]=true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

begin
  require 'hirb'
rescue LoadError => e
  puts "Gems missing: #{e}"
end

Hirb.enable
extend Hirb::Console

# Clear the screen
def clear
  system 'clear'
end

# Shortcuts
alias c clear

def load_test_env_nexus
  $LOAD_PATH.unshift('.')
  Bundler.require :test
  require 'spec/spec_helper'
end
