/// <reference path="../jquery-1.4.1.js" />

$(document).ready(function () {
    getCashData();
    addExchange();
});

function getCashData() {
    $.getJSON("/Quote/getCashDetails", null, function (response) {
        loadCashData(response.cashDetails);
        enableAddHoldings($("#divAddCash"), addNewCash, response.portfolioID);
    });
}

function addNewCash() {
    $.getJSON("/Quote/addNewCash", {
        type: $("#selectCashType").val(),
        cashDate: $("#inputDateCash").val(),
        amountOut: $("#inputAmountOutCash").val(),
        currency: $("#inputCurrencyCash").val(),
        amountIn: $("#inputAmountInCash").val(),
        note: $("#inputNoteCash").val()
    }, function (response) {
        loadCashData(response.cashDetails);
    });
}

function loadCashData(cashDetails) {
    //set up dividend data            
    $("#tableCashDetails > tbody").find("tr").remove();
    for (var item in cashDetails) {
        var detail = cashDetails[item];
        $("#tableCashDetails > tbody").append($('<tr></tr>')
                        .append($('<td></td>').text(detail.type))
                        .append($('<td></td>').text(detail.dividendDate))
                        .append($('<td></td>').text(detail.amount))
                        .append($('<td></td>').text(detail.currency))
                        .append($('<td></td>').text(detail.note)));
    }

    $("#tableCashDetails").trigger("update");
    makeTableSortable("#tableCashDetails");
}

function addExchange() {
    $("#selectCashType").change(function () {
        var value = $(this).val();
        if (value == "EXCHANGE") {
            $("#divToAmountLabel").show();
            $("#divToAmountInput").show();
        }
        else {
            $("#divToAmountLabel").hide();
            $("#divToAmountInput").hide();
        }
    });
}