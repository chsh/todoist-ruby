class Todoist::ProjectItems < Todoist::Base
  attr_reader :project
  def initialize(project)
    @project = project
  end
  def uncompleted
    getUncompletedItems.map { |attrs| Item.new attrs }
  end
  def create(attrs)
    Item.new addItem(attrs)
  end

  def getUncompletedItems
    http.get('getUncompletedItems')
  end
  # create project specific item
  def addItem(attrs)
    attrs = attrs.merge project_id: project.id
    http.get('addItem', attrs)
  end
end
