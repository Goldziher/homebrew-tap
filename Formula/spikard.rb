# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.15.6-rc.24"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "1fdd146bbd92aaf4076d54e66d261dd95baa220b547298832314c9db95dfc2ff"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.15.6-rc.24"
    sha256 cellar: :any, arm64_linux: "b6cc5fc35b2c73105dc5283efe2e05d92c731ae7ab6444afb5b51651fb427b12"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c2b547a862afc1fa0a6b9920a3ce24173a180acbe27917e9058e4ef400aff383"
    sha256 cellar: :any_skip_relocation, sequoia: "b675ea5880bc28aae65e723cea288e5206fd75790a833194296609767a65dd8b"
    sha256 cellar: :any, x86_64_linux: "4d4205193b8c71d4b61ebbab522baafb4640e119c51bca45949f0c91832641c0"
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
