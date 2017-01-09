Dado(/^que estou na página de gestão de comentários$/) do
  @url_login = "http://sdn.tucano.net.br/wp-login.php"
  visit (@url_login)
end

Quando(/^eu selecionar o comentário$/) do
  find(:id, 'user_login').set("teseu")
  find(:id, 'user_pass').set("uma$enh@1ncrivElmenteFort3!")
  find(:id, 'wp-submit').click()
  sleep 2
  @url_comentario = 'http://sdn.tucano.net.br/wp-admin/edit-comments.php'
  visit (@url_comentario)
end

E(/^marcar como span$/) do
  find(:xpath, '//id[the-comment-list]/tr/th/input').click()
  sleep 2
end

Então(/^o comentáio deverá ser eliminado$/) do

end
