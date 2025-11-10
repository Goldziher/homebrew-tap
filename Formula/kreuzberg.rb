# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc "High-performance document intelligence CLI"
  homepage "https://kreuzberg.dev"
  url "https://github.com/Goldziher/kreuzberg/archive/refs/tags/v3.21.0.tar.gz"
  sha256 "2b95b45d1fe3b3682a64b9951dab39766f8ab000da616c3f179848f17d9a47a6"
  license "MIT"
  head "https://github.com/Goldziher/kreuzberg.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/kreuzberg-cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kreuzberg --version")
  end
end
