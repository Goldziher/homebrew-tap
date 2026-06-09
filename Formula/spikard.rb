# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.15.6-rc.15"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "7bdd5fae9ce1cf3e61f6947e98d5c68b5ab53b369fdcd9135c20378dff619c72"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.15.6-rc.15"
    sha256 cellar: :any, arm64_linux: "b9b8f7b4814e8acff0deaafd8578b18d7534ec28f6d666aff2202f172cfea13a"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "768b1926ffa0f019a978e5f63d2b4f29f0c7728f7bb74ae62857c26d392b2e0e"
    sha256 cellar: :any_skip_relocation, sequoia: "389e601b2a24d2383c7d48c2d09e71dece5b02094af7a53fcc69d7bb5f9e8f0e"
    sha256 cellar: :any, x86_64_linux: "543386b2fdba6b0400f07dda9ad87a3e66cfedbcfe1e688505e7e5f977f777ab"
  end

  depends_on "pkg-config" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/spikard-cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/spikard --version")
  end
end
