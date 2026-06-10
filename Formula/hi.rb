class Hi < Formula
  desc "It spams hi in your terminal/bash/zsh. Thats all."
  homepage "https://github.com/Kirilkovale1424143/hi"
  url "https://github.com/Kirilkovale1424143/hi/releases/download/Spam/hi"
  version "1.0.0"
  sha256 "9a3f37f893d87a7b25727751475deeea7b8b7a0236036ac8b191dde5ff2e95e8"
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
