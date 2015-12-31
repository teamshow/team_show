class Article < ActiveRecord::Base
  def Article.insert(title, text, admin_name)
    @a = Article.new
    @a.title = title
    @a.content = text
    @a.admin_id = admin_name
    @a.save!
  end
  def Article.find_by_id(id)
    @a = Article.all
    @a.each do |r|
      if r.id == id
        return r
      end
    end
  end
end
