using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FinanceAPI3;

namespace WebPortfolio2.Controllers
{
    public class QuoteController : Controller
    {
        QuoteManager _quoteManager = null;
        int portfolioID;

        private string symbol
        {
            get
            {
                if (Session["Symbol"] == null)
                {
                    Session["Symbol"] = "";
                }
                return Session["Symbol"].ToString();
            }
            set
            {
                Session["Symbol"] = value;
            }
        }

        public ActionResult Details(string symbol)
        {
            this.symbol = symbol;
            return View();
        }

        public ActionResult CashDetails()
        {
            this.symbol = "CASH";
            return View();
        }

        public JsonResult getCashDetails()
        {
            List<Dividend> cashDetails;

            if (Session["quoteManager"] != null && Session["PortfolioID"] != null)
            {
                getSessionData();
                cashDetails = _quoteManager.getDividendHistory(portfolioID, symbol);
            }
            else
            {
                cashDetails = new List<Dividend>();
            }

            return Json(new
            {
                cashDetails = cashDetails,
                portfolioID = portfolioID
            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult getQuoteDividends()
        {
            List<Dividend> dividends;
            List<Purchase> transactions;

            if (Session["quoteManager"] != null && Session["PortfolioID"] != null)
            {
                getSessionData();
                dividends = _quoteManager.getDividendHistory(portfolioID, symbol);
                transactions = _quoteManager.getPurchaseHistory(portfolioID, symbol);
            }
            else
            {
                dividends = new List<Dividend>();
                transactions = new List<Purchase>();
            }

            return Json(new {
                dividends = dividends, 
                transactions = transactions,
                portfolioID = portfolioID
            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult addNewCash(string type, string cashDate,
            string amountOut, string amountIn, string currency, string note)
        {
            getSessionData();
            _quoteManager.saveTransaction(portfolioID.ToString(), symbol, type,
                cashDate, amountOut, amountIn, "0", currency, note);

            return getQuoteDividends();
        }

        public JsonResult addNewDividend(string type, string dividendDate, 
            string amount, string tax, string currency, string note)
        {
            getSessionData();
            _quoteManager.saveTransaction(portfolioID.ToString(), symbol, type, 
                dividendDate, amount, "0", tax, currency, note);

            return getQuoteDividends();
        }

        public JsonResult addNewTransaction(string shares, string purchaseDate, 
            string price, string type, string commission, string currency)
        {
            getSessionData();
            _quoteManager.savePurchase(portfolioID.ToString(), symbol, shares, 
                purchaseDate, price, type, commission, currency);

            return getQuoteDividends();
        }

        private void getSessionData()
        {
            portfolioID = int.Parse(Session["PortfolioID"].ToString());
            _quoteManager = Session["quoteManager"] as QuoteManager;
        }

    }
}
