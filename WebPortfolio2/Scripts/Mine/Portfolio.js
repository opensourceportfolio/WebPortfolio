/// <reference path="../jquery-1.4.1.js" />
/// <reference path="jquery.yql.js" />

$(document).ready(function () {
    $("#divAddHolding").hide();
    getPortfolioData(null);
});

function getPortfolioData(ID) {
    //get portfolio data
    $.getJSON("/Portfolio/getPortfolioData", { showAll: false, portfolioID: ID }, function (response) {
        loadPortfolioData(response);
        enableAddHoldings($("#divAddHolding"), addNewQuote, response.portfolioID);
    });
}

function loadPortfolioData(portfolioData) {
    //display portfolio
    $("#tablePortfolio").hide();
    setData(portfolioData);
    $("#tablePortfolio").fadeIn();
    makeTableSortable("#tablePortfolio");

    //enable dividend click
    enableDividendNavigation();
}

//display DB data
function setData(portfolioData) {
    var quotes = portfolioData.Quotes;
    var symbolsString;

    for (var item in quotes) {
        var quote = quotes[item];
        $("#tablePortfolio tbody").append($('<tr></tr>')
                        .data("purchases", quote.purchases)
                        .append($('<td class="viewDividends symbol"></td>').text(quote.Symbol))
                        .append($('<td class="Name"></td>').text(""))
                        .append($('<td class="heighlightColumn PercentChange"></td>').text("0"))
                        .append($('<td class="AskRealtime"></td>').text("0"))
                        .append($('<td class="SharesOwned"></td>').text(quote.shares))
                        .append($('<td></td>').text(quote.totalCost))
                        .append($('<td class="MarketValue"></td>').text(quote.totalCost))
                        .append($('<td class="heighlightColumn growthRate"></td>').text("0"))
                        .append($('<td class="ChangeFromYearHigh"></td>').text("0"))
                        .append($('<td class="DividendYield"></td>').text("0")));
    }
    $("#tablePortfolio").trigger("update");
    getLiveData(getSymbols(portfolioData), portfolioData);
}

function getSymbols(portfolioData) {
    var quotes = portfolioData.Quotes;
    var symbols = new Array();
    for (var i = 0; i < quotes.length; i++) {
        var quote = quotes[i];
        if (quote.Symbol != "CASH") { symbols[i] = quote.Symbol; }
    }
    return symbols;
}

//get Yahoo Finance data
function getLiveData(symbols, portfolioData) {
    var symbolsString = symbols.join('","');
    $.yql("use 'https://github.com/yql/yql-tables/raw/master/yahoo/finance/yahoo.finance.quotes.xml' as yahoo.finance.quotes select * from yahoo.finance.quotes where symbol in (#{lookupSymbols})",
    {
        lookupSymbols: symbolsString
    },
    function (data) {
        if (data.error == null) {
            bindLiveData(data.query.results.quote, portfolioData)
        }
    });
}


//display Yahoo Finance data
function bindLiveData(quotes, portfolioData) {
    var quote;
    var symbol;
    var rows = $("#tablePortfolio > tbody > tr");
    var row;
    var rowSymbol;
    var sharesOwned;
    var marketValue;
    var purchaseData;
    var purchase;
    var growthRate = 0;
    var today = new Date();
    var totalShares = 0;
    var purchaseDate;

    portfolioData.priceChange = 0;
    portfolioData.totalYield = 0;
    portfolioData.totalMarketValue = 0;

    $("#tablePortfolio > tbody > tr").each(function () {
        rowSymbol = $(this).find("td.symbol").text();
        sharesOwned = $(this).find("td.SharesOwned").text();
        purchaseData = $(this).data("purchases");
        if (rowSymbol == "CASH") {
            portfolioData.totalMarketValue += parseFloat($(this).find("td.MarketValue").text());
        }
        else {
            for (var item in quotes) {
                quote = quotes[item];
                symbol = quote.symbol;
                if (rowSymbol == symbol) {
                    growthRate = 0;
                    totalShares = 0;
                    for (var index in purchaseData) {
                        purchase = purchaseData[index];
                        purchaseDate = parseInt(purchase.transactionDate.substr(6));
                        growthRate += purchase.shares * (Math.pow(quote.AskRealtime / purchase.price,
                                                1 / yearsApart(purchaseDate, today.toString())) - 1) * 100;
                        totalShares += purchase.shares;
                    }
                    marketValue = Math.round(quote.AskRealtime * sharesOwned * 100) / 100
                    $(this).find("td.Name").text(quote.Name);
                    $(this).find("td.PercentChange").text(quote.PercentChange);
                    $(this).find("td.AskRealtime").text(quote.AskRealtime);
                    $(this).find("td.MarketValue").text(marketValue);
                    $(this).find("td.growthRate").text(Math.round(growthRate / totalShares * 100) / 100);
                    $(this).find("td.ChangeFromYearHigh").text(quote.ChangeFromYearHigh);
                    $(this).find("td.DividendYield").text(quote.DividendYield);
                    portfolioData.priceChange += quote.PercentChange.replace("%", "") * marketValue;
                    portfolioData.totalYield += quote.DividendYield * marketValue
                    portfolioData.totalMarketValue += marketValue
                    heighlightRow($(this));
                    break;
                }
            }
        }
    });

    //calculate sums
    portfolioData.priceChange = Math.round(portfolioData.priceChange
                                    / portfolioData.totalMarketValue * 100) / 100;
    portfolioData.totalMarketValue = Math.round(portfolioData.totalMarketValue * 100) / 100;
    portfolioData.totalYield = Math.round(portfolioData.totalYield
                                    / portfolioData.totalMarketValue * 100) / 100;
    //get summary data    
    loadSummary(portfolioData);

    $("#tablePortfolio").trigger("update");
}

function loadSummary(summary) {
    //get portfolio summary
    var footer = $("#tablePortfolio tfoot");
    $(footer).find("tr").remove();
    $(footer).append($('<tr></tr>')
                        .append($('<td colspan="2"></td>').html('<b>Portfolio: ' + summary.portfolioName + '</b>'))
                        .append($('<td colspan="3" class="heighlightColumn"></td>').text(summary.priceChange))
                        .append($('<td></td>').text(summary.totalCost))
                        .append($('<td colspan="3"></td>').text(summary.totalMarketValue))
                        .append($('<td></td>').text(summary.totalYield)));

    //heightlight all the changes
    heighlightRow($("tr", footer));
}

function addNewQuote() {
    $.getJSON("/Portfolio/addNewHolding", {
        symbol: $("#inputQuoteSymbol").val(),
        shares: $("#inputQuoteShares").val(),
        purchaseDate: $("#inputQuoteDate").val(),
        price: $("#inputQuotePrice").val(),
        commission: $("#inputQuoteCommission").val(),
        currency: $("#selectQuoteCurrency").val()
    }, function (response) {
        setData(response);
    });
}

function enableDividendNavigation() {
    $("#tablePortfolio tbody td.viewDividends").click(function () {
        if ($(this).text() == "CASH") {
            window.location.href = "/Quote/CashDetails/";
        } else {
            window.location.href = "/Quote/Details/?symbol=" + $(this).text();
        }
    });
}

function heighlightRow(row) {
    $('td.heighlightColumn', row).each(function () {
        var value = $(this).text() + "";
        value = value.replace("%", "");
        if (value < 0) {
            $(this).addClass("negative");
        }
        else {
            $(this).addClass("positive");
        }
    });
}