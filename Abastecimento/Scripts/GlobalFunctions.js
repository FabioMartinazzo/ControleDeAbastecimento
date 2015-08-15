function makeValorAppears(jsonRow) {
    return parseFloat(jsonRow.Valor).toFixed(2).replace(".", ",");
}

function makeMarcaAppears(jsonRow) {
    return jsonRow.Marca;
}

function makeRefAppears(jsonRow) {
    return jsonRow.Referencia;
}

function getDescricaoEValoresProduto() {
    var columnsAndFunctions = [];
    columnsAndFunctions.push(makeColumnAndFunction("Valor", callBackValor));
    columnsAndFunctions.push(makeColumnAndFunction("ValorCompra", callBackValorCompra));
            
    getDescription("CODPRO", "DESPRO", <%= Session["IdEstabelecimento"] %>, "getServOrProd", 
                    "servProd", "tipo=2&", columnsAndFunctions);
}

function callBackValor(item) {
    $("#VALVEN").val(parseFloat(item).toFixed(2).replace(".", ","));
}

function callBackValorCompra(item) {
    $("#VALLAN").val(parseFloat(item).toFixed(2).replace(".", ","));
}