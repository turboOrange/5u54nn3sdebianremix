# 5u54nn3's Debian Remix

This is a live-build configuration for a Debian-based custom OS.

## Features
- KDE Plasma with Bismuth tiling extension
- Terminator as the default terminal
- Preinstalled languages: Python, C, C++, Rust, JavaScript, TypeScript
- VS Code with Docker support
- docker & docker-compose

## Build Locally

```bash
sudo apt install live-build
sudo lb config
sudo lb build
```

## GitHub Action

Automatically builds ISO and uploads as an artifact.