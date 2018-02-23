class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end


  def daily_recipe(recipes, user)
    @user = user
    @recipes = recipes
    mail(to: @user.email, subject: 'For tonight!')
  end
end
