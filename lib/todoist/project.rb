module Todoist
  class Project < Base
    def initialize(attrs)
      alfter_hash attrs
    end
    def self.list
      self.getProjects.map { |attrs| Project.new attrs }
    end
    def self.get(id)
      Project.new getProject(id)
    end

    # Looks like: has_many :items
    def items
      @items ||= ProjectItems.new(self)
    end

    def self.getProjects
      http_get('getProjects')
    end
    def self.get(id)
      http_get('getProject', project_id: id)
    end

  end
end
