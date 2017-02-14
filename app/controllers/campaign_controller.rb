class CampaignController < ApplicationController
    include SendGrid
    http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"], only: [:admin_dash]
    
  def admin_dash
    @pending = Person.pending.order(:id)
    @published = Person.published.order(:weight, :id)
  end
  
  def about
  end
  
  def team
  end
  
  def contact
  end
  
  def email
    unless params[:email].present?
      flash.now[:error] = 'Email address is required.'
      render :contact and return
    end
    
    from = Email.new(email: params[:email])
    to = Email.new(email: 'banthisthecampaign@gmail.com')
    subject = params[:subject] || 'BanThis Contact Form'
    content = Content.new(type: 'text/plain', value: params[:message])
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    
    if response.status_code[0] == '2'
      flash.now[:notice] = 'Thanks for your message. We will get back to you soon!'
    else
      flash.now[:error] = 'Error sending message.'
    end
    render :contact
  end
end
