require("dotenv").config();
const express = require("express");
const app = express();
const mongoose = require("mongoose");
const route = require("./Router");
const PORT = process.env.PORT || 5050;

app.use(express.urlencoded({ extended: false }));
app.use(express.json());

const MongoDB = process.env.MONGODB_URI;

mongoose.connect(
  MongoDB,
  { useNewUrlParser: true, useUnifiedTopology: true },
  () => {
    console.log("Database Connected");
  }
);

app.use(route);

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
