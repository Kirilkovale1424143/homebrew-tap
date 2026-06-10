class Hi < Formula
  desc "It spams hi in your terminal/bash/zsh. Thats all."
  homepage "https://github.com/Kirilkovale1424143/hi"
  url "https://github.com/Kirilkovale1424143/hi/releases/download/Spam/hi"
  version "1.0.0"
  sha256 "cbb2050b7628cdb64c57c0bf8611c5e0377c8b2701c165b4b441bd1161c3a7c8"
  license :cannot_represent

  depends_on :xcode => ["12.0", :build]

  def install
    # Оскільки у вас в репозиторії лежить файл main.swift, компілюємо його напряму
    system "swiftc", "main.swift", "-o", "hi", "-O"
    
    # Встановлюємо бінарник у стандартну бінарну папку Homebrew
    bin.install "hi"
  end

  test do
    assert_match "hi", shell_output("#{bin}/hi", 1)
  end
end
