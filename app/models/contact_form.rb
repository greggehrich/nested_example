#
#
#
#
class ContactForm < MailForm::Base

  attribute :name, :validate => true

  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  attribute :message, :validate => true

  # Declare the e-mail headers
  def headers
    {
      :subject => 'ArcadeNomad - Contact Request',
      :to => APP_CONFIG['ADMIN_EMAIL'],
      :from => APP_CONFIG['ADMIN_SENDER']
    }
  end

end