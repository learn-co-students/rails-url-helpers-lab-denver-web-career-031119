class Student < ActiveRecord::Base
  def to_s
    self.first_name + " " + self.last_name
  end

  def status
    case self.active
    when true
      'active.'
    when false
      'inactive.'
    end
  end

  def status_change
    case self.active
    when true
      self.update(active: false)
    when false
      self.update(active: true)
    end

  end

end
