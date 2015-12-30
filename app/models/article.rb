class Article < ActiveRecord::Base
  def Article.insert(title, text, admin_name)
    @a = Article.new
    @a.title = title
    @a.content = text
    @a.admin_id = admin_name
    @a.save!
  end
end
