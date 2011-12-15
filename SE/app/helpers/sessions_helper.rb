module SessionsHelper
         def sing_in(user)
                 cookies.permanent.signed[:remember_token] = [user.id, user.salt]
                 current_user = user
         end

         def current_user=(user)
                 @current_user = user
         end

         def current_user
                 @current_user ||= user_from_remember_token
         end

         def signed_in?
                 !current_user.nil?
         end

         def current_user_name
                 nombre = @current_user.nombre.split(' ')
                 nombre[0].capitalize

         end

         def admin?
                 if current_user.tipo.eql? "administrador"
                   true
                 else
                   false
                 end
         end

         def sing_out
                 cookies.delete(:remember_token)
                 self.current_user = nil
         end

         private

         def user_from_remember_token
                 User.authenticate_with_salt(*remember_token)
         end

         def remember_token
                 cookies.signed[:remember_token] || [nil, nil]
         end

end