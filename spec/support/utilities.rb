# create full title
def full_title(page_title)
  base = "Hin & Veg"
  if page_title.empty?
    base
  else
    "#{base} | #{page_title}"
  end
end
