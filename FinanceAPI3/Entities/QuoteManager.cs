using System.Collections.Generic;
using System.Data;
using System.Linq;
using System;
using System.Collections;
using System.ComponentModel;

namespace FinanceAPI3
{
    public class QuoteManager
    {

        public event quotesChangedEvent quotesChanged;
        public delegate void quotesChangedEvent();

        private List<Quote> quotes;
        private DataLayer dataLayer;
        private ExchangeRate exchangeRate;
        public string defaultCurrency { get; set; }
        public bool changed = false;
        public const string American = "U";
        public const string Canadian = "C";

        public QuoteManager()
        {
            dataLayer = new DataLayer();
            defaultCurrency = American;
            exchangeRate = new ExchangeRate();
        }

        public List<Quote> getQuotesDataSource(bool showAll)
        {
            List<Quote> list;
            if (showAll)
            {
                return quotes;
            }
            else
            {
                list = new List<Quote>();
                list.AddRange(quotes.Where(q => q.shares > 0 || q.Symbol == "CASH").ToList());
                return list;
            }
        }

        public double getTotalCost(int portfolioID)
        {
            return dataLayer.getTotalCost(portfolioID, exchangeRate.getExchangeRate, defaultCurrency);            
        }
        
        public List<Portfolio> getPortfolios()
        {
            return dataLayer.getPortfolios();
        }

        public List<Purchase> getAllPurchases(int portfolioID)
        {
            return dataLayer.getAllPurchases(portfolioID);
        }

        public List<Purchase> getPurchaseHistory(int portfolioID, string symbol)
        {
            return dataLayer.getPurchaseHistroy(portfolioID, symbol);
        }

        public List<Dividend> getDividendHistory(int portfolioID, string symbol)
        {
            return dataLayer.getDividendHistroy(portfolioID, symbol);
        }

        public void saveQuotes(string portfolioID, string symbol, string purchaseType, string shares,
                               string date, string price, string commission, string currency)
        {
            dataLayer.saveQuote(portfolioID, symbol, "", "", 
                                    purchaseType, shares, date, price, commission, currency);
        }

        public void savePurchase(string portfolioID, string symbol, string shares,
                                         string purchaseDate, string purchasePrice, string transactionType,
                                         string commission, string currency)
        {
            dataLayer.saveQuote(portfolioID, symbol, "", "0", transactionType, shares, purchaseDate, 
                                purchasePrice, commission, currency);
        }

        public void saveTransaction(string portfolioID, string symbol, string transactionType,
                         string transactionDate, string amountOut, string amountIn, string tax, 
                         string currency, string note)
        {
            dataLayer.saveTransaction(portfolioID, symbol, transactionType, transactionDate, 
                                        amountOut, amountIn, tax, currency, note);
        }
       
        public void loadQuotes(int portfolioID = 0)
        {
            quotes = dataLayer.getAllHoldings(portfolioID, exchangeRate.getExchangeRate, defaultCurrency);
        }

        #region Desktop functions

        public void importQuotesFromFile(string path)
        {
            foreach (string symbol in System.IO.File.ReadAllLines(path))
            {
                add(symbol);
            }
        }

        public void add(string symbol)
        {
            bool contains = false;

            foreach (Quote quote in quotes)
            {
                if (quote.Symbol.ToLower() == symbol.ToLower())
                    contains = true;
            }

            if (!contains)
            {
                quotes.Add(new Quote());

                if (quotesChanged != null)
                {
                    quotesChanged();
                }

                changed = true;
            }
        }

        public void remove(Quote quote)
        {

            quotes.Remove(quote);

            if (quotesChanged != null)
            {
                quotesChanged();
            }
            changed = true;
        }

        public void saveQuotes()
        {
            //dataLayer.saveQuotesToXML(quotes);
        }

        #endregion
    }
}

