# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    user = User.first
    UserMailer.welcome_email(user)
  end

  def daily_recipe
    user = User.first
    recipes = Recipe.limit(1).order("RANDOM()")
    UserMailer.daily_recipe(recipes, user)
  end
end
