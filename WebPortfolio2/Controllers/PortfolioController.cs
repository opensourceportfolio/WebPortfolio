using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Web.Script.Serialization;
using FinanceAPI3;

namespace WebPortfolio2.Controllers
{
    public class PortfolioController : Controller
    {
        QuoteManager _quoteManager;

        private QuoteManager quoteManager
        {
            get
            {
                if (Session["quoteManager"] == null)
                {
                    _quoteManager = new QuoteManager();
                    Session["quoteManager"] = _quoteManager;
                }
                return (QuoteManager)Session["quoteManager"];
            }
        }

        private int portfolioID
        {
            get
            {
                if (Session["PortfolioID"] == null)
                {
                    Session["PortfolioID"] = 1;
                }
                return int.Parse(Session["PortfolioID"].ToString());
            }
            set
            {
                Session["PortfolioID"] = value;
            }
        }

        public PortfolioController(){
        }

        public ActionResult Main(int id = 1)
        {
            portfolioID = id;
            return View();
        }

        public JsonResult getPortfolios()
        {
            var portfolios = quoteManager.getPortfolios();
            return Json(portfolios, JsonRequestBehavior.AllowGet);
        }

        public JsonResult getPortfolioData(Boolean showAll = false, int? portfolioID = null)
        {
            if (portfolioID != null) { this.portfolioID = portfolioID.Value; }
            quoteManager.loadQuotes(this.portfolioID);
            List<Quote> quotes = quoteManager.getQuotesDataSource(showAll).ToList();
            var totalCost = quoteManager.getTotalCost(this.portfolioID).ToString();

            return Json(new
            {
                portfolioID = this.portfolioID,
                Quotes = quotes,
                portfolioName = quoteManager.getPortfolios()[this.portfolioID - 1].portfolioName,
                totalCost = totalCost
            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult addNewHolding(string symbol, string shares, string purchaseDate, 
            string price, string commission, string currency)
        {
            quoteManager.saveQuotes(portfolioID.ToString(), symbol, "BUY", shares, 
                    purchaseDate, price, commission, currency);

            return getPortfolioData();
        }
    }
}
