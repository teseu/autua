#language: pt

Funcionalidade: Gerenciar os comentários nos artigos do blog

  Para gerenciar os comentários do blog e evitar
  que se acumulem spams indesejados

Cenario: Eliminar comentário

  Dado que estou na página de gestão de comentários
  Quando eu selecionar o comentário
  E marcar como span
  Então o comentáio deverá ser eliminado
