module DefaultHelpers

  def amzn(file)
    File.join "http://s3.amazonaws.com/bioinformatics-zen/", file
  end

  def pretty_date(item)
    Time.parse(item).strftime('%a %B %e %Y')
  end
  
  def articles_by_year
    blog.articles.group_by {|a| a.date.year }
  end

  def page_title
    title = "Bioinformatics Zen"
    if current_page.respond_to? :title
      title += " - " + current_page.title
    end
    title
  end

end
