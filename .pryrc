Pry::Commands.delete 'c'
Pry::Commands.delete 'n'
Pry::Commands.delete 's'
Pry::Commands.delete 'f'

Pry.commands.alias_command 'c', 'continue' rescue nil
Pry.commands.alias_command 's', 'step' rescue nil
Pry.commands.alias_command 'n', 'next' rescue nil

Pry.editor = 'vi'
