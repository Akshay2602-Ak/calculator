
const express = require("express");
const cors = require("cors");

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

app.get("/health", (req, res) => {
  res.json({ status: "ok" });
});

app.post("/calculate", (req, res) => {
  const { a, b, operation } = req.body;

  if (
    typeof a !== "number" ||
    typeof b !== "number" ||
    !Number.isFinite(a) ||
    !Number.isFinite(b)
  ) {
    return res.status(400).json({
      error: "a and b must be finite numbers"
    });
  }

  let result;

  switch (operation) {
    case "add":
      result = a + b;
      break;
    case "subtract":
      result = a - b;
      break;
    case "multiply":
      result = a * b;
      break;
    case "divide":
      if (b === 0) {
        return res.status(400).json({
          error: "Cannot divide by zero"
        });
      }
      result = a / b;
      break;
    default:
      return res.status(400).json({
        error: "Unsupported operation"
      });
  }

  if (!Number.isFinite(result)) {
    return res.status(400).json({
      error: "Result is outside the supported numeric range"
    });
  }

  res.json({ result });
});

app.listen(PORT, "127.0.0.1", () => {
  console.log(`Calculator API listening on port ${PORT}`);
});