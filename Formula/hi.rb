class Hi < Formula
  desc "It spams hi in your terminal/bash/zsh. Thats all."
  homepage "https://github.com/Kirilkovale1424143/hi"
  url "https://github.com"
  version "1.0.0"
  sha256 "056dbf96cc24cfbb63c467a840e698305b4e74744d084d5df6870da9ceb4ec9c"
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
