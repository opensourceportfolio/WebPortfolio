/// <reference path="../jquery-1.4.1.js" />

$(document).ready(function () {
    setTabs();
    getDividendsData();
});

function getDividendsData() {
    $.getJSON("/Quote/getQuoteDividends", null, function (response) {
        loadDividendData(response.dividends);
        loadTransactionsData(response.transactions);
        enableAddTransactions(response.portfolioID);
    });
}

function addNewDividend() {
    $.getJSON("/Quote/addNewDividend", {
        type: $("#selectDividendType").val(),
        dividendDate: $("#inputDividendDate").val(),
        amount: $("#inputDividendAmount").val(),
        tax: $("#inputDividendTax").val(),
        currency: $("#selectDividendCurrency").val(),
        note: $("#inputDividendNote").val()
    }, function (response) {
        loadDividendData(response.dividends);
    });
}

function addNewTransaction() {
    $.getJSON("/Quote/addNewTransaction", {
        type: $("#selectTransactionType").val(),
        purchaseDate: $("#inputTransactionDate").val(),
        price: $("#inputTransactionPrice").val(),
        shares: $("#inputTransactionShares").val(),
        commission: $("#inputTransactionCommission").val(),
        currency: $("#selectTransactionCurrency").val()
    }, function (response) {
        loadTransactionsData(response.transactions);
    });
}

function loadDividendData(dividendData) {
    //set up dividend data            
    $("#TableDividend > tbody").find("tr").remove();
    for (var item in dividendData) {
        var dividend = dividendData[item];
        $("#TableDividend > tbody").append($('<tr></tr>')
                        .append($('<td></td>').text(dividend.dividendDate))
                        .append($('<td></td>').text(dividend.type))
                        .append($('<td></td>').text(dividend.amount))
                        .append($('<td></td>').text(dividend.tax))
                        .append($('<td></td>').text(dividend.dividendValue))
                        .append($('<td></td>').text(dividend.note)));
    }

    $("#TableDividend").trigger("update");
    makeTableSortable("#TableDividend");
}

function loadTransactionsData(transactionsData) {
    //set up transactions data            
    $("#TableTransactions > tbody").find("tr").remove();
    for (var item in transactionsData) {
        var transaction = transactionsData[item];
        $("#TableTransactions > tbody").append($('<tr></tr>')
                        .append($('<td></td>').text(transaction.type))
                        .append($('<td></td>').text(transaction.transactionDate))
                        .append($('<td></td>').text(transaction.price))
                        .append($('<td></td>').text(transaction.shares))
                        .append($('<td></td>').text(transaction.commission))
                        .append($('<td></td>').text(transaction.currency))
                        .append($('<td></td>').text(transaction.transactionValue)));
    }

    makeTableSortable("#TableTransactions");
}

function setTabs() {
    $(".tab_content").hide(); //Hide all content
    $("ul.tabs li:first").addClass("active").show(); //Activate first tab
    $(".tab_content:first").show(); //Show first tab content

    //On Click Event
    $("ul.tabs li").click(function () {

        $("ul.tabs li").removeClass("active"); //Remove any "active" class
        $(this).addClass("active"); //Add "active" class to selected tab
        $(".tab_content").hide(); //Hide all tab content

        var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
        $(activeTab).fadeIn(); //Fade in the active ID content
        return false;
    });
}

function enableAddTransactions(portfolioID) {
    enableAddHoldings($("#divAddDividend"), addNewDividend, portfolioID);
    enableAddHoldings($("#divAddTransaction"), addNewTransaction, portfolioID);
}