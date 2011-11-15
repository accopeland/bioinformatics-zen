include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::LinkTo
include Nanoc3::Helpers::Blogging

def urlify(url)
  url =~ /http:/ ? url : relative_path_to(url)
end

def dbx(file)
  File.join "http://dl.dropbox.com/u/24366/bioinformatics-zen/", file
end

def amzn(file)
  File.join "http://s3.amazonaws.com/bioinformatics-zen/", file
end

def stylesheet(location, media = 'screen,projection')
  "<link href='#{location}' media='#{media}' rel='stylesheet' type='text/css'>"
end

def highlight
  "<pre class=\"prettyprint\">"
end

def endhighlight
  "</pre>"
end

def scripts
  return unless @site.config[:scripts]
  output = String.new
  @site.config[:scripts].each do |script|
    script = relative_path_to(script) unless script =~ /^http/
    output << "<script src='#{script}' type='text/javascript'></script>\n"
  end
  output
end

def stylesheets
  return unless @site.config[:stylesheets]
  output = String.new
  @site.config[:stylesheets].each do |sheet,media|
    sheet = sheet.to_s
    sheet = relative_path_to(sheet) unless sheet =~ /^http/
    output << stylesheet(sheet,media) + "\n"
  end
  output
end

def favicon
  if @site.config[:site][:favicon]
    return "<link href='#{@site.config[:site][:favicon]}' rel='shortcut icon' >"
  end
end

def site_title
 [@item[:title],@site.config[:title],@site.config[:name]].compact.uniq * " | "
end

def time_for(time)
  Time.parse(time).xmlschema
end

def pretty_date(item)
  Time.parse(item[:created_at]).strftime('%b %d %y')
end

def js(source)
  "<script src='#{source}' type='text/javascript'></script>"
end

def image(url,width=400,options={})
  link = "<img src='#{urlify(url)}' width=#{width}>"
  if options[:link]
    link = "<a href='#{urlify(options[:link])}'>#{link}</a>"
  end
  link
end

def youtube(video,title="YouTube")
  "<a href='http://www.youtube.com/watch?v=#{video}&hd=1' id='lightbox_youtube' title='#{title}'><img src='http://img.youtube.com/vi/#{video}/0.jpg' alt='#{title}'/></a>"
end

def lightbox(image,thumbnail)
  "<ul class='media-grid'>
    <li>
      <a id='lightbox_image' href='#{urlify(image)}'>
        <img src='#{urlify(thumbnail)}' width=320 />
      </a>
    </li>
  </ul>"
end
