"""Build a Windows x64 Python 3.10 offline NodeGraphQt package."""
from pathlib import Path
import subprocess
import sys
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parent
DIST = ROOT / "dist"
NAME = "NodeGraphQt-Offline-win_amd64-py310"
REQUIREMENTS = "NodeGraphQt==0.6.44\nPyQt5\n"

def run(*args):
    subprocess.run([sys.executable, *args], check=True)

def main():
    if sys.platform != "win32" or sys.version_info[:2] != (3, 10):
        raise SystemExit("Build on Windows with Python 3.10.")
    with tempfile.TemporaryDirectory() as temp:
        bundle = Path(temp) / NAME
        wheels = bundle / "wheelhouse"
        wheels.mkdir(parents=True)
        (bundle / "requirements.txt").write_text(REQUIREMENTS, encoding="utf-8")
        run("-m", "pip", "download", "--only-binary=:all:", "-d", str(wheels),
            "-r", str(bundle / "requirements.txt"))
        source = bundle / "source"
        source.mkdir()
        run("-m", "pip", "download", "--no-deps", "--no-binary=:all:",
            "-d", str(source), "NodeGraphQt==0.6.44")
        for filename in ("install_offline.bat", "verify.bat"):
            (bundle / filename).write_bytes((ROOT / filename).read_bytes())
        # Verify wheelhouse resolution without contacting package indexes.
        run("-m", "pip", "install", "--dry-run", "--ignore-installed",
            "--no-index", "--find-links", str(wheels), "-r",
            str(bundle / "requirements.txt"))
        DIST.mkdir(exist_ok=True)
        output = DIST / (NAME + ".zip")
        with zipfile.ZipFile(output, "w", zipfile.ZIP_DEFLATED) as archive:
            for file in bundle.rglob("*"):
                if file.is_file():
                    archive.write(file, file.relative_to(bundle.parent))
        print("CREATED:", output)
        print("NOTE: GUI execution has not been verified on the target PC.")

if __name__ == "__main__":
    main()
