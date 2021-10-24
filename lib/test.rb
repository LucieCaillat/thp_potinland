require 'bundler'
Bundler.require

CSV.open("db/gossip.csv", "a") do |csv|
    csv << ["blanc", 3]
end


