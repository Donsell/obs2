Constellation.delete_all
#ActiveRecord::Base.connection.execute("TRUNCATE TABLE  constellations")
open ("public/data/constellations.csv") do |constellations|
  constellations.read.each_line do |constellation|
    constellation_id, abbr, name, genitive = constellation.chomp.split(",")
    Constellation.find_or_create_by(:id => constellation_id, :abbr => abbr.humanize, :constellation => name.titleize, :genitive => genitive.titleize)
  end
end