const express = require('express');
const path = require('path');

const app = express();
const PORT = 3000;

// เสิร์ฟไฟล์ Static จากโฟลเดอร์ที่ deploy
app.use(express.static(path.join(__dirname))); // ใช้ path.join เพื่อให้เส้นทางถูกต้อง

// เสิร์ฟไฟล์ HTML
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html')); // ใช้ __dirname เพื่อให้แน่ใจว่าเส้นทางถูกต้อง
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});