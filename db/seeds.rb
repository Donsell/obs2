open ("public/data/Hearsch.csv") do |herschs|
  herschs.read.each_line do |hersch|
    body = Catalog.where(catalog: "NGC", catalog_num: hersch.chomp).limit(1)
    ProgramBody.create(:program_id => 2, :body_id => body[0].body_id, :name => body[0].catalog + ("0000" + body[0].catalog_num).split(//).last(4).join)
  end
end
