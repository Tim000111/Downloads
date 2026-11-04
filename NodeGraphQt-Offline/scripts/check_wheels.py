"""Offline-only dependency resolution check; never contacts a package index."""
from pathlib import Path
import subprocess
import sys

root = Path(__file__).resolve().parent.parent
wheelhouse = root / "wheelhouse"
wheels = sorted(wheelhouse.glob("*.whl")) if wheelhouse.is_dir() else []
if not wheels:
    raise SystemExit("ERROR: wheelhouse is empty. Copy all required .whl files here first.")
cmd = [
    sys.executable, "-m", "pip", "install", "--dry-run", "--ignore-installed",
    "--no-index", "--find-links", str(wheelhouse),
    "-r", str(root / "requirements.txt")
]
print("Checking offline dependency resolution:", len(wheels), "wheel files")
result = subprocess.run(cmd, check=False)
if result.returncode:
    raise SystemExit("ERROR: missing or incompatible wheels; no network access attempted.")
print("Offline dependency resolution passed.")
