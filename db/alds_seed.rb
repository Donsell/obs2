File.open("program_errors.txt", 'w') do |errors|
  open("public/data/alds.csv") do |dblstars|
    dblstars.read.each_line do |dblstar|
      name, catalog_num, catalog = dblstar.chomp.split(",")
      bodies = Catalog.where(catalog: catalog.chomp, catalog_num: catalog_num.upcase.chomp).limit(1)
      if bodies.count > 0
  	    bodies.each do |body|
  	      ProgramBody.find_or_create_by(program_id: 3, body_id: body.body_id, name: name)
  	    end
      else
     		errors << "#{'catalog: ' + catalog + ' catalog num: ' + catalog_num}"
        errors << "\n"
   		end
    end
  end
end
