const postSchema = require("./Schema");
const express = require("express");
const router = express.Router();

router.get("/", async (req, res) => {
  try {
    const posts = await postSchema.find();
    res.json(posts);
  } catch (error) {
    console.log(error);
  }
});

router.post("/add", async (req, res) => {
  const post = new postSchema({
    name: req.body.name,
    phone: req.body.phone,
    location: req.body.location,
    price: req.body.price,
    rating: req.body.rating,
  });
  try {
    const savedPost = await post.save();
    res.json(savedPost);
  } catch (error) {
    console.log(error);
  }
});

module.exports = router;
