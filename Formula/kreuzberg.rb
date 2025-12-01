# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc "High-performance document intelligence CLI"
  homepage "https://kreuzberg.dev"
  url "https://github.com/Goldziher/kreuzberg/archive/v4.0.0-rc.4.tar.gz"
  sha256 "ec3c76cb75c7003cab8de264c90deaf4f41aabf5e944da9bb94c0e44a6d0c3ce"
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
