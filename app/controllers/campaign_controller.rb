class CampaignController < ApplicationController
    http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"], only: [:admin_dash]
    
  def admin_dash
    @pending = Person.pending
    @published = Person.published.order(:weight)
  end
  
  def about
  end
  
  def team
  end
  
  def contact
  end
  
  def email
    contact_form = ContactForm.new(params)
    if contact_form.deliver
      flash.now[:notice] = 'Thanks for your message. We will get back to you soon!'
    else
      flash.now[:error] = 'Error sending message.'
    end
    render :contact
  end
end
