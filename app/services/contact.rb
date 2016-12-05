class Contact
  attr_reader :email

  def initialize(name: '', email: '')
    @name = name.split(' ')
    @email = email
  end

  def attributes
    {
      email_address: email,
      first_name: first_name,
      last_name: last_name,
      subscribed: true
    }
  end

  def first_name
    @name.first
  end

  def last_name
    @name[1..-1].join(' ')
  end
end
