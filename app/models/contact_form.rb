class ContactForm < MailForm::Base
  attribute :email,     :validate => /[^@]+@[^\.]+\.[\w\.\-]+/
  attribute :message
  
  def headers
    {
      :subject => "BanThis Contact Form",
      :to => "banthisthecampaign@gmail.com",
      :from => %(<#{email}>)
    }
  end
end