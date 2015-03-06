module BodiesHelper
  def format_declination(*args)

    dec_str = args.first.to_s
    dec_arr = dec_str.split('.') 
    sprintf("%02d\xC2\xB0 %02d\" %02d\'", dec_arr[0].to_i, dec_arr[1].to_i, 0)
  end

  def format_ra(*args)
	 args.first.strftime("%Hh %Mm %Ss")  	
  end

  def format_size(arg1)
    max_arr = arg1.split(' ')
    case max_arr[1]
    when "d"
        maj = '\xC2\xB0'
        mnr = '\''
    when "m"
        maj = '\''
        mnr = '"'
    when "s"
        maj = '"'
        mnr = nil
    else
        maj = '"'
        mnr = nil
    end
    if mnr != nil && max_arr[0].sub!(".", maj) != nil 
      max_arr = max_arr[0].split(maj)
      if max_arr[1].to_i < 10
        max_arr[1] = ((max_arr[1].to_f / 10) * 60).to_i.to_s
      else
        max_arr[1] = ((max_arr[1].to_f / 100) * 60).to_i.to_s
      end  
      #max_arr[1] = sprintf("%02f", (max_arr[1].to_i / 60))
      #max_arr[1]
      max_arr = max_arr[0] + maj + max_arr[1] + mnr
    else
      max_arr[0] = max_arr[0] + maj
    end


    #sprintf("%0.2f%s", max_arr[0].to_f, maj)
  end
end
