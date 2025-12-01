# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc "High-performance document intelligence CLI"
  homepage "https://kreuzberg.dev"
  url "https://github.com/Goldziher/kreuzberg/archive/v4.0.0-rc.3.tar.gz"
  sha256 "51201fdc5add8b11fcaded60221cf5e8e096573f70cfa95fd16efa7ea970b23c"
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
