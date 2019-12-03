require "tty-prompt"
require "tty-font"

PROMPT = TTY::Prompt.new
# CLEAR = "\e[H\e[2J"

def header
  font = TTY::Font.new(:standard)
  pastel = Pastel.new
  puts pastel.blue(font.write("Placeholder"))
end