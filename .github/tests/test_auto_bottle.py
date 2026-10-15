"""Exercise the bottle dispatch workflow against isolated formula fixtures."""

import os
import subprocess
import tempfile
import textwrap
import unittest
from pathlib import Path

WORKFLOW = Path(__file__).resolve().parents[1] / "workflows" / "auto-bottle.yml"
SOURCE_URL = "https://github.com/Goldziher/gitfluff/archive/refs/tags/v0.9.1.tar.gz"
ROOT_URL = "https://github.com/Goldziher/gitfluff/releases/download/v0.9.1"


class AutoBottleTests(unittest.TestCase):
    def dispatch(
        self, bottle_url: str | None = None, *, source_url: str = SOURCE_URL, source_build: bool = True
    ) -> list[str]:
        script = textwrap.dedent(WORKFLOW.read_text().split("run: |\n", 1)[1])
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / "Formula").mkdir()
            commands = root / "bin"
            commands.mkdir()
            git = commands / "git"
            git.write_text("#!/bin/sh\nexit 1\n")
            git.chmod(0o755)
            gh = commands / "gh"
            gh.write_text('#!/bin/sh\nprintf "%s\\n" "$@" >> "$DISPATCH_LOG"\n')
            gh.chmod(0o755)
            formula = f'  url "{source_url}"\n  version "0.9.1"\n'
            if source_build:
                formula += '  depends_on "rust" => :build\n'
            if bottle_url is not None:
                formula += f'  bottle do\n    root_url "{bottle_url}"\n  end\n'
            (root / "Formula" / "gitfluff.rb").write_text(formula)
            log = root / "dispatch.log"
            environment = dict(os.environ, REPO="Goldziher/homebrew-tap", DISPATCH_LOG=str(log))
            environment["PATH"] = str(commands) + os.pathsep + os.environ["PATH"]
            subprocess.run(["bash", "-c", script], cwd=root, env=environment, check=True, capture_output=True)
            return log.read_text().splitlines() if log.exists() else []

    def assert_dispatches_release(self, dispatch: list[str]) -> None:
        self.assertEqual(
            dispatch,
            [
                "workflow",
                "run",
                "bottle.yml",
                "--repo",
                "Goldziher/homebrew-tap",
                "-f",
                "formula=gitfluff",
                "-f",
                "tag=v0.9.1",
                "-f",
                "release_repo=Goldziher/gitfluff",
            ],
        )

    def test_dispatches_when_existing_bottles_belong_to_previous_release(self) -> None:
        self.assert_dispatches_release(self.dispatch(ROOT_URL.replace("v0.9.1", "v0.9.0")))

    def test_skips_when_existing_bottles_match_current_release(self) -> None:
        self.assertEqual(self.dispatch(ROOT_URL), [])

    def test_dispatches_when_bottles_belong_to_different_repository(self) -> None:
        self.assert_dispatches_release(self.dispatch(ROOT_URL.replace("Goldziher/gitfluff", "other/project")))

    def test_dispatches_when_no_bottle_block_exists(self) -> None:
        self.assert_dispatches_release(self.dispatch())

    def test_dispatches_git_sources_using_explicit_version(self) -> None:
        self.assert_dispatches_release(self.dispatch(source_url="https://github.com/Goldziher/gitfluff.git"))

    def test_skips_prebuilt_binary_formulae(self) -> None:
        self.assertEqual(self.dispatch(source_build=False), [])


if __name__ == "__main__":
    unittest.main()
