function CopyString(inputStr, start, count) {
    var tmpReturn = "";
    var n = 0;
    while (n < count) {
        tmpReturn = tmpReturn + inputStr[(start * 1) + (n * 1)];
        n++;
    }
    return tmpReturn;
}

function ReplaceStr(inputStr, pos, charToRepl) {
    return CopyString(inputStr, 0, pos) + charToRepl + CopyString(inputStr, (pos + 1), ((inputStr.length - 1) - pos));
}

function LocateCharinStr(inputStr, char) {
    var n = 0;
    while (n < inputStr.length) {
        if (inputStr[n] == char)
            return n;
        n++;
    }
    return -1;
}

function LocateCharinStrFromPos(inputStr, char, pos) {
    var n = pos;
    while (n < inputStr.length) {
        if (inputStr[n] == char)
            return n;
        n++;
    }
    return -1;
}

function LocateCharinStrFromPosToLeft(inputStr, char, pos) {
    var n = pos;
    while (n >= 0) {
        if (inputStr[n] == char)
            return n;
        n--;
    }
    return -1;
}

function ReplaceAllStr(inputStr, char, charToRepl) {
    var tmpOutput = inputStr;
    while (true) {
        var n = LocateCharinStr(tmpOutput, char);
        if (n != -1)
            tmpOutput = ReplaceStr(tmpOutput, n, charToRepl);
        else
            break;
    }
    return tmpOutput;
}

function ReplaceAllStrFromPos(inputStr, char, charToRepl, pos) {
    var tmpOutput = inputStr;
    while (true) {
        var n = LocateCharinStrFromPos(tmpOutput, char, pos);
        if (n != -1)
            tmpOutput = ReplaceStr(tmpOutput, n, charToRepl);
        else
            break;
    }
    return tmpOutput;
}

function NullOr(input, orOut) {
    if (input == "")
        return orOut
    else
        return input;
}

function identaZero(input) {
    var inputAsStr = input + "";
    if (inputAsStr.length < 2)
        return "0" + inputAsStr;
    else
        return inputAsStr;
}

function inserirCaractere(input, caractere, pos) {
    return CopyString(input, 0, pos) + caractere + CopyString(input, pos, (input.length - pos));
}