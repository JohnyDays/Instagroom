kony = ["This kitty is the cutest ever!","I love cats!","Cats are my life!","I wish everyone was a cat!","His fur is so cute!","I love my cat's fur","Look at my cat's color!","It's so pretty!","My cat looks like he is in heaven!","This kitty is the cutest ever!","The god of cats!","My cat sure has the king in his belly!","I wish I looked as cute as my cat :(","Does anyone want this cat? Too bad I'm keeping it!","Kitty cat! :33","I like my cat more than my own mother!","I'm addicted to this cat."]
43.times do |i|
  User.create(:username => "Cat Lover #{i+1}", :password => 'cats', :email => "catlover#{i+1}@lovingcats.cats")
end
b = 1;
430.times do |i|

  fromid = 1+rand(43)
  while fromid == i
    fromid = 1+rand(43)
  end
    puts "#{b}"
  Post.create(:id => "#{i+1}", :user_id => "#{b}", :source_id => "#{1+rand(43)}",:from_id => "#{fromid}",:content => "#{kony.sample}")
    if (i+1) % 10 == 0
    b += 1
  end
end
  User.create(:username => "Johny", :password => 'johny', :email => "johnydays@johny.com")
