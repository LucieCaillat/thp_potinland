require 'bundler'
Bundler.require

require_relative 'controller'

class Router

    def initialize
        @controller = Controller.new
    end

    def perform
        puts "Bienvenue dans the gossip project".upcase
        while true
            puts "\n## Tu veux faire quoi jeune mouss' ?"
            puts "\n1) créer un gossip"
            puts "2) afficher tous les potins"
            puts "3) suprimer un potin"
            puts "4) quitter l'app"
            print "=> "
            choice =gets.chomp

            case choice 
            when "1"
                puts "\nTu as choisi de créer un gossip" 
                sleep(1)
                @controller.create_gossip
            when "2"
                puts "\nTu as choisi d'afficher tous les potins:"
                sleep(1)
                @controller.index_gossips
            when "3"
                puts "\Tu as choisi de suprimer un potin"
                sleep(1)
                @controller.delete_gossip
            when "4"
                puts "\nÀ bientôt !"
                sleep(1)
                break  
                                
            else
                puts "Ce choix n'existe pas, merci de ressayer"  
                
            end 
            
        end
    end

end

