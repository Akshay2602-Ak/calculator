
const API_URL = "https://calculator-api.takshaykumar26022004.workers.dev";

const calculateButton = document.getElementById("calculate");
const resultElement = document.getElementById("result");

calculateButton.addEventListener("click", async () => {
  const firstValue = document.getElementById("num1").value;
  const secondValue = document.getElementById("num2").value;
  const operation = document.getElementById("operation").value;

  if (firstValue.trim() === "" || secondValue.trim() === "") {
    resultElement.textContent = "Please enter both numbers.";
    return;
  }

  const a = Number(firstValue);
  const b = Number(secondValue);

  if (!Number.isFinite(a) || !Number.isFinite(b)) {
    resultElement.textContent = "Please enter valid numbers.";
    return;
  }

  calculateButton.disabled = true;
  resultElement.textContent = "Calculating...";

  try {
    const response = await fetch(`${API_URL}/api/calculate`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ a, b, operation })
    });

    const data = await response.json();

    if (!response.ok) {
      throw new Error(data.error || "Calculation failed.");
    }

    resultElement.textContent = `Result: ${data.result}`;
  } catch (error) {
    resultElement.textContent = `Error: ${error.message}`;
  } finally {
    calculateButton.disabled = false;
  }
});
