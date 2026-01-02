# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Polyglot API toolkit with Rust core and bindings for Python, Node.js, Ruby, and WASM"
  homepage "https://github.com/Goldziher/spikard"
  url "https://github.com/Goldziher/spikard/archive/v0.8.2.tar.gz"
  sha256 "6e19d50c6983edfc79d4b1e2097c78eaebf908e55a63fbc5d6c9a4afd54b8fe5"
  license "MIT"
  head "https://github.com/Goldziher/spikard.git", branch: "main"


  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.8.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c50af8829061db7d4a9ba707018513d79892acac6119e4bbc7336b51f9ec4978"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "f9ccf44e640708d29115a96dd7ee2660c72f776edb6a43fbff87c3a5e2d91ba6"
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
