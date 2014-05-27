class Todoist::Note < Todoist::Base
  def initialize(attrs)
    alter_hash attrs
  end
  def item
    @item ||= Todoist::Item.get self.item_id
  end

  def update(attrs)
  end

  def destroy
  end
end
