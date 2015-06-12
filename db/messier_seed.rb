# Load ProgramsBodies
ProgramBody.delete_all
#ActiveRecord::Base.connection.execute("TRUNCATE TABLE  program_bodies")
bodies = Catalog.where(catalog: "M").order(:catalog_num)
bodies.each do |body|
  ProgramBody.find_or_create_by(:program_id => 1, :body_id => body.id, :name => body.catalog + ("000" + body.catalog_num).split(//).last(3).join)
end