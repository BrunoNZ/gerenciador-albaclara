module UsersHelper
  def role_update_confirmation_message(old_role,new_role)
    message = ""
    message << "Tem certeza que deseja alterar o perfil do usuário?\n"
    message << "\n"
    message << "* De: #{old_role}\n"
    message << "\n"
    message << "* Para: #{new_role}"
    message
  end
end
