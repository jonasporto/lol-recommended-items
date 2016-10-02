module LOLClientAPI
  module Resource
    module QueryMethods
      def attr_accessor(*vars)
        @attributes ||= []
        @attributes.concat vars
        super(*vars)
      end

      def attributes
        @attributes || []
      end

      def all(*options)
        @all ||= find_all(fetch_options(options)).map do |key, response|
          bind_response(response)
        end
      end

      def find(id)
        response = find_by_id(id)
        bind_response(response)
      end

      private

      def client
        @client ||= Client.new
      end

      def callee_class
        Object.const_get(name)
      end

      def find_all(options = {})
        client.get(endpoint: endpoint, data: options)["data"]
      end

      def find_by_id(id)
        client.get(endpoint: endpoint + "/#{id}")
      end

      def fetch_options(options)
        {
          champData: options.select{ |opt| callee_class::OPTION_DATA.include? opt }.join(',')
        } if options
      end

      def endpoint
        callee_class.to_s.downcase.split('::').last
      end

      def bind_response(response)
        callee_class.new.tap do |model|
          model.class.attributes.each do |attribute|
            model.instance_variable_set("@#{attribute}", response[attribute.to_s])
          end
        end
      end
      
    end
  end
end
