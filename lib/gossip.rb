require 'bundler'
Bundler.require
#require 'pry'

class Gossip
    attr_reader :author , :content    

    def initialize (author_to_save , content_to_save)
        @author = author_to_save
        @content =content_to_save
    end

    def save 
        CSV.open("db/gossip.csv", "a") do |file|
            file << [@author, @content]
        end
    end

    def self.all
        array_all_gossips = []
        CSV.read("db/gossip.csv").each do |ligne|
            gossip_provisoire = Gossip.new(ligne[0] , ligne[1])
            array_all_gossips<< gossip_provisoire
        end
        array_all_gossips.delete_at(0)  #Je suprime la premiére ligne de l'array car ça correspon à mes têtes de colonne dans mon fichier CSV(author et content)
        return array_all_gossips
    end
    
    def self.delete_gossip_in_csv(choice)
        file_csv = CSV.read("db/gossip.csv")
        if choice == 0  # ici le choice 0 correspond au cas où il n'y a rien à effacer 
            return
        else  # Tous les autres choix corresponde bien à une ligne du tableau cf choice_for_delete_gossip dans View
            file_csv.delete_at(choice) 
            file_csv.delete_at(0)
        end
        CSV.open("db/gossip.csv", "w") do |file| # ici je réécris completement le csv (option "w") avec l'entête de mon fichier csv
            file << ["author","content"]
        end
        file_csv.each do |ligne|
            CSV.open("db/gossip.csv", "a") do |file| # je rajoute toutes les autres lignes avec l'array modifié "file_csv"
                 file << ligne
            end
        end
    end
end

#binding.pry