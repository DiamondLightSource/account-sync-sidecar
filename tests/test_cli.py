import subprocess
import sys

from account_sync_sidecar import __version__


def test_cli_version():
    cmd = [sys.executable, "-m", "account_sync_sidecar", "--version"]
    assert subprocess.check_output(cmd).decode().strip() == __version__
