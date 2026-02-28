# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Polyglot API toolkit with Rust core and bindings for Python, Node.js, Ruby, and WASM"
  homepage "https://github.com/Goldziher/spikard"
  url "https://github.com/Goldziher/spikard/archive/v0.12.0.tar.gz"
  sha256 "33a1e631e6a39e0a3ba5daab75136616115c7c272a1946399ab8109a24a7749e"
  license "MIT"
  head "https://github.com/Goldziher/spikard.git", branch: "main"



















  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.12.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b4105f94e7b960890cabbb7a7916253dfb0d10009d68e981f3acfe4667308eb8"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "561ac4dded160b182645bc6e537a5e02d0a39f4920d7f76d9820e12a4be439f8"
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
