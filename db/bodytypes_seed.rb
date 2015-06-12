BodyType.delete_all
#ActiveRecord::Base.connection.execute("TRUNCATE TABLE  body_types")
open ("public/data/object_types.csv") do |types|
  types.read.each_line do |type|
    bodytype_id, abbr, name = type.chomp.split(",")
    BodyType.find_or_create_by(:id => bodytype_id, :abbr => abbr, :description => name)
  end
end