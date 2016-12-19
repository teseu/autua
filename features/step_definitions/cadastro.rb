Dado(/^que eu estou na página de cadastro do Groupon$/) do
  #@url = "http://sdn.tucano.net.br/wp-login.php"
  #visit ('@url')
  visit "http://sdn.tucano.net.br/wp-login.php"
  #sleep 10
end

Quando(/^eu preencher os campos obrigatórios$/) do
  #select 'Sr.', from: 'gender-select'
  #find(:id, 'first-name-input').set("Nome")
  #find(:css, '#first-name-input').set("Nome") por id
  #find(:css, '.first-name-input').set("Nome") por classe
end

Então(/^o cadastro deverá ser realizado com sucesso$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
