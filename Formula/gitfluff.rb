class Gitfluff < Formula
  desc "Commit message linter with presets and cleanup automation"
  homepage "https://github.com/Goldziher/gitfluff"
  url "https://github.com/Goldziher/gitfluff/archive/v0.7.1.tar.gz"
  sha256 "0418ac15d3a9fecbfec5a3d6afed9d6d044467fa8da0b10c9f2381a767857f4c"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"COMMIT_EDITMSG").write "feat: add tests\n"
    system bin/"gitfluff", "lint", "--from-file", "COMMIT_EDITMSG"
  end
end
