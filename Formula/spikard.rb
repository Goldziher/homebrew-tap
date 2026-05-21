# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Polyglot API toolkit with Rust core and bindings for Python, Node.js, Ruby, and WASM"
  homepage "https://github.com/Goldziher/spikard"
  url "https://github.com/Goldziher/spikard/archive/v0.15.5.tar.gz"
  sha256 "634a26a1c6cb14835ab924990a1abb93b1a3eef8e5fabc074bd5b28bb8199628"
  license "MIT"
  head "https://github.com/Goldziher/spikard.git", branch: "main"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.15.5"
    sha256 cellar: :any_skip_relocation, arm64_linux: "5dcca9ce44214cb271ed5362f3491f3b727b402eff73b9aac52b11026198ebc5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "bd9befc2db16c594e7bdfbbb7679395a67f733e6e966fc24497f5770c18c3065"
    sha256 cellar: :any_skip_relocation, sequoia: "1efe97ee95e02e9b3ccb22d8e81fab8c056aa780250ba80764d428cbcda10523"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3d3bbfc3016b3acca0fe649891fd4ba2aa9fa03c3ec46f9231bb92e7d38d5795"
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
