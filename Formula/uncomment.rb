class Uncomment < Formula
  desc "Fast, accurate comment removal tool using tree-sitter"
  homepage "https://github.com/Goldziher/uncomment"
  url "https://github.com/Goldziher/uncomment/archive/v2.8.0.tar.gz"
  sha256 "9330c79e9bc38ba34c58cba8bba84f9658ad21b0600399374a9cf95d080cc024"
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