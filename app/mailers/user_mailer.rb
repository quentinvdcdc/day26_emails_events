class UserMailer < ApplicationMailer
	default from: 'no-reply@monsite.fr'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://the-eventbrite-app.herokuapp.com/' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def event_subscription_email(event, attendee)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @administrator = event.administrator
    @attendee = attendee

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://the-eventbrite-app.herokuapp.com/' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @administrator.email, subject: 'Choupi, tu as un.e nouvel.le ami.e à ta soirée Disco 80s') 
  end
end
