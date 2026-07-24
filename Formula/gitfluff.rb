class Gitfluff < Formula
  desc "Commit message linter with presets and cleanup automation"
  homepage "https://github.com/Goldziher/gitfluff"
  url "https://github.com/Goldziher/gitfluff/archive/v0.8.0.tar.gz"
  sha256 "b3fcb2fdbaa8d08203d002a1edbc0819b6f81a4783bfe4f2d28db88e5c66116f"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/gitfluff/releases/download/v0.8.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9dee0da1a6bc1c671c952cb6fc004a00d8b134da52ed6a9e06c00fe8503d3f38"
    sha256 cellar: :any,                 arm64_linux:   "0071bbc34e148e3566d8573fed634a1b7890d617ef546f1419dee897b70e00c0"
    sha256 cellar: :any,                 x86_64_linux:  "4972202363506d37724597afd29b79b5ddc089d019e5017075c700ec8e171248"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"COMMIT_EDITMSG").write "feat: add tests\n"
    system bin/"gitfluff", "lint", "--from-file", "COMMIT_EDITMSG"
  end
end
