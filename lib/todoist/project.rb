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
      @items ||= Todoist::ProjectItems.new(self)
    end

    def self.getProjects
      http.get('getProjects')
    end
    def self.getProject(id)
      http.get('getProject', project_id: id)
    end

  end
end
