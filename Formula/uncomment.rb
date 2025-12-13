class Uncomment < Formula
  desc "Fast, accurate comment removal tool using tree-sitter"
  homepage "https://github.com/Goldziher/uncomment"
  url "https://github.com/Goldziher/uncomment/archive/v2.10.3.tar.gz"
  sha256 "69a18bc680262ec349e395404ae4c2b8323dccc0f408b21bdecc48338a7c0e11"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # Create a test file with comments
    (testpath/"test.py").write <<~EOS
      # This is a comment
      print("Hello, world!")  # Inline comment
      # Another comment
    EOS

    # Run uncomment on the test file
    output = shell_output("#{bin}/uncomment --dry-run test.py")
    assert_match "print(\"Hello, world!\")", output
  end
end