FROM debian:stable-slim

# 1. System dependencies aur curl install karein (Railway CLI ke liye zaroori hai)
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# 2. Railway CLI ko globally install karein
RUN curl -fsSL https://railway.app/install.sh | sh

# 3. Working directory set karein
WORKDIR /app

# 4. Saari files ko container me copy karein
COPY . .

# 5. Build time par hi saare parts ko jodkar executable bana dein
# (Isse aapka bot runtime par turant start ho jayega)
RUN cat bot_part_* > bot.bin && chmod +x bot.bin

# 6. Bot binary ko run karein
CMD ["./bot.bin"]
