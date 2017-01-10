
Dado(/^que estou na página de gestão de comentários$/) do
  @url_login = "http://sdn.tucano.net.br/wp-login.php"
  visit (@url_login)
end

Quando(/^eu selecionar o comentário$/) do
  find(:id, 'user_login').set("teseu")
  find(:id, 'user_pass').set("uma$enh@1ncrivElmenteFort3!")
  find(:id, 'wp-submit').click
  @url_comentario = 'http://sdn.tucano.net.br/wp-admin/edit-comments.php'
  visit (@url_comentario)
end

E(/^marcar como span$/) do
  @num_comentarios_antes = page.first('span.pending-count').text
  find(:xpath, '//*[@id="the-comment-list"]/tr[1]/th/input').click
  select 'Marcar como spam', from: 'bulk-action-selector-top'
  find(:id, 'doaction').click
  sleep 1
end

Então(/^o comentáio deverá ser eliminado$/) do
  @num_comentarios_depois = page.first('span.pending-count').text
  expect(@num_comentarios_antes).not_to eq(@num_comentarios_depois)
end
