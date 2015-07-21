# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#user = CreateAdminService.new.call
#puts 'CREATED ADMIN USER: ' << user.email

def psa(ra, dec)
  ra_dec = ra.to_time.hour + (ra.to_time.min/60)
  case ra.to_time.hour
  when 0..2
    base_page = 1
    median = 1.5
  when 3..5
    base_page = 11
    median = 4.5
  when 6..8
    base_page = 21
    median = 7.5
  when 9..11
    base_page = 31
    median = 9.5
  when 12..14
    base_page = 41
    median = 13.5
  when 15..17
    base_page = 51
    median = 16.5
  when 18..20
    base_page = 61
    median = 19.5
  when 21..23
    base_page = 71
    median = 22.5
  end

  case dec.to_f
  when -89.99..-60.0
    psa_page = base_page + 9
  when -60.00..-30.0
    if ra_dec < median
      psa_page = base_page + 8
    else
      psa_page = base_page + 7
    end
  when -30.0..0.0
    if ra_dec < median + 0.33
      psa_page = base_page + 6
    else
      psa_page = base_page + 5
    end
  when 0.0..30.0
    if ra_dec < median + 0.33
      psa_page = base_page + 4
    else
      psa_page = base_page + 3
    end
  when 30.0..60.0
    if ra_dec < median + 0.33
      psa_page = base_page + 2
    else
      psa_page = base_page + 1
    end
  else
    psa_page = base_page
  end
end

def load_body(nameid, id, name_pos)
  body_array = nameid.split(';')
  body_array.each do |entry|
    entry.squeeze!(" ")
    entry.sub!("V V", "VV")
    entry.sub!("- ", "-")
    entry.sub!("- ", "-")
    entry.sub!(". ", ".")
    entry.sub!(". ", ".")
    entry.sub!("Sh2-", "Sh2 ")
    entry_array = entry.split
    if name_pos == 0
      cat_name = entry_array[0]
      cat_num = entry_array[1]
    else
      cat_name = entry_array[1]
      cat_num = entry_array[0]
    end
    Catalog.find_or_create_by(
      :catalog => cat_name,
      :catalog_num => cat_num,
      :body_id => id,
    )
  end
end
=begin
require_relative "constellation_seed.rb"
require_relative "bodytypes_seed.rb"
require_relative "body_seed.rb"
require_relative "double_seed.rb"
=end
ProgramBody.delete_all
require_relative "messier_seed.rb"
require_relative "herschel_seed.rb"
require_relative "alds_seed.rb"
