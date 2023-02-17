class UserMailer < ApplicationMailer
    def verification_email
        @user = params[:user]
        mail(to: @user.email, subject: 'Bienvenido! Confirma tu correo electrónico')
    end
end
