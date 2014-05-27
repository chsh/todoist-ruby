class Todoist::Note < Todoist::Base
  def initialize(attrs)
    alter_hash attrs
  end
  def item
    @item ||= Item.get self.item_id
  end
end
