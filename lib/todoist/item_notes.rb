class Todoist::ItemNotes < Todoist::Base
  attr_reader :item
  def initialize(item)
    @item = item
  end
  def create(attrs)
    Note.new addNote(attrs)
  end

  def addNote(attrs)
    attrs = attrs.merge item_id: item.id
    http.get('addNote', attrs)
  end
end
