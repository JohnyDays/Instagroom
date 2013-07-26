i = 0

b = 1
Dir.foreach('C:\\Users\\Joao\\Torrents\\400 Beautiful Cats Pictures and Wallpapers [Up to 2950 Px]\\400 Beautiful Cats Pictures and Wallpapers [Up to 2950 Px]\\Pics and Walls') do |file|

  next if file == '.' or file == '..'

puts i

 i  += 1
File.open('C:\\Users\\Joao\\Torrents\\400 Beautiful Cats Pictures and Wallpapers [Up to 2950 Px]\\400 Beautiful Cats Pictures and Wallpapers [Up to 2950 Px]\\Pics and Walls\\' + file, 'rb') do |f|
  Dir.mkdir('C:\\Users\\Joao\\Google Drive\\Programming\\Ruby\\Instagroom\\public\\uploads\\cat lover ' + b.to_s) unless File.exists?('C:\\Users\\Joao\\Google Drive\\Programming\\Ruby\\Instagroom\\public\\uploads\\cat lover ' + b.to_s)

  Dir.mkdir('C:\\Users\\Joao\\Google Drive\\Programming\\Ruby\\Instagroom\\public\\uploads\\cat lover ' + b.to_s + '\\' + i.to_s)

  File.open('C:\\Users\\Joao\\Google Drive\\Programming\\Ruby\\Instagroom\\public\\uploads\\cat lover ' + b.to_s + '\\' + i.to_s + '\\image',"wb") do |newfile|

    newfile.write(f.read)

  end
  if i % 10 == 0
    b+=1
  end
  puts i
end
end

