# ---------------- Required Files ----------------
require "tty-prompt"
require "tty-font"
# ----------------- Constants --------------------
PROMPT = TTY::Prompt.new
CLEAR = "\e[H\e[2J"
# ------------------ Header ----------------------
def header
  font = TTY::Font.new(:standard)
  pastel = Pastel.new
  puts pastel.blue(font.write("Nerds World Domination"))
end
# --------------- Player --------------------------
puts CLEAR
def start_screen
  header
  start_choice = PROMPT.select("Choose start to start your adventure") do |option|
  option.choice 'Start', 1
  option.choice 'Exit', 2
  end
  if start_choice == 1
    puts CLEAR
    header
    get_player_name
  else
    puts CLEAR
    exit
  end
end

def get_player_name
  player_name = PROMPT.ask("Greetings Adventurer! Welcome to 'Revenge of the Nerds: WORLD DOMINATION'. You are a NERD whose purpose is to seek revenge and dominate. Before you can start your adventure, please input your name.", default: ENV["User"])
  main_menu
end

def return_to_main_menu
  main_menu
end

# ---------------- Main Menu --------------------------------------
def main_menu
  puts CLEAR
  header
  main_menu_choice = PROMPT.select("What would you like to do?") do |menu|
  menu.choice 'Option 1', 1
  menu.choice 'Option 2', 2
  menu.choice 'Exit', 3
  end
  if main_menu_choice == 1
    puts CLEAR
    header
    p "option_one_menu"
  elsif main_menu_choice == 2
    puts CLEAR
    header
    p "option_two_menu"
  elsif main_menu_choice == 3
    puts CLEAR
    exit
  end
end