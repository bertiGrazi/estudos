import express from "express"

const app = express();

//Porta que vamos executar o projeto: http: //localhost: 3000
app.listen(3000, () =>  { 
  return console.log("Server is running NLW") 
});
