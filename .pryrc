# !!! To install all dependencies: !!!
# gem install pry pry-rails pry-plus awesome_print hirb pry-debugger

# !!! Stolen from https://github.com/dotphiles/dotphiles/blob/master/ruby/pryrc !!!

# === EDITOR ===
Pry.editor = 'vi'

# == Pry-Nav - Using pry as a debugger ==
Pry.commands.alias_command 'c', 'continue' rescue nil
Pry.commands.alias_command 's', 'step' rescue nil
Pry.commands.alias_command 'n', 'next' rescue nil

# === History ===
Pry.config.history.file = File.expand_path('~/.history/ruby')

# === CUSTOM PROMPT ===
# This prompt shows the ruby version (useful for RVM)
prompt_proc = lambda do |obj, nest_level, _|
  ruby_info = ""
  ruby_info << "#{Rails.version}@" if defined?(Rails)
  ruby_info << RUBY_VERSION
  ruby_info = "\e[32m#{ruby_info}\e[0m"
  nest_info = "#{nest_level}"
  obj_info  = "\e[33m#{obj}\e[0m"
  "[#{ruby_info}] #{nest_info}:(#{obj_info}) > "
end

Pry.prompt = [prompt_proc, prompt_proc]

# === Listing config ===
# Better colors - by default the headings for methods are too
# similar to method name colors leading to a "soup"
# These colors are optimized for use with Solarized scheme
# for your terminal
Pry.config.ls.separator = "\n" # new lines between methods
Pry.config.ls.heading_color = :magenta
Pry.config.ls.public_method_color = :green
Pry.config.ls.protected_method_color = :yellow
Pry.config.ls.private_method_color = :bright_black

# == PLUGINS ===
# awesome_print gem: great syntax colorized printing
# look at ~/.aprc for more settings for awesome_print
begin
  require 'awesome_print'
  # The following line enables awesome_print for all pry output,
  # and it also enables paging
  Pry.config.print = proc {|output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output)}

  # If you want awesome_print without automatic pagination, use the line below
  # Pry.config.print = proc { |output, value| output.puts value.ai }
rescue LoadError => err
  puts "gem install awesome_print  # <-- highly recommended"
end

# !!! Hirb set up !!!

begin
  require 'hirb'
rescue LoadError
  # Missing goodies, bummer
end

if defined? Hirb
  # Slightly dirty hack to fully support in-session Hirb.disable/enable toggling
  Hirb::View.instance_eval do
    def enable_output_method
      @output_method = true
      @old_print = Pry.config.print
      Pry.config.print = proc do |output, value|
        Hirb::View.view_or_page_output(value) || @old_print.call(output, value)
      end
    end

    def disable_output_method
      Pry.config.print = @old_print
      @output_method = nil
    end
  end

  Hirb.enable
end
