import express from "express";
import mongoose from "mongoose";
import bcrypt from "bcrypt";

// const bcrypt = require('bcrypt');
const app = express();
app.listen(5000, () =>{
    console.log("server is working fine ")
})
//database connection
mongoose.connect("mongodb://127.0.0.1:27017" , {
    dbName: "backend",

}).then(() =>
    console.log("database connected")).catch((e)=> console.log(e));

    const MessageSchema = mongoose.Schema({
        name: String,
        email: String,
        password: String,
    });
    const Message = mongoose.model("Message" , MessageSchema);


app.use(express.urlencoded({ extended:false}))
app.set("view engine", "ejs");
app.get("/", (req ,res) => {
    res.render("index");
    // res.sendFile("index.html");
    // res.end("heleo")
    // const pathlocation = path.resolve();
    // console.log(path.join(pathlocation , "lol"))

});
app.get("/login" ,(req,res)=>{
    res.render("login");
})
app.post("/login" ,(req,res)=>{
    res.render("login");
})
app.post("/register" , async(req,res)=>{
   try{
    const hashedpassword = await bcrypt.hash(req.body.password, 10)
    const sendmsgtodb = ({name : req.body.name, email : req.body.email ,password:hashedpassword})
    await Message.create(sendmsgtodb);

    res.redirect("/login");
   }
   catch{
    res.redirect("/register");
   }
})
app.get("/register" ,(req,res)=>{
    res.render("register");
})