# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Polyglot API toolkit with Rust core and bindings for Python, Node.js, Ruby, and WASM"
  homepage "https://github.com/Goldziher/spikard"
  url "https://github.com/Goldziher/spikard/archive/v0.10.1.tar.gz"
  sha256 "18b056b235838c789cdecd51424d3b768637a9dcda2a83067b875ed741b037d5"
  license "MIT"
  head "https://github.com/Goldziher/spikard.git", branch: "main"











  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.10.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "32331202a6b551aa3b60e8641c14740861b4105f4c75bc7f26df2471024128b8"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "d82d63d1a737fc00b8080c0ef07400beab264293ad6875c29451d52e84324206"
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
