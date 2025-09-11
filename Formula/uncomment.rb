class Uncomment < Formula
  desc "Fast, accurate comment removal tool using tree-sitter"
  homepage "https://github.com/Goldziher/uncomment"
  url "https://github.com/Goldziher/uncomment/archive/v2.7.0.tar.gz"
  sha256 "b143e914a8f7b5bead668ab89bd8d37459f98b0ef23c8988be7a0e5e38bd442a"
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