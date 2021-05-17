json.array! @users do |user|
  json.id user.id
  json.name user.name
  json.email user.email
  json.dob user.dob
  json.ident_num user.ident_num
  json.ident_state user.ident_state
  json.ident_expir user.ident_expir
  json.ident_img user.ident_img
  json.recom_num user.recom_num
  json.recom_issuer user.recom_issuer
  json.recom_expir user.recom_expir
  json.recom_img user.recom_img
  json.status user.status
end
