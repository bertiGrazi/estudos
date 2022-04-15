import express from "express"

const app = express();

/**
 * GET => Buscar uma informação. Qualquer busca. 
 * POST => Inserir uma informação dentro da nossa API. Criação. 
 * PUT => Alterar uma informação. Manipulação dentro de uma dado já existente.
 * DELETE => Deletar uma informacào
 * PATCH => Alterar uma informação específica. Somente modificar foto, ou senha... 
 */

//Primeiro Parâmetro: Rota 
app.get("/test", (req, res) => {
  return res.send("Olá NLW. ")
})

app.post("/test-post", (req, res) => 
{
  return res.send("Olá, NWL método POST")
})


//Porta que vamos executar o projeto: http: //localhost: 3000
app.listen(8000, () =>  { 
  return console.log("Server is running NLW Oi") 
});
