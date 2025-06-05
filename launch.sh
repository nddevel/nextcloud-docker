#!/bin/bash

NAME="cloud"
PORT=8080
DATA_DIR="./ndata"
BACKUP_FILE="nextcloud-backup.tar.gz"

case "$1" in
  start)
    echo "[+] Starting Nextcloud..."
    mkdir -p "$DATA_DIR"
    docker run -d \
      --name "$NAME" \
      -p $PORT:80 \
      -v "$(pwd)/$DATA_DIR:/var/www/html" \
      nextcloud
    echo "[+] Nextcloud is running at http://localhost:$PORT"
    ;;

  stop)
    echo "[+] Stopping container..."
    docker stop "$NAME"
    ;;

  delete)
    echo "[+] Stopping and removing container..."
    docker stop "$NAME"
    docker rm "$NAME"
    ;;

  backup)
    echo "[+] Creating backup..."
    tar -czf "$BACKUP_FILE" "$DATA_DIR"
    echo "[+] Backup saved to $BACKUP_FILE"
    ;;

  restore)
    if [ ! -f "$BACKUP_FILE" ]; then
      echo "[-] No backup file found ($BACKUP_FILE)"
      exit 1
    fi
    echo "[+] Restoring from $BACKUP_FILE..."
    tar -xzf "$BACKUP_FILE"
    echo "[+] Data restored to $DATA_DIR"
    ;;

  help|*)
    echo "Usage: $0 {start|stop|delete|backup|restore|help}"
    ;;
esac
