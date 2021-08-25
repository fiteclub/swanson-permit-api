json.array! @users do |user|
  json.id user.id
  json.name user.name
  json.email user.email
  json.dob user.dob
  json.ident_num user.ident_num
  json.ident_state user.ident_state
  json.ident_expir user.ident_expir
  json.ident_img user.ident_img
  json.permit_num user.permit_num
  json.permit_issuer user.permit_issuer
  json.permit_expir user.permit_expir
  json.permit_img user.permit_img
  json.status user.status
end
