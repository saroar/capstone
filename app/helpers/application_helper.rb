module ApplicationHelper
    def display(user)
       user.name ||= user.email
    end
end
