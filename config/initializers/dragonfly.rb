app = Dragonfly[:images] #.configure_with(:imagemagick)

app.configure_with(:imagemagick)
app.configure_with(:rails)

app.define_macro(ActiveRecord::Base, :image_accessor)
