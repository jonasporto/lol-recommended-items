module LOLClientAPI
  module Model
    class Champion < Resource::Champion
      attr_accessor :id, :name, :title, :image
    end
  end
end
