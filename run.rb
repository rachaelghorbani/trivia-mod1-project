require_relative './config/environment'
require "pry"
system "clear"

cli = CLI.new

cli.clear
# font = TTY::Font.new(:standard)
# pastel = Pastel.new
# puts pastel.cyan(font.write("TRIVIA", letter_spacing: 1))

player = cli.welcome

until player.class == User
    player = cli.welcome
end 

sleep(1)
choice = cli.menu

until choice == "Exit" do
    cli.clear 
    if choice == "PLAY"
        menu_input = cli.play(player)
        until menu_input == "Main Menu"
            cli.play(player)
            menu_input = cli.play
        end
        choice = cli.menu
    elsif choice == "Profile Settings"
        # cli.profile(player)
        # choice = cli.menu
        menu_input = cli.profile(player)
        until menu_input == "Main Menu"
            cli.profile(player)
            menu_input = cli.profile(player)
        end
        choice = cli.menu
    elsif choice == "View Leader Boards"
        menu_input = cli.leader_board(player)
        until menu_input == "Main Menu"
            cli.leader_board(player)
            menu_input = cli.leader_board(player)
        end
        choice = cli.menu
    end
  end 
cli.exit_trivia(player)
#Pry.start

