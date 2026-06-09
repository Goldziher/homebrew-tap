# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.15.6-rc.20"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "0511c8e6f313e47e2f3864362b92700bfdfb0fb207274b23cbce7424cdaf5036"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.15.6-rc.20"
    sha256 cellar: :any, arm64_linux: "0026bb8226453b38fa998effa0c8e55aeabf2c4bd6b6e56b425039c417dea0b2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3d5a8dbeb2a895629e5f876636261460d9679676aad6e0bb4f917b1870686eb9"
    sha256 cellar: :any_skip_relocation, sequoia: "8166f4ff34a9c4a722c21f667db3f886000601c5ecfe93ce2f32551a12f289e0"
    sha256 cellar: :any, x86_64_linux: "9759aadff5c927e74849cf6ca7164deb117475f76baccf17e874d18445a2a0b1"
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
