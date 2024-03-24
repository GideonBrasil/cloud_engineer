import express, { Request, Response, NextFunction } from "express";
require('dotenv').config();
const app = express();

app.use(express.json());

const payload = {
  message: "Automate all the things!",
  timestamp: 1529729125
};

// Routes
app.get('/', (req: Request, res: Response) => {
    res.send('Server up and running...');
});

app.get('/api/timestamps', (req: Request, res: Response) => {
    res.json(payload)
});

// Error handling
app.use((err: Error, req: Request, res: Response, next: NextFunction) => {
    console.error(err.stack);
    res.status(500).send('Please be patient, something went wrong!');
});

// Export the app for use in other files, such as tests
export default app;

// Start server
const port = process.env.PORT || 3000;
if (require.main === module) {
    app.listen(port, () => console.log(`Listening on port ${port}...`));
};