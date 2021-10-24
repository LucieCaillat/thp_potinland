require 'bundler'
Bundler.require
require_relative 'gossip'
require_relative 'view'


class Controller

    def initialize
        @view = View.new
    end

    def create_gossip
        params = @view.create_gossip_view
        gossip = Gossip.new( params[:author], params[:content])

        gossip.save

    end

    def index_gossips
        @view.index_gossips_view(Gossip.all) #@view => pour appeler la méthode index_gossips view, Gossip.all => qui fait appel à self.all dans Gossip qui renvoi un array avec des id de gossip
        
    end

    def delete_gossip
        Gossip.delete_gossip_in_csv(@view.choice_for_delete_gossip(Gossip.all))
        #On pourait aussi ecrire:
            # array_gossips_to_dispay = Gossip.all
            # choice = @view.choice_for_delete_gossip(array_gossips_to_dispay)
            # Gossip.delete_gossip_in_csv(choice)
        
    end
end
        
