FROM debian:stable-slim

# 1. System dependencies + curl, tar, gzip aur bash install karein
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    tar \
    gzip \
    bash \
    && rm -rf /var/lib/apt/lists/*

# 2. Railway CLI ko globally BASH ke sath install karein
RUN curl -fsSL https://railway.app/install.sh | bash

# 3. Working directory set karein
WORKDIR /app

# 4. Saari files ko container me copy karein
COPY . .

# 5. Seedha bot.bin ko executable banayein (Tukde jodne ki zaroorat nahi)
RUN chmod +x bot.bin

# 6. Bot binary ko run karein
CMD ["./bot.bin"]
