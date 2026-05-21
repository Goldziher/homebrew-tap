# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Polyglot API toolkit with Rust core and bindings for Python, Node.js, Ruby, and WASM"
  homepage "https://github.com/Goldziher/spikard"
  url "https://github.com/Goldziher/spikard/archive/v0.15.4.tar.gz"
  sha256 "c3857f89958f45a8c8ae6e5429a97ef2608a9ae3b5d8cb2824896b35a47ae7e0"
  license "MIT"
  head "https://github.com/Goldziher/spikard.git", branch: "main"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.15.4"
    sha256 cellar: :any_skip_relocation, arm64_linux: "c31a2318f9a5b8e5842da9665f74a5d2dda6c92ed3546f72bd43d73f07b58619"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ec9ff5312f1fc2a2fe9f2247e337de73e4a74336f727e44b96d7e562110df474"
    sha256 cellar: :any_skip_relocation, sequoia: "a3cc337e82a6f593a7f0938bd55a2f659f8e6abc584d7c08bd4a953d6bd870c1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2e54c70cd4bcdf3cbe6b09e8aa87caa52337f570482757c006ce7ae704de88cc"
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
