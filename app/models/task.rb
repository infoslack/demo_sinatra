class Task
  include MongoMapper::EmbeddedDocument

  key :title, String
  key :completed_at, Time

  embedded_in :list

  def complete!
    self.completed_at = Time.now
    list.save
  end

  def toggle!
    self.completed_at = completed? ? nil : Time.now
    list.save
  end

  def completed?
    !!completed_at
  end

  def order_key
    completed_at ? "1#{title}" : "0#{title}"
  end

  module Extensions
    def ordered
      proxy_owner.tasks.sort_by(&:order_key)
    end
  end
end
