require 'bundler'
Bundler.require

class View
 
    def create_gossip_view
        system("clear")
        puts "\nQuel potin voulez vous écrire?"
        print "=> "
        content_to_save = gets.chomp
        puts "\nEt qui en est l'auteur ?"
        print "=> "
        author_to_save = gets.chomp
        return {author: author_to_save , content: content_to_save}
    end

    def index_gossips_view(array_gossips_to_dispay)
        system("clear")
        if array_gossips_to_dispay == [] #teste s'il ni a pas de gossip à afficher
            puts "Désolée, il n'y a pas de potins à afficher"
        else
            array_gossips_to_dispay.each do |each_gossip|
                puts "\nDe #{each_gossip.author}  :  \"#{each_gossip.content}\" "
            end
        end
    end

    def choice_for_delete_gossip(array_gossips_to_dispay) #en varrible d'entré je vais réutiliser Gossip.all
        system("clear") # je commence par présenter les potins à supprimer :
        number = 1 # je crée une variable number pour l'affichage
        array_number_choice = [] # cette array va me servire pour tester les choix possibles que l'utilisteur va pouvoir renter
        array_gossips_to_dispay.each do |each_gossip| #petite boucle each sur chaque potin 
            puts " #{number}- \"#{each_gossip.content}\" de #{each_gossip.author}  " #affiche chaque potin avec un number devant
            array_number_choice<< number #rajoute le numéro dans l'array_number_choice
            number += 1 #incremente number
        end
        while true
            if array_number_choice == []
                puts "\n Désolée, il n'y a plus de gossip à suprimer "  
                return 0
            end
            while true
                puts "\nQuel gossipe voulez vous suprimer?"
                print "=> "
                choice = gets.chomp.to_i 
                array_number_choice.each do |number|
                    if number == choice
                        system("clear")
                        puts "\n Le potin a bien été suprimé !"
                        return choice                            
                    end
                        
                end
                puts "\nJe n'ai pas compris quel potin vous voulez suprimer (tapez le numéro du potin)"
            end                   
                
            
        end
    end
        


end 

