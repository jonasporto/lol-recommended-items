module LOLClientAPI
  module Resource
    class Champion
      extend QueryMethods
      
      OPTION_DATA = [
        :image,
        :recommended
      ]

      def image_url
        "http://ddragon.leagueoflegends.com/cdn/5.2.1/img/champion/#{image["full"]}"
      end
    end
  end
end