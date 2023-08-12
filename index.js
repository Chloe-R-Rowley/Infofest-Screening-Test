// Basic node js functions include readfile write file import 

// import http from "http";
// import gfName from "./features.js";

// // const http = require("http");
// // const gfffName = require("./features")

// console.log(gfName)
// const server = http.createServer((req, res) =>{
//     console.log(req.url)
//     res.end("hello")
//     console.log("server ")
// });

// server.listen(5000, () =>{
//     console.log("server is working11");
// })
import mongoose from "mongoose";
import express from "express";
import path from "path";
import cookieParser from "cookie-parser";


mongoose.connect("mongodb://127.0.0.1:27017" , {
    dbName: "backend",

}).then(() =>
    console.log("database connected")).catch((e)=> console.log(e));

const MessageSchema = mongoose.Schema({
    name: String,
    email: String,
});
const Message = mongoose.model("Message" , MessageSchema);



//to get the static files from public folder where we can make files for photos videos etc
//
// const users =[];
const app = express();
//middleware to excess the file or path
app.use(express.urlencoded({ extended:true}))
app.use(express.static(path.join(path.resolve() , "public")));
app.use(cookieParser());
app.set("view engine", "ejs");

app.get("/", (req ,res) => {
    res.render("login");
    // res.sendFile("index.html");
    // res.end("heleo")
    // const pathlocation = path.resolve();
    // console.log(path.join(pathlocation , "lol"))

});
app.get("/success", (req ,res) => {
    res.render("success.ejs");

});
app.post("/contacts" , async (req ,res) =>{
   

    const sendmsgtodb = ({name : req.body.name, email : req.body.email})
     await Message.create(sendmsgtodb);
    // res.redirect("/success");
})

app.post("/login" ,(req,res)=>{
    res.render("login");
})
app.get("/users", (req ,res) =>{
    res.json({
        users ,
    })
})
app.listen(5000, () =>{
    console.log("server is working fine ")
})