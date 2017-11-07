class UserDecorator < Draper::Decorator
  delegate_all

  def full_address
    "#{object.street_address}, #{object.city}, #{object.state} #{object.zip}"
  end
end
