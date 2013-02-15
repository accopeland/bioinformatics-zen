def image(url,width=400,options={})
  link = "<img src='#{urlify(url)}' width=#{width}>"
  if options[:link]
    link = "<a href='#{urlify(options[:link])}'>#{link}</a>"
  end
  "<div class='centred'>#{link}</div>"
end

def youtube(video,title="YouTube")
  "<a href='http://www.youtube.com/watch?v=#{video}&amp;hd=1' id='lightbox_youtube' title='#{title}'><img src='http://img.youtube.com/vi/#{video}/0.jpg' alt='#{title}'/></a>"
end

def lightbox(image,thumbnail,width=320)
  "<div class='centred'>
      <a id='lightbox_image' href='#{urlify(image)}'>
        <img src='#{urlify(thumbnail)}' width='#{width}' />
      </a>
  </div>"
end

def poster(name)
  base = 'http://uk-me-michaelbarton.s3.amazonaws.com/posters/' + name
  lightbox(base + '/michael_barton_poster.png',
           base + '/thumb.png',
           width=320)
end
