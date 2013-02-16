def sign_in(user)
  visit signin_path
  fill_in "Name", with: user.name
  fill_in "Password", with: user.password
  click_button "Sign in"
  cookies[:remember_token] = user.remember_token
end

# create full title
def full_title(page_title)
  base = 'Veg damit'
  if page_title.empty?
    base
  else
    "#{base} | #{page_title}"
  end
end
