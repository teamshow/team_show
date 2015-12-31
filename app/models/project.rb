class Project < ActiveRecord::Base
  def Project.insert(title, text)
    @a = Project.new
    @a.name = title
    @a.description = text
    @a.save!
  end
  def Project.find_by_id(id)
    @a = Project.all
    @a.each do |r|
      if r.id == id
        return r
      end
    end
  end
end
