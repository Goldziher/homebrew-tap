# typed: false
# frozen_string_literal: true

class Scythe < Formula
  desc "SQL compiler and linter - generate type-safe code from SQL"
  homepage "https://github.com/Goldziher/scythe"
  url "https://github.com/Goldziher/scythe/archive/v0.3.0.tar.gz"
  sha256 "b8707bb0c05135f7372e881c3aaa3f1d5a7fb8102ba3c043d6e82c0557a01b85"
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
