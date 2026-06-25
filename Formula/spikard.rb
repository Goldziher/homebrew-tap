# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.16.0-rc.4"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "45cff7d53271b4d745eedc8274841d88fe0777598e9f8fd704e61275ac65795a"
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
