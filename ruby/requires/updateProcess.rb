def htmlPresetMaker(filePath)

  fileData = File.read("#{filePath}.html").split("\n")

  newData = []

  fileData.count.times do |z|
      newData.push("#{fileData[z]}\\")
  end

  newData.insert(0, "document.write('\\")

  newData.push("');")

  File.new("#{filePath}.js", "w+")
  File.write("#{filePath}.js", newData.join("\n"), mode: "a")

end

def updateIndex(filePath = "/jauq.github.io/index.html")

  files = getFiles("/jauq.github.io/content/home")
  files = files.reverse

  $f = []

  $f.push("<!doctype html>")
  $f.push("<html lang=\"en\">"); hn
  $f.push("   <script src=\"/jauq.github.io/presets/head.js\"></script>"); hn
  $f.push("   <body class=\"homeBgDeco\">"); hn
  $f.push("     <script src=\"/jauq.github.io/presets/indexJumbo.js\"></script>"); hn
  $f.push("     <script src=\"/jauq.github.io/presets/navbar.js\"></script>"); hn
  $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn
  cm("Main Section")
  $f.push("       <div class=\"container\">"); hn
  files.each do |contents|
    genContent($f, contents); hn
  end
  $f.push("       </div>")
  cm("Main Section", true); hn
  $f.push("       <script src=\"/jauq.github.io/presets/footer.js\"></script>"); hn
  $f.push("     </div>"); hn
  $f.push("     <script src=\"/jauq.github.io/scripts/navbarSticky.js\"></script>"); hn
  $f.push("     <script src=\"/jauq.github.io/scripts/footerYear.js\"></script>"); hn
  $f.push("   </body>")
  $f.push("</html>")

  File.new("#{filePath}", "w+")
  File.write("#{filePath}", $f.join("\n"), mode: "a")

end


#Here, all the games pages get updated. Most of the commented out stuff is for a special type of content box specifically made for games. It's a lot of work and well, I'll get to it eventually.
#First comment is for making a page for each game genre.
#First block comment is for generating the games on those pages using my special "genMediaContent" method.
#Second block comment is generating individual pages for each Game.
def updateGames(filePath = "/jauq.github.io/views/games.html")

  files = getFiles("/jauq.github.io/content/games")
  files = files.reverse

  $gamesGenres = getFileLines("/jauq.github.io/content/gamesGenres.txt")

  #($gamesGenres.count + 1).times do |n|
  1.times do |n|

    filePath = "/jauq.github.io/views/games/genres/#{$gamesGenres[n - 1].to_s.downcase}.html" if n >= 1

    $f = []

    $f.push("<!doctype html>")
    $f.push("<html lang=\"en\">"); hn
    $f.push("   <script src=\"/jauq.github.io/presets/head.js\"></script>"); hn
    $f.push("   <body class=\"gamesBgDeco\">"); hn
    $f.push("     <script src=\"/jauq.github.io/presets/gamesJumbo.js\"></script>"); hn
    $f.push("     <script src=\"/jauq.github.io/presets/navbar.js\"></script>"); hn
    $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn
    cm("Main Section")
    $f.push("       <div class=\"container\">"); hn
    files.each do |contents|
      genContent($f, contents); hn
    end
=begin
    if n == 0
      files.each do |paths|
        genMediaContent($f, paths); hn
      end
    elsif n >= 1
      files.each do |paths|
        genMediaContent($f, paths, $gamesGenres[n - 1]); hn
      end
    end
=end
    $f.push("       </div>")
    cm("Main Section", true); hn
    $f.push("       <script src=\"/jauq.github.io/presets/footer.js\"></script>"); hn
    $f.push("     </div>"); hn
    $f.push("     <script src=\"/jauq.github.io/scripts/navbarSticky.js\"></script>"); hn
    $f.push("     <script src=\"/jauq.github.io/scripts/footerYear.js\"></script>"); hn
    $f.push("   </body>")
    $f.push("</html>")

    File.new("#{filePath}", "w+")
    File.write("#{filePath}", $f.join("\n"), mode: "a")

  end

=begin
  files.each do |paths|

    content = getFileLines(paths)

    temp = content.index { |x| x.start_with?("@") }
    header = nil
    if temp != nil
      header = content[temp]
      header = header[1...header.length]
      content.delete_at(temp)
    end

    filePath = "/jauq.github.io/views/games/#{header}.html"

    $f = []

    $f.push("<!doctype html>")
    $f.push("<html lang=\"en\">"); hn
    $f.push("   <script src=\"/jauq.github.io/presets/head.js\"></script>"); hn
    $f.push("   <body class=\"gamesBgDeco\">"); hn
    $f.push("     <script src=\"/jauq.github.io/presets/gamesJumbo.js\"></script>"); hn
    $f.push("     <script src=\"/jauq.github.io/presets/navbar.js\"></script>"); hn
    $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn
    cm("Main Section")

    cm("Main Section", true); hn
    $f.push("       <script src=\"/jauq.github.io/presets/footer.js\"></script>"); hn
    $f.push("     </div>"); hn
    $f.push("     <script src=\"/jauq.github.io/scripts/navbarSticky.js\"></script>"); hn
    $f.push("     <script src=\"/jauq.github.io/scripts/footerYear.js\"></script>"); hn
    $f.push("   </body>")
    $f.push("</html>")

    File.new("#{filePath}", "w+")
    File.write("#{filePath}", $f.join("\n"), mode: "a")

  end
=end

end

def updateMusic(filePath = "/jauq.github.io/views/music.html")

  files = getFiles("/jauq.github.io/content/music")
  files = files.reverse

  $f = []

  $f.push("<!doctype html>")
  $f.push("<html lang=\"en\">"); hn
  $f.push("   <script src=\"/jauq.github.io/presets/head.js\"></script>"); hn
  $f.push("   <body class=\"musicBgDeco\">"); hn
  $f.push("     <script src=\"/jauq.github.io/presets/musicJumbo.js\"></script>"); hn
  $f.push("     <script src=\"/jauq.github.io/presets/navbar.js\"></script>"); hn
  $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn
  cm("Main Section")
  $f.push("       <div class=\"container\">"); hn
  files.each do |contents|
    genContent($f, contents); hn
  end
  $f.push("       </div>")
  cm("Main Section", true); hn
  $f.push("       <script src=\"/jauq.github.io/presets/footer.js\"></script>"); hn
  $f.push("     </div>"); hn
  $f.push("     <script src=\"/jauq.github.io/scripts/navbarSticky.js\"></script>"); hn
  $f.push("     <script src=\"/jauq.github.io/scripts/footerYear.js\"></script>"); hn
  $f.push("   </body>")
  $f.push("</html>")

  File.new("#{filePath}", "w+")
  File.write("#{filePath}", $f.join("\n"), mode: "a")

end

def updateArt(filePath = "/jauq.github.io/views/art.html")

  files = getFiles("/jauq.github.io/content/art")
  files = files.reverse

  $f = []

  $f.push("<!doctype html>")
  $f.push("<html lang=\"en\">"); hn
  $f.push("   <script src=\"/jauq.github.io/presets/head.js\"></script>"); hn
  $f.push("   <body class=\"artBgDeco\">"); hn
  $f.push("     <script src=\"/jauq.github.io/presets/artJumbo.js\"></script>"); hn
  $f.push("     <script src=\"/jauq.github.io/presets/navbar.js\"></script>"); hn
  $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn
  cm("Main Section")
  $f.push("       <div class=\"container\">"); hn
  files.each do |contents|
    genContent($f, contents); hn
  end
  $f.push("       </div>")
  cm("Main Section", true); hn
  $f.push("       <script src=\"/jauq.github.io/presets/footer.js\"></script>"); hn
  $f.push("     </div>"); hn
  $f.push("     <script src=\"/jauq.github.io/scripts/navbarSticky.js\"></script>"); hn
  $f.push("     <script src=\"/jauq.github.io/scripts/footerYear.js\"></script>"); hn
  $f.push("   </body>")
  $f.push("</html>")

  File.new("#{filePath}", "w+")
  File.write("#{filePath}", $f.join("\n"), mode: "a")

end

def updateMisc(filePath = "/jauq.github.io/views/misc.html")

  files = getFiles("/jauq.github.io/content/misc")
  files = files.reverse

  $f = []

  $f.push("<!doctype html>")
  $f.push("<html lang=\"en\">"); hn
  $f.push("   <script src=\"/jauq.github.io/presets/head.js\"></script>"); hn
  $f.push("   <body class=\"miscBgDeco\">"); hn
  $f.push("     <script src=\"/jauq.github.io/presets/miscJumbo.js\"></script>"); hn
  $f.push("     <script src=\"/jauq.github.io/presets/navbar.js\"></script>"); hn
  $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn
  cm("Main Section")
  $f.push("       <div class=\"container\">"); hn
  files.each do |contents|
    genContent($f, contents); hn
  end
  $f.push("       </div>")
  cm("Main Section", true); hn
  $f.push("       <script src=\"/jauq.github.io/presets/footer.js\"></script>"); hn
  $f.push("     </div>"); hn
  $f.push("     <script src=\"/jauq.github.io/scripts/navbarSticky.js\"></script>"); hn
  $f.push("     <script src=\"/jauq.github.io/scripts/footerYear.js\"></script>"); hn
  $f.push("   </body>")
  $f.push("</html>")

  File.new("#{filePath}", "w+")
  File.write("#{filePath}", $f.join("\n"), mode: "a")

end

def update404(filePath = "/jauq.github.io/404.html")

  $f = []

  $f.push("<!doctype html>")
  $f.push("<html lang=\"en\">"); hn
  $f.push("   <script src=\"/jauq.github.io/presets/head.js\"></script>"); hn
  $f.push("   <body class=\"homeBgDeco\">"); hn
  $f.push("     <script src=\"/jauq.github.io/presets/indexJumbo.js\"></script>"); hn
  $f.push("     <script src=\"/jauq.github.io/presets/navbar.js\"></script>"); hn
  $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn

  cm("Main Section")
  $f.push("       <div class=\"container\">"); hn
  genContent($f, "/jauq.github.io/content/404block.txt"); hn
  $f.push("       </div>")
  cm("Main Section", true); hn
  $f.push("       <script src=\"/jauq.github.io/presets/footer.js\"></script>"); hn
  $f.push("     </div>"); hn
  $f.push("     <script src=\"/jauq.github.io/scripts/navbarSticky.js\"></script>"); hn
  $f.push("     <script src=\"/jauq.github.io/scripts/footerYear.js\"></script>"); hn
  $f.push("   </body>")
  $f.push("</html>")

  File.new("#{filePath}", "w+")
  File.write("#{filePath}", $f.join("\n"), mode: "a")

end
