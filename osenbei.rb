# -*- coding: utf-8 -*-

Plugin.create(:osenbei) do
  vic = [ "Agnes", 'Kathy', 'Princess', 'Vicki', 'Victoria',
          'Bruce', 'Fred', 'Junior', 'Ralph',
          'Albert', "Bad News", "Good News", 'Bahh','Bells',
          'Boing', 'Bubbles', "Cellos", 'Deranged', 'Zarvox',
          'Hysterical', 'Pipe Organ', 'Trinoids', 'Whisper' ]
  str = [ "parieen", "baribari", 'ruiz ruiz ruiz luuuuuuuuuuuuuuuu',
          'miku no oppai kaowo luzumet soo-her soo-her ee kaori',
          'hinyu diesukii', 'she gosabaki niau', 'teoku let',
          'fabo retyo', 'harahead', 'yojika', 'sok foo ocan ni follow sareta',
          'fabo de kanojo-gar dekimasu shousai wa coco wo click',
          'MS kirai dawa- maji kirai dawa- aizawa hekari toka silverlight toka kankeini-yanker',
          'favo wa ataaru-ningan wo mu-she-bami yagarte korosu'
        ]
  thread = SerialThreadGroup.new
  on_update do |service, message|
    if !message.empty?
      jis = message.first.to_s
      if jis =~ /〄|(ておくれ)|(33番線)/
        thread.new{
          # STDERR.puts 'jis'
          voice = rand(vic.size)
          string = rand(str.size)
          system 'say', '-v', vic[voice], str[string]
        }
      end
    end
  end
end
