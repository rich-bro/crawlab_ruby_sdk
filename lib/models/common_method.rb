class CommentMethod

  # 页面503 需要验证时 获取cookie
  def self.chk_jschl(params)
    cxt = V8::Context.new
    url = params[:url]
    sub_site_url = params[:sub_site_url]
    header = params[:header]

    conn = Faraday.new(:url => url)
    res = conn.get do |req|
      req.url url
      req.headers = header
    end
    cookie = res.headers["set-cookie"].split(";")[0]
    doc = Hpricot(res.body)
    k_pre = doc.to_s.match(/k = \'(.*?)\';/)[1] rescue nil
    k_int= doc.to_s.match(/;k\+=(.*?);/)[1] rescue nil
    k_int = cxt.eval(k_int).to_s
    p = doc.search("##{k_pre+k_int}").inner_html rescue nil
    line1 = doc.to_s.match(/var s,t,o,p.*?,f(.+?);/).to_s
    line2 = doc.to_s.match(/;(.+?); '; 121'/)[1].to_s.gsub("t.length", sub_site_url.size.to_s).gsub("a.value = ", "") rescue ""
    # line2 = doc.to_s.match(/;(.+?); '; 121'/)[1].to_s
    line3 = line2.gsub(/function\(p\)\{var .*?return \+\(p\)}\(\)/,"+(#{p})")
    line4 = line3.gsub(/function\(p\).*?\)\);/,"'#{sub_site_url}'.charCodeAt(1)));")
    jschl_answer = cxt.eval(line1+line4).to_s

    r = doc.search("input[@name=r]")[0][:value]
    jschl_vc = doc.search("input[@name=jschl_vc]")[0][:value]
    pass = doc.search("input[@name=pass]")[0][:value]

    # form_params = doc.search("form#challenge-form input").map{|x| [x["name"],x["value"]]}.to_h
    # form_params["jschl_answer"] = jschl_answer if jschl_answer.present?
    # query = URI.encode_www_form(form_params)

    query = URI.encode_www_form([['r', r], ['jschl_vc', jschl_vc], ['pass', pass], ['jschl_answer', jschl_answer],['cf_ch_verify','plat']])


    link = doc.search("form#challenge-form")[0]["action"]
    sleep 4
    res1 =  conn.post do |req|
      req.url link
      req.headers = header
      req.headers["cookie"]= cookie
      req.body = query
    end
    res1.headers["set-cookie"]

    if res1.headers["set-cookie"].nil?
      return nil
    else
      cf_clearance = res1.headers["set-cookie"].split(";")[0].split("=")[1]
      cookie += "; cf_clearance=#{cf_clearance}"
      return cookie
    end
  end


  def self.get_email(encode_email)
    cxt = V8::Context.new
    js_str = "function r(e, t) {\n\tvar r = e.substr(t, 2);\n\treturn parseInt(r, 16)\n}\n\nfunction n(n, c) {\n\t\tfor (var o = \"\", a = r(n, c), i = c + 2; i < n.length; i += 2) {\n\t\t\tvar l = r(n, i) ^ a;\n\t\t\to += String.fromCharCode(l)\n\t\t}\n\t\ttry {\n\t\t\to = decodeURIComponent(escape(o))\n\t\t} catch (u) {\n\t\t\te(u)\n\t\t}\n\t\treturn o\n}\n\n\nn(\"#{encode_email}\",28)"
    email = cxt.eval(js_str) rescue nil
    return email
  end

  def self.get_token(ts)
    secret = "henttlxnn"
    key = "getsetredis"
    Digest::MD5.hexdigest("#{key}#{secret}#{ts}")
  end

  def self.french_month(month)
    {
      "janvier" => "January",
      "février" => "February",
      "mars" => "March",
      "avril" => "April",
      "mai" => "May",
      "juin" => "June",
      "juillet" => "July",
      "août" => "August",
      "aout" => "August",
      "septembre" => "September",
      "octobre" => "October",
      "novembre" => "November",
      "décembre" => "December",
    }[month]
  end

  def self.es_month(month)
    {
      "enero"=> "January",
      "febrero"=> "February",
      "marzo"=> "March",
      "abril"=> "April",
      "mayo"=>  "May",
      "junio"=> "June",
      "julio"=> "July",
      "agosto"=>  "August",
      "septiembre"=>  "September",
      "octubre"=> "October",
      "noviembre"=> "November",
      "diciembre"=> "December"
    }[month]
  end

  def self.it_month(month)
    {
      "gennaio"=> "January",
      "febbraio"=>  "February",
      "marzo"=> "March",
      "aprile"=>  "April",
      "maggio"=>  "May",
      "giugno"=>  "June",
      "luglio"=>  "July",
      "agosto"=>  "August",
      "settembre"=> "September",
      "ottobre"=> "October",
      "novembre"=>  "November",
      "dicembre"=>  "December"
    }[month]
  end

  def self.es_simple_month(month)
    {
      "ene"=> "January",
      "feb"=> "February",
      "mar"=> "March",
      "abr"=> "April",
      "may"=> "May",
      "jun"=> "June",
      "jul"=> "July",
      "ago"=> "August",
      "sep"=> "September",
      "oct"=> "October",
      "nov"=> "November",
      "dic"=> "December"
    }[month]
  end

  def self.ar_month(month)
    {
      "يناير"=> "January",
      "فبراير"=>  "February",
      "مارس"=>  "March",
      "أبريل"=> "April",
      "مايو"=>  "May",
      "يونيو"=> "June",
      "يوليو"=> "July",
      "أغسطس"=> "August",
      "سبتمبر"=>  "September",
      "أكتوبر"=>  "October",
      "نوفمبر"=>  "November",
      "ديسمبر"=>  "December"
    }[month]
  end

  def self.ar_month2(month)
    {
      "جانفي"=> "January",
      "فيفري"=> "February",
      "مارس"=>  "March",
      "أفريل"=> "April",
      "ماي"=> "May",
      "جوان"=>  "June",
      "جويلية"=>  "July",
      "أوت"=> "August",
      "سبتمبر"=>  "September",
      "أكتوبر"=>  "October",
      "نوفمبر"=>  "November",
      "ديسمبر"=>  "December"
    }[month]
  end


  def self.th_month(month)
    {"มกราคม"=>"01", "กุมภาพันธ์"=>"02", "มีนาคม"=>"03", "เมษายน"=>"04", "พฤษภาคม"=>"05", "มิถุนายน"=>"06", "กรกฎาคม"=>"7", "สิงหาคม"=>"08", "กันยายน"=>"09", "ตุลาคม"=>"10", "พฤศจิกายน"=>"11", "ธันวาคม"=>"12"}[month]
  end

  def self.id_month(month)
    {
      "Januari" => "January",
      "Februari" => "February",
      "Maret" => "March",
      "April" => "April",
      "Mei" => "May",
      "Juni" => "June",
      "Juli" => "July",
      "Agustus" => "August",
      "September" => "September",
      "Oktober" => "October",
      "November" => "November",
      "Desember" => "December",
    }[month]
  end

  def self.th_year(year)
    year = year.to_i - 543
    return year
  end

  def self.ru_month(month)
    months = {
      'января'=> 'January',
      'февраля'=> 'February',
      'марта'=> 'March',
      'апреля'=> 'April',
      'мая'=> 'May',
      'июня'=> 'June',
      'июля'=> 'July',
      'августа'=> 'August',
      'сентября'=> 'September',
      'октября'=> 'October',
      'ноября'=> 'November',
      'декабря'=> 'December'
    }[month]
  end

end
