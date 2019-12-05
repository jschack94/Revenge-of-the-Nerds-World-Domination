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
# ------------------ Start Here -----------------------
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
    language_menu
  else
    puts CLEAR
    exit
  end
end

def language_menu
  puts CLEAR
  header
  language_choice = PROMPT.select("Language?") do |option|
    option.choice "English", 1
    option.choice "Korean", 2
    option.choice "Spanish", 3
    option.choice "French", 4
    option.choice "Exit", 5
  end
  if language_choice == 1
    puts CLEAR
    header
    character_name
  elsif language_choice == 2
    puts CLEAR
    header
    puts "404: 데이터베이스에서 언어 지원을 찾을 수 없으며 향후에는 구현되지 않을 것입니다. 당신은 영어에 붙어 있다고 생각합니다."
    character_name
  elsif language_choice == 3
    puts CLEAR
    header
    puts "404: Lo sentimos, el soporte de idiomas no se encuentra en nuestras bases de datos y probablemente no se implementará en el futuro. Supongo que estás atrapado con el inglés."
    character_name
  elsif language_choice == 4
    puts CLEAR
    header
    puts "404: Désolé, le support linguistique n’a pas été trouvé dans nos bases de données et ne sera probablement pas implémenté à l’avenir. Je suppose que vous êtes coincé avec l'anglais"
    character_name
  elsif language_choice == 5
    puts CLEAR
    exit
  end
end
def return_to_main_menu
  main_menu
end
# --------------- Player --------------------------
def find_or_create_player(character_name)
  current_character = Player.create(name: character_name, species: "NERD", hp: 8, iq: 9, str: 4, lk: 3)
  p current_character
end

def character_name
  PROMPT.ask("Greetings Adventurer! Welcome to 'Revenge of the Nerds: WORLD DOMINATION'. You are a NERD whose purpose is to seek revenge and dominate. Before you can start your adventure, please input your name.", default: "Sheldon")
  character_skills_menu
end

def character_skills_menu
  character_skills_choice = PROMPT.select("Would you like to customize your skills or choose default?") do |option|
    option.choice "Customize", 1
    option.choice "I'm not creative, please do all the thinking for me.", 2
    option.choice "Exit", 3
  end
  if character_skills_choice == 1
    puts CLEAR
    header
    skills_creation_menu
  elsif character_skills_choice == 2
    puts CLEAR
    header
    puts "Your default skills are: Lab Experiment, Fetal Position, I'm rubber, and you're glue!"
    character_stats_menu
  elsif character_skills_choice == 3
    puts CLEAR
    exit
  end
end

def skills_creation_menu
  puts CLEAR
  header
  PROMPT.collect do
    key(:attack).ask('What would you like to call your attack skill?', required: true)
    key(:defense).ask('What would you like to call your defense skill?', require: true)
    key(:wildcard).ask('What would you like to call your wildcard?', required: true)
  end
  character_stats_menu
end

def character_stats_menu
  character_stats_choice = PROMPT.select("Would you like assign your stats or choose default") do |option|
    option.choice 'Assign my candies', 1
    option.choice "I'm still too scared to do anything on my own 😭", 2
    option.choice 'Exit', 3
  end
  if character_stats_choice == 1
    puts CLEAR
    header
    stats_assignment_menu
  elsif character_stats_choice == 2
    puts CLEAR
    header
    character_review_menu
  elsif
    character_stats_choice == 3
    puts CLEAR
    exit
  end
end

def stats_assignment_menu
  # S O S
end

def character_review_menu(character_name, character_skills, character_stats)
  # for later
end
# ---------------- Main Menu --------------------------------------
def main_menu ##for add-ons
  puts CLEAR
  header
  main_menu_choice = PROMPT.select("What would you like to do?") do |option|
  option.choice 'Option 1', 1
  option.choice 'Option 2', 2
  option.choice 'Exit', 3
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