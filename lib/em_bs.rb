module EmBs

   @@obj = []
   @@sub = []
  def objects=param
    @@obj.push User.find(param[:assign_to].to_i)
    @@sub.push param[:name]
  end

  def user_objects
      @@obj
  end

  def title
    @@sub
  end
  ActionView::Base.send :include , EmBs
end