module ClientsHelper
  def client_destroy_confirmation_message
    message = ""
    message << "Você tem certeza?\n"
    message << "\n"
    message << "Isso também irá deletar todos os Contatos, Agendamentos e Produtividades relacionados a esse cliente!"
    message
  end
end
