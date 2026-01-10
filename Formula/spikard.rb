# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Polyglot API toolkit with Rust core and bindings for Python, Node.js, Ruby, and WASM"
  homepage "https://github.com/Goldziher/spikard"
  url "https://github.com/Goldziher/spikard/archive/v0.9.0.tar.gz"
  sha256 "ad84d92da821dd19e496c5accb3d1f373d78dc122eaca548231a37fc333f0c14"
  license "MIT"
  head "https://github.com/Goldziher/spikard.git", branch: "main"




  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.9.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "15c313dd6517f4a00eae1a395a67f95c549b98830493d456545c76a6ad438d76"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e821065c821c1962ed8ce31770e0bbf9e3e21c4778adbd53b4c0c5471dbb4353"
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
