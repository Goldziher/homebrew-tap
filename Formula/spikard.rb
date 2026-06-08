# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.15.6-rc.11"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "d663a6a721ed532fc59ccf66c733e1cca421ab0d4bccd78106c61145cae6d3a3"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.15.6-rc.11"
    sha256 cellar: :any, arm64_linux: "9d1d8e5d996fb7000b932cb1f151ddacfc340ee27031317f8addcfc826d7fe38"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b049ff4bf8f51c4a1d2156f91941b14c9222088ae488b1a692c207a6737be150"
    sha256 cellar: :any_skip_relocation, sequoia: "344c63273aba9561a1be7a2e58d4da1f57bcf07b230fb039694700ecb71c7bd9"
    sha256 cellar: :any, x86_64_linux: "8d5cb7fb3793f9997f0dd0dc3dfe08c143c7b834e54a7f8eac011372c6a339db"
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
