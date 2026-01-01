# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Polyglot API toolkit with Rust core and bindings for Python, Node.js, Ruby, and WASM"
  homepage "https://github.com/Goldziher/spikard"
  url "https://github.com/Goldziher/spikard/archive/v0.8.1.tar.gz"
  sha256 "2d145ad5703031addb3dd5118d2e5296269ef2e5ae2c3c08dd3f22d93a0b30d4"
  license "MIT"
  head "https://github.com/Goldziher/spikard.git", branch: "main"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.8.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9c92691c79090f9c496b65e035e254c343c77c7b8a56212bfbdb4ee6c15acd6b"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "56a7ffc4a25923cbaf696d30705db2ab9a5bd7b63414da63ebf0c8638830dfc6"
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
