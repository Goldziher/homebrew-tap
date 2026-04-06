# typed: false
# frozen_string_literal: true

class Scythe < Formula
  desc "SQL compiler and linter - generate type-safe code from SQL"
  homepage "https://github.com/Goldziher/scythe"
  url "https://github.com/Goldziher/scythe/archive/v0.1.0.tar.gz"
  sha256 "fd84873620a8a70e14523a7724ac6d172a3909ae308f738c91935a04bbc9104c"
  license "MIT"
  head "https://github.com/Goldziher/scythe.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/scythe-cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scythe --version")
  end
end
