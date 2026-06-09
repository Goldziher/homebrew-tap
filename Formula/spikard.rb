# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.15.6-rc.15"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "7bdd5fae9ce1cf3e61f6947e98d5c68b5ab53b369fdcd9135c20378dff619c72"
  license "MIT"

  depends_on "pkg-config" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/spikard-cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/spikard --version")
  end
end
