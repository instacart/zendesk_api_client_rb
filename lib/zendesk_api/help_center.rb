require 'zendesk_api/client'

module ZendeskAPI
  class HelpCenter < SingularResource

    include Associations
    include DataNamespace


    class Article < Resource; end
    class Section < Resource; end

    class Category < ZendeskAPI::Resource
      namespace 'help_center'

      has_many Section
      has_many Article
    end

    class Section < ZendeskAPI::Resource
      namespace 'help_center'

      has_many Article
      has Category
    end
    class Article < ZendeskAPI::Resource
      namespace 'help_center'

      has Section
      has Category

      has :author, class: User

    end

    has_many :categories, class: Category
    has_many :sections, class: Section
    has_many :articles, class: Article

    class << self

      def resource_name
        "help_center"
      end
      alias :resource_path :resource_name
    end

  end
end
