# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.17.2"
  url "https://github.com/Goldziher/spikard.git",
      tag:      "v0.17.2",
      revision: "065ea81efcc1e1b27357df540515824703ccc8f7"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.17.2"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b888786252f93c9638643e87b5dd10ab11e880593afbbce9c3f397df63b36cbe"
    sha256 cellar: :any,                 arm64_linux:   "c4c3953de63ddcf8057dcb5c7d20edaac99f3afecf5ed56e64f77773cdc430d4"
    sha256 cellar: :any,                 x86_64_linux:  "4f3371995afe1092c0f10ff7ff486a4634e6ed1109ef91a23983007181369d7c"
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
