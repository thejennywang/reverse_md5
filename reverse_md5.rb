require 'digest/md5'

@e = Digest::MD5.hexdigest('thejennywang@gmail.com')
@valid_chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_.@+'

def reverse_md5
  secret, hash = '', '46df5a0c18b71f6cf4e97777677df0c860a5eaa1fd847697d5678592496539b50574c74e5278100b815f03c7dad388bc7cf0da63366f7004ace5ca72c864ead6cba3c9b1467aa1b62e425c63cffc8c978accf556e24f24e729754df76c2f0488cdbfb4314ed6a56a212582ad86cdadbc1ead2296dc80e3d7f1d1031941990103db8803042fd1d7c8e85f3bb67116fb0a4a58662d6e4cc9aa387cea24fea77d73b82a8ece0a2b00276898d97348a29849dc5584191a56f80d3f89020b33db6a7cfa647c229b452d051dbc14bbf989c93417b1117a9f151b7a8e5ce16e17e5cb342c3996755352ef8f178a435dc910626c2166d748b02d80d9a910c36e1ccde3da347217688466f1add082532fdc9dd330d4c364660ed629ba038682512592e018192f31257eda95428aa58f7f553e2e683ecb657fed438365838d2051d4f645b4a1384a971e5ec7cc4ecd834af27c064796d18af0cb7ea39ab557064c2d3e3117e0cbc93e7dd13ab79ad416f33e6e369b91b8b311c59ab98fc5c816d7bb8da3e85d1875da9a4a3b06e6d8a9f98f9ba493c78b0c8cca056eb1c9b88f07eaf396e7674d9f2effa455c1ea813db82c258c2312d0ec646fdf8ad561bdd60120d73bbb'
  chunks = hash.scan(/.{32}/)

  chunks.each do |chunk|
    hash_result, current_chunk = '', chunk
    @valid_chars.each_char do |char1|
      @valid_chars.each_char do |char2|
        char1, char2 = char1, char2
        hash_result = Digest::MD5.hexdigest(@e + secret + char1 + char2 + Digest::MD5.hexdigest(secret + char1 + char2))
        if current_chunk == hash_result then
          secret << char1 << char2
        end
      end      
    end
  end
  puts "Secret email: " + secret
end

reverse_md5