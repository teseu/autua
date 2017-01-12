lines = File.open($acesso, "r"){ |datafile| datafile.readlines }
$user = lines[0]
$pass = lines[1]

Dado(/^que estou na página de gestão de comentários$/) do
  @url_login = "http://sdn.tucano.net.br/wp-login.php"
  visit (@url_login)
  fill_in('user_login', :with => $user)
  #fill_in('user_pass', :with => $pass)
  find(:id, 'user_pass').set($pass)
  find(:id, 'wp-submit').click
end

Quando(/^eu selecionar o comentário$/) do
  @url_comentario = 'http://sdn.tucano.net.br/wp-admin/edit-comments.php'
  visit (@url_comentario)
  $num_comentarios_antes = page.first('span.pending-count').text
  find(:xpath, '//*[@id="the-comment-list"]/tr[1]/th/input').click
end

E(/^marcar como span$/) do
  select 'Marcar como spam', from: 'bulk-action-selector-top'
  #find(:id, 'doaction').click
  click_button('doaction')
  #sleep 1
end

Então(/^o comentáio deverá ser eliminado$/) do
  $num_comentarios_depois = page.first('span.pending-count').text
  puts $num_comentarios_antes
  puts $num_comentarios_depois
  expect($num_comentarios_antes).not_to eq($num_comentarios_depois)
end
