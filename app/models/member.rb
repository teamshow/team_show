class Member < ActiveRecord::Base
  def Member.check_membership(name, pass)
    @members = Member.all;
    @flag = 0
    @members.each do |r|
      puts r[:name], r[:passwd]
      if r[:admin_name]==name and r[:passwd]==pass
        @flag = 1
      end
    end
    return @flag
  end
end
