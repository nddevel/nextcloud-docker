# 📁 Portable Nextcloud with Docker

This project provides a **single-file script** to run a fully portable [Nextcloud](https://nextcloud.com/) instance using Docker, with local data storage and easy backup/restore functionality.

---

## 🚀 Features

- One-command setup using Docker
- Stores all data locally in `nextcloud-data/`
- Backs up to a single `.tar.gz` file
- Fully portable: move or zip everything easily
- No external database — uses built-in SQLite

---

## 📂 Files

| File | Description |
|------|-------------|
| `nextcloud.sh` | Bash script to manage Nextcloud |
| `nextcloud-data/` | Directory where all Nextcloud data is stored |
| `nextcloud-backup.tar.gz` | Compressed backup archive (created via `backup`) |

---

## 🛠️ Requirements

- Linux system (tested on Arch Linux)
- [Docker](https://www.docker.com/) installed and running
# nextcloud-docker
---

## 🔧 Usage

Make the script executable:

```bash
chmod +x nextcloud.sh

./nextcloud.sh start     # Start Nextcloud (http://localhost:8080)
./nextcloud.sh stop      # Stop container
./nextcloud.sh delete    # Remove container (keeps data)
./nextcloud.sh backup    # Create backup (nextcloud-backup.tar.gz)
./nextcloud.sh restore   # Restore from backup
