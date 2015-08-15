function MoneyMask(input) {
    
    var n = LocateCharinStr(input, '.');
    if (n != -1) {
        input = ReplaceStr(input, n, ',');
        input = ReplaceAllStr(input, '.', '');
    }

    n = LocateCharinStr(input, ',');
    n = LocateCharinStrFromPos(input, ',', (n+1));

    if (n != -1)
        input = ReplaceAllStrFromPos(input, ',', '', n);

    input = NoLetters(input);

    if (input[0] == ',')
        input = '0' + input;

    if ((input.length > 0) && (input[1] != ',') && (input[0] == '0')){

        var x = LocateCharinStr(input, ',') - 1;
        
        if (x == -2)
            x = input.length - 1;

        var y = LocateCharinStrFromPosToLeft(input, '0', x) + 1;

        if (y != -1)
            n = y;
        else 
            n = x;

        input = CopyString(input, n, input.length - n);
    }

    if (input.length == 0)
        return '0,00';
    else if (input[input.length - 1] == ',')
        return input + '00';
    else if (input[input.length - 2] == ',')
        return input + '0'
    else if (input[input.length - 3] == ',')
        return input;
    else {
        n = LocateCharinStr(input, ',');
        if (n != -1)
            return CopyString(input, 0, n + 3);
        else
            return input + ',00';
    }
}

function NoLetters(inputStr) {
    var tmpOutput = inputStr;
    var x = 0;
    while (x <= 255) {
        tmpChar = String.fromCharCode(x);
        if ((tmpChar != '0') &&
            (tmpChar != '1') &&
            (tmpChar != '2') &&
            (tmpChar != '3') &&
            (tmpChar != '4') &&
            (tmpChar != '5') &&
            (tmpChar != '6') &&
            (tmpChar != '7') &&
            (tmpChar != '8') &&
            (tmpChar != '9') &&
            (tmpChar != ',')) {
                tmpOutput = ReplaceAllStr(tmpOutput, tmpChar, '');
            }
        x = x + 1;
    }
    return tmpOutput;
}

function ZerarSelectList(idSel) {
    //var primeiro = $("#" + idSel + " option").eq(0);
    $("#" + idSel + " option").remove();
    //$("#" + idSel).append(primeiro);
}

function UpdateSelectList(selectToUpdate, arrayItens) {
    ZerarSelectList(selectToUpdate);

    var x = 0;
    while (x < arrayItens.length) {
        var option = $("<option/>").html(getDesc(arrayItens[x])).val(getId(arrayItens[x]));
        $("#" + selectToUpdate).append(option);
        x++;
    }
}

function jsonToArray(response) {
    var tmpReturn = new Array();
    $.each(response, function (index, item) {
        tmpReturn.push(MergeIdDesc(item.Id, item.Descricao));
    });
    return tmpReturn;
}

function getId(arrayIndex) {
    return CopyString(arrayIndex, 0, (LocateCharinStr(arrayIndex, "■")));
}

function getDesc(arrayIndex) {
    pos = LocateCharinStr(arrayIndex, "■");
    return CopyString(arrayIndex, (pos + 1), (arrayIndex.length - 1 - pos));
}

function MergeIdDesc(Id, Desc) {
    return Id + "■" + Desc;
}

function deleteButton(href, enabled) {
    if (enabled == undefined)
        enabled = true;

    var disabledText = " ";
    if (!enabled)
        disabledText = "disabled=\"disabled\" ";

    document.getElementById("iddelete").innerHTML = "<a href=\"" + href + "\" >" +
                                                    "<input type=button value=\"Excluir\" " +
                                                    disabledText + 
                                                    "/>" + 
                                                    "</a>";
}

function montre(id) {
    var d = document.getElementById(id);
    for (var i = 1; i <= 10; i++) {
        if (document.getElementById('smenu' + i)) { document.getElementById('smenu' + i).style.display = 'none'; }
    }
    if (d) { d.style.display = 'block'; }
}

function getDay(date) {
    return CopyString(date, 0, LocateCharinStr(date, "/"));
}

function getMonth(date) {
    return CopyString(date, (LocateCharinStr(date, "/") + 1), LocateCharinStrFromPos(date, "/", ((LocateCharinStr(date, "/") + 1)) - (LocateCharinStr(date, "/") + 1)));
}

function getYear(date) {
    return CopyString(date, (LocateCharinStrFromPos(date, "/", (LocateCharinStr(date, "/") + 1)) + 1), (date.length - (LocateCharinStrFromPos(date, "/", (LocateCharinStr(date, "/") + 1)) + 1)));
}

function formataParaDecimal(numero) {
    return adicionarPontosACadaTres(adicionarZerosFinal(numero));
}

function formataParaDinheiro(dinheiro) {
    return "R$ " + formataParaDecimal(dinheiro);
}

function RoundTwoDecimal(number) {
    return Math.Round(number * 100) / 100;
}

function adicionarZerosFinal(numero) {
    var numeroStr = numero + "";

    if (LocateCharinStr(numeroStr, ".") != -1)
        numeroStr = ReplaceStr(numeroStr, LocateCharinStr(numeroStr, "."), ",");

    if (LocateCharinStr(numeroStr, ",") == -1)
        return numeroStr + ",00";
    else if (CopyString(numeroStr, (LocateCharinStr(numeroStr, ",") + 1), (numeroStr.length - (LocateCharinStr(numeroStr, ",") + 1))).length == 1)
        return numeroStr + "0";
    else
        return numeroStr;
}

function adicionarPontosACadaTres(numeroPreFormatado) {
    var numeroStr = numeroPreFormatado + "";

    var contador = 1;
    var n = (numeroStr.length - 3);
    while (n > 1) {
        if ((contador % 3) == 0)
            numeroStr = inserirCaractere(numeroStr, ".", (n - 1));
        contador++;
        n--;
    }

    return numeroStr;
}

function convertNumberToNumber(inputNumber) {
    var tmpStr = ReplaceAllStr(inputNumber, ".", "");
    return ReplaceAllStr(tmpStr, ",", ".");
}

function aredondaDuasCasas(inputNumber) {
    return Math.round(inputNumber * 100) / 100;
}

function RequestService(url) {
    var outData = null;

    $.ajax({
        url: url,
        type: 'get',
        dataType: 'json',
        async: false,
        success: function (data) {
            outData = data;
        }
    });

    return outData;
}

function makeColumnAndFunction(column, callback) {
    var tmpReturn = new Object();
    tmpReturn.Column = column;
    tmpReturn.Function = callback;

    return tmpReturn;
}

function printPage() {
    window.print();
}