// server.ts

import express, { Request, Response } from 'express';
import fs from 'fs';
import path from 'path';
import crypto from 'crypto';

const app = express();
const PORT = 3001;
const usersDir = path.join(__dirname, './users'); // 指定用户文件夹的存储目录

// Middleware to generate hash and create folder
app.use((req: Request, res: Response, next) => {
  const folderName = generateHash();
  const folderPath = path.join(usersDir, folderName);

  fs.mkdir(folderPath, (err) => {
    if (err) {
      console.error('Error creating folder:', err);
      return res.status(500).send('Error creating folder');
    }
    // Attach folderName to request object for later use if needed
    (req as any).folderName = folderName; // 使用类型断言确保 TypeScript 不会报错
    next();
  });
});

// Generate hash function
function generateHash() {
  const current_time = new Date().getTime().toString();
  const random = Math.random().toString();
  return crypto.createHash('md5').update(current_time + random).digest('hex');
}

// Example route to handle user activity
app.post('/user-activity', (req: Request, res: Response) => {
  const { userId } = req.body;
  // Use req.folderName to access the folder name created
  res.send({ message: 'User activity updated', folderName: (req as any).folderName }); // 使用类型断言
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});

