class UserDecorator < Draper::Decorator
  delegate_all

  def full_address
    "#{object.street_address}, #{object.city}, #{object.state} #{object.zip}"
  end

  def created_at
    object.created_at.strftime("%m-%d-%Y")
  end

  def trial_expiration
    (object.created_at + 30.days).strftime("%m-%d-%Y")
  end
end
