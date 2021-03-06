lines = File.open($acesso, "r"){ |datafile| datafile.readlines }
$user = lines[0]
$pass = lines[1]

Dado(/^que estou na página de gestão de comentários$/) do
  @url_login = "http://url.do-blog.wordpress/wp-login.php"
  Capybara.reset_sessions!
  visit (@url_login)
  fill_in('user_login', :with => $user)
  find(:id, 'user_pass').set($pass)
end

Quando(/^eu selecionar o comentário$/) do
  @url_comentario = 'http://url.do-blog.wordpress/wp-admin/edit-comments.php'
  visit (@url_comentario)
  $num_comentarios_antes = find(:xpath, '//*[@id="menu-comments"]/a/div[3]/span/span').text
  find(:xpath, '//*[@id="the-comment-list"]/tr[1]/th/input').click
end

E(/^marcar como span$/) do
  select 'Marcar como spam', from: 'bulk-action-selector-top'
  click_button('doaction')
end

Então(/^o comentáio deverá ser eliminado$/) do
  $num_comentarios_depois = page.first('span.pending-count').text
  puts $num_comentarios_antes
  puts $num_comentarios_depois
  expect($num_comentarios_antes).not_to eq($num_comentarios_depois)
  Capybara.reset_sessions!
end
