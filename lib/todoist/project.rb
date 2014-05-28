class Todoist::Project < Todoist::Base
  def initialize(attrs)
    alter_hash attrs
  end
  def self.list
    self.getProjects.map { |attrs| new attrs }
  end
  def self.get(id)
    if id.to_s =~ /^\d+$/
    elsif id.is_a?(Hash) && (id.key?(:id) || id.key?('id'))
      id = id[:id] || id['id']
    else raise ArgumentError.new "params should be num or {id: num}"
    end
    Todoist::Project.new getProject(id)
  end

  def update(attrs)
    alter_hash attrs, false
    self.class.updateProject(self.id, attrs)
  end
  def delete
    self.class.deleteProject(self.id)
  end

  def items
    @items ||= Todoist::ProjectItems.new(self)
  end

  def self.getProjects
    http.get('getProjects')
  end
  def self.getProject(id)
    http.get('getProject', project_id: id)
  end
  def self.updateProject(id, attrs)
    http.get('updateProject', attrs.merge(project_id: id))
  end
  def self.deleteProject(id)
    http.get('deleteProject', project_id: id)
  end

end
