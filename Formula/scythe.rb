# typed: false
# frozen_string_literal: true

class Scythe < Formula
  desc "SQL compiler and linter - generate type-safe code from SQL"
  homepage "https://github.com/Goldziher/scythe"
  url "https://github.com/Goldziher/scythe/archive/v0.4.0.tar.gz"
  sha256 "c758301a9f7690bcf39aa6d6ce214aa97c08a2ab69a982e2d7e1edbd215584f9"
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
