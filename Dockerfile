# Dockerfile
FROM circleci/node:14

# ตั้งค่าตำแหน่งที่ทำงาน
WORKDIR /usr/src/app

# คัดลอก package.json และ package-lock.json
COPY package*.json ./

# ติดตั้ง dependencies
RUN npm install

# คัดลอกโค้ดทั้งหมด
COPY . .

# สั่งรันแอปพลิเคชัน
CMD ["node", "server.js"]
