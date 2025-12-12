class Uncomment < Formula
  desc "Fast, accurate comment removal tool using tree-sitter"
  homepage "https://github.com/Goldziher/uncomment"
  url "https://github.com/Goldziher/uncomment/archive/v2.10.0.tar.gz"
  sha256 "3ddebd80fdf7975af192644240f3eda27e010b8ff7f31023ce72976b66f58d2f"
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