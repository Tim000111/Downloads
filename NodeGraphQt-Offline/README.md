# NodeGraphQt Offline Installer — Windows x64 / Python 3.10

This repository contains the **builder** for an offline installation bundle, not pre-downloaded wheels.

## Build on an internet-connected Windows x64 PC

1. Install Python 3.10 (64-bit) with pip.
2. Run `build_online.bat`.
3. Copy the generated `NodeGraphQt-Offline-win_amd64-py310.zip` to the offline PC.

## Install on the offline Windows PC

1. Install Python 3.10 (64-bit).
2. Extract the generated ZIP.
3. Run `install_offline.bat`.
4. Run `verify.bat`.

The generated bundle contains the wheelhouse, source archive, install and verification batch files. It uses an isolated `.venv` and `--no-index` for offline installation. It does **not** include Python itself. Qt GUI must be tested on the target machine.

Requirements: NodeGraphQt==0.6.44, PyQt5. All transitive dependencies are downloaded by pip. Check the licenses of bundled packages before redistribution.

No GitHub Actions are used.
