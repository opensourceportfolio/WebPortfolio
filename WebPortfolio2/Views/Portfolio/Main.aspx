<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    JQuery
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/Mine/Portfolio.js" type="text/javascript"></script>
    <script src="../../Scripts/Mine/jquery.yql.js" type="text/javascript"></script>
    <table id="tablePortfolio" class="tablesorter" style="width: 1000px;">
        <thead>
            <tr>
                <th>
                    Symbol
                </th>
                <th>
                    Name
                </th>
                <th>
                    % Price Change
                </th>
                <th>
                    Current Price
                </th>
                <th>
                    Shares Held
                </th>
                <th>
                    Total Cost
                </th>
                <th>
                    Market Value
                </th>
                <th>
                    Annual Return
                </th>
                <th>
                    Change From High
                </th>
                <th>
                    Yield
                </th>
            </tr>
        </thead>
        <tbody>
        </tbody>
        <tfoot>
        </tfoot>
    </table>

    <div id="divAddHolding" class="addTransaction">
        <div id="divAddHoldingButton" class="showAddTransactionMenu smallFont">
            <a class="linkAddHolding" href="#">Add new holding</a>
        </div>
        <div id="divAddHoldingMenu" class="addTransactionMenu">
            <div style="float: left; padding: 4px;" class="smallFont">
                <div class="horizontal">
                    Symbol</div>
                <div class="horizontal">
                    Shares</div>
                <div class="horizontal long">
                    Purchase Date</div>
                <div class="horizontal Long">
                    Purchase Price</div>
                <div class="horizontal">
                    Commission</div>
                <div class="horizontal">
                    Currency</div>
            </div>
            <div class="addTransactionInput">
                <div class="horizontal">
                    <input id="inputQuoteSymbol" class="input" style="color: black;" />
                </div>
                <div class="horizontal">
                    <input id="inputQuoteShares" class="input" />
                </div>
                <div class="horizontal">
                    <input id="inputQuoteDate" class="input datepicker" />
                </div>
                <div class="horizontal long">
                    <input id="inputQuotePrice" class="input" />$
                </div>
                <div class="horizontal">
                    <input id="inputQuoteCommission" class="input" value="4.95" />
                </div>
                <div class="horizontal">
                    <select id="selectQuoteCurrency" class="input short" name="currencySelect">
                        <option value="USD">USD</option>
                        <option value="USD">CAD</option>
                    </select>
                </div>
                <a href="#" id="btnAdd" class="horizontal button addTransactionButton">Add </a>
            </div>
        </div>
    </div>
</asp:Content>
