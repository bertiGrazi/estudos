"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var express_1 = __importDefault(require("express"));
var app = (0, express_1.default)();
/**
 * GET => Buscar uma informação. Qualquer busca.
 * POST => Inserir uma informação dentro da nossa API. Criação.
 * PUT => Alterar uma informação. Manipulação dentro de uma dado já existente.
 * DELETE => Deletar uma informacào
 * PATCH => Alterar uma informação específica. Somente modificar foto, ou senha...
 */
//Primeiro Parâmetro: Rota 
app.get("/test", function (req, res) {
    return res.send("Olá NLW");
});
//Porta que vamos executar o projeto: http: //localhost: 3000
app.listen(3000, function () {
    return console.log("Server is running NLW");
});
