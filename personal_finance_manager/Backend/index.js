const express = require('express');
const app = express();
const port = 3000;

app.use(express.json());

// Enable CORS for development purposes.
app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*"); // Allow all origins for demo purposes
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

// In-memory storage for transactions.
let transactions = [];

// GET /transactions - Retrieve all transactions.
app.get('/transactions', (req, res) => {
  res.json(transactions);
});

// POST /transactions - Add a new transaction.
app.post('/transactions', (req, res) => {
  const { amount, description, date, category } = req.body;
  if (!amount || !description || !category) {
    return res.status(400).json({ error: 'Missing required fields' });
  }
  const newTransaction = {
    id: transactions.length + 1,
    amount,
    description,
    date: date || new Date().toISOString(),
    category
  };
  transactions.push(newTransaction);
  res.status(201).json(newTransaction);
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
