module LOLClientAPI
  module Model
    class Item < Resource::Item
      attr_accessor :id, :name, :description, :plaintext
    end
  end
end
