import express, { Request, Response, NextFunction } from 'express';
import cookieParser from 'cookie-parser';
import fs from 'fs';
import path from 'path';

const app = express();
const PORT = 3001;
const usersDir = path.join(__dirname, 'users');

// Extend Request interface to include userId
interface CustomRequest extends Request {
  userId?: string;
}

app.use(express.json());
app.use(cookieParser());

app.use((req: CustomRequest, res: Response, next: NextFunction) => {
  let userId = req.cookies['userId'];
  if (!userId) {
    userId = `user_${Math.random().toString(36).substr(2, 9)}`;
    res.cookie('userId', userId, { maxAge: 900000, httpOnly: true });
  }
  req.userId = userId;
  next();
});

app.post('/create-folder', (req: CustomRequest, res: Response) => {
  const folderPath = path.join(usersDir, req.userId!); // Using ! to assert req.userId is defined
  if (!fs.existsSync(folderPath)) {
    fs.mkdirSync(folderPath);
  }
  res.send({ folderName: req.userId });
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
