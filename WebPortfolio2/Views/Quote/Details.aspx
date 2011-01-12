<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/Mine/Dividend.js" type="text/javascript"></script>
    <div class="separate">
        <ul class="tabs separate">
            <li><a href="#divDividends">Dividends</a></li>
            <li><a href="#divTransactions">Transactions</a></li>
        </ul>
        <div class="tab_container" style="margin-top: 5px;">
            <div id="divDividends" class="tab_content">
                <table id="TableDividend" class="tablesorter" style="width: 1000px;">
                    <thead>
                        <tr>
                            <th>
                                Date
                            </th>
                            <th>
                                Type
                            </th>
                            <th>
                                Amount
                            </th>
                            <th>
                                Tax
                            </th>
                            <th>
                                Value
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
                </div>
                <div id="divAddDividend" class="addTransaction">
                    <div id="divAddDividendButton" class="showAddTransactionMenu smallFont">
                        <a class="linkAddHolding" href="#">Add new Dividend</a>
                    </div>
                    <div id="divAddDividendMenu" class="addTransactionMenu">
                        <div style="float: left; padding: 4px;" class="smallFont">
                            <div class="horizontal">
                                Transaction Type</div>
                            <div class="horizontal">
                                Transaction Date</div>
                            <div class="horizontal">
                                Amount</div>
                            <div class="horizontal">
                                Tax</div>
                            <div class="horizontal">
                                Currency</div>
                            <div class="horizontal veryLong">
                                Note</div>
                        </div>
                        <div class="addTransactionInput">
                            <div class="horizontal">
                                <select id="selectDividendType" class="input" name="currencySelect">
                                    <option value="DIVIDEND">Dividend</option>
                                    <option value="ADJUSTMENT">Adjustment</option>
                                </select>
                            </div>
                            <div class="horizontal">
                                <input id="inputDividendDate" class="input datepicker" />
                            </div>
                            <div class="horizontal">
                                <input id="inputDividendAmount" class="input" />
                            </div>
                            <div class="horizontal">
                                <input id="inputDividendTax" class="input" />
                            </div>
                            <div class="horizontal">
                                <select id="selectDividendCurrency" class="input short" name="currencySelect">
                                    <option value="U">USD</option>
                                    <option value="C">CAD</option>
                                </select>
                            </div>
                            <div class="horizontal veryLong">
                                <input maxlength="128" id="inputDividendNote" class="input veryLong" />
                            </div>
                            <a href="#" class="horizontal button addTransactionButton">Add </a>
                        </div>
                    </div>
                </div>
            </div>
            <div id="divTransactions" class="tab_content">
                <table id="TableTransactions" class="tablesorter" style="width: 1000px;">
                    <thead>
                        <tr>
                            <th>
                                Transaction Type
                            </th>
                            <th>
                                Transaction Date
                            </th>
                            <th>
                                Price
                            </th>
                            <th>
                                Shares
                            </th>
                            <th>
                                Commission
                            </th>
                            <th>
                                Currency
                            </th>
                            <th>
                                Transaction Value
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
                <div id="divAddTransaction" class="addTransaction">
                    <div id="divshowAddTransactionMenu" class="showAddTransactionMenu smallFont">
                        <a class="linkAddHolding" href="#">Add new Transaction</a>
                    </div>
                    <div id="divAddHoldingMenu" class="addTransactionMenu">
                        <div style="float: left; padding: 4px;" class="smallFont">
                            <div class="horizontal">
                                Transaction Type</div>
                            <div class="horizontal">
                                Purchase Date</div>
                            <div class="horizontal">
                                Purchase Price</div>
                            <div class="horizontal">
                                Shares</div>
                            <div class="horizontal">
                                Commission</div>
                            <div class="horizontal">
                                Currency</div>
                        </div>
                        <div class="addTransactionInput">
                            <div class="horizontal">
                                <select id="selectTransactionType" class="input short">
                                    <option value="BUY">Buy</option>
                                    <option value="SELL">Sell</option>
                                </select>
                            </div>
                            <div class="horizontal">
                                <input id="inputTransactionDate" class="input datepicker" />
                            </div>
                            <div class="horizontal">
                                <input id="inputTransactionPrice" class="input" />
                            </div>
                            <div class="horizontal">
                                <input id="inputTransactionShares" class="input" />
                            </div>
                            <div class="horizontal">
                                <input id="inputTransactionCommission" class="input" value="4.95" />
                            </div>
                            <div class="horizontal">
                                <select id="selectTransactionCurrency" class="input short">
                                    <option value="U">USD</option>
                                    <option value="C">CAD</option>
                                </select>
                            </div>
                            <a href="#" class="horizontal button addTransactionButton">Add </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
