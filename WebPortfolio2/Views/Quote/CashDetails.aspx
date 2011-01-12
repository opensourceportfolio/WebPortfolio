<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Cash Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/Mine/CashDetails.js" type="text/javascript"></script>
    <table id="tableCashDetails" class="tablesorter" style="width: 1000px;">
        <thead>
            <tr>
                <th>
                    Type
                </th>
                <th>
                    Date
                </th>
                <th>
                    Amount
                </th>
                <th>
                    Currency
                </th>
                <th>
                    Note
                </th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    <div class="pager">
        <a class="first" href="#">first</a> <a class="prev" href="#">previous</a> <a class="next"
            href="#">next</a> <a class="last" href="#">last</a>
        <select class="pagesize">
            <option value="10">10</option>
            <option selected="selected" value="20">20</option>
            <option value="30">30</option>
            <option value="40">40</option>
        </select>
    </div>
    <div id="divAddCash" class="addTransaction">
        <div class="showAddTransactionMenu smallFont">
            <a class="linkAddHolding" href="#">Add cash details</a>
        </div>
        <div class="addTransactionMenu">
            <div style="float: left; padding: 4px;" class="smallFont">
                <div class="horizontal">
                    Transaction Type</div>
                <div class="horizontal">
                    Transaction Date</div>
                <div class="horizontal" id="divFromAmountLabel">
                    Amount</div>
                <div class="horizontal">
                    Currency</div>
                <div class="horizontal" id="divToAmountLabel" style="display: none;">
                    To Amount</div>
                <div class="horizontal veryLong">
                    Note</div>
            </div>
            <div class="addTransactionInput">
                <div class="horizontal">
                    <select class="input" id="selectCashType">
                        <option value="WITHDRAWAL">Withdrawal</option>
                        <option value="DEPOSIT">Deposit</option>
                        <option value="EXCHANGE">Exchange</option>
                        <option value="ADJUSTMENT">Adjustment</option>
                    </select>
                </div>
                <div class="horizontal">
                    <input id="inputDateCash" class="input datepicker" />
                </div>
                <div class="horizontal" id="divFromAmountInput">
                    <input id="inputAmountOutCash" class="input" />
                </div>
                <div class="horizontal">
                    <select id="inputCurrencyCash" class="input short">
                        <option value="U">USD</option>
                        <option value="C">CAD</option>
                    </select>
                </div>
                <div class="horizontal" id="divToAmountInput" style="display: none;">
                    <input id="inputAmountInCash" class="input" value="0" />
                </div>
                <div class="horizontal veryLong">
                    <input maxlength="128" id="inputNoteCash" class="input veryLong"/>
                </div>
                <a href="#" class="horizontal button addTransactionButton">Add</a>
            </div>
        </div>
    </div>
</asp:Content>
