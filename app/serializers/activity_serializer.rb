class ActivitySerializer < ActiveModel::Serializer
  attributes :id,:name
  belongs_to :ground 


  def ground
    object.ground.slice(:id, :name)
  end
  
end
