# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Polyglot API toolkit with Rust core and bindings for Python, Node.js, Ruby, and WASM"
  homepage "https://github.com/Goldziher/spikard"
  url "https://github.com/Goldziher/spikard/archive/v0.10.1.tar.gz"
  sha256 "42d227bd477e9fc9c7628ce909a6fffa4da9fdaa18d734014dfda48aee8a6068"
  license "MIT"
  head "https://github.com/Goldziher/spikard.git", branch: "main"















  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.10.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c971e4a6cf66464959a2f586b9343dc2a3050d1866d7fd4e6b5775fde5618b9a"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "64cc49f5614d5ec14b2e885c03d500f48e53c7d99ae9f5263f91d08957776285"
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
