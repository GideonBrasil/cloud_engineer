import express from "express";
const app = express();

app.use(express.json());

const payload = {
  message: "Automate all the things!",
  timestamp: 1529729125
};

app.get('/', (req, res) => {
    res.send('Server up and runnig.');
});

app.get('/api/timestamps', (req, res) => {
    res.json(payload)
});

const port = process.env.PORT || 3000;

app.listen(port, () => console.log(`Listening on port ${port}...`));