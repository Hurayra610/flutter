const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const PostSchema = Schema({
  name: String,
  phone: String,
  location: String,
  price: String,
  rating: String,
  date: {
    type: Date,
    default: Date.now().toString(),
  },
});

module.exports = mongoose.model("post", PostSchema);
