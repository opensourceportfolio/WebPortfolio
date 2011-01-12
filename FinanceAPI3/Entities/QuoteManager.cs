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

        #region getQuotesTable

        //public DataTable getQuotesTable(bool showAll)
        //{
        //    //SortableBindingList<BindableQuote> allSources = getQuotesDataSource(showAll);
        //    //return ConvertTo(allSources);
        //}

        private static DataTable CreateTable(Type entityType)
        {
            DataTable table = new DataTable(entityType.Name);
            PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(entityType);

            foreach (PropertyDescriptor prop in properties)
            {
                table.Columns.Add(prop.Name, prop.PropertyType);
            }

            return table;
        }

        private static DataTable ConvertTo(IList list)
        {
            DataTable table = null;
            Type entityType;

            if (list.Count > 0)
            {
                entityType = list[0].GetType();
                table = CreateTable(entityType);
                PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(entityType);

                foreach (Object item in list)
                {
                    DataRow row = table.NewRow();

                    foreach (PropertyDescriptor prop in properties)
                    {
                        row[prop.Name] = prop.GetValue(item);
                    }

                    table.Rows.Add(row);
                }
            }
            return table;
        }
        #endregion

        //public void refresh(BindableQuote bindableQuote)
        //{            
        //    bindableQuote.refreshAll();
        //    changed = true;                     
        //}

        //public void refreshAll(List<BindableQuote> bindableQuotes)
        //{
        //    foreach (BindableQuote source in bindableQuotes)
        //    {
        //        source.refreshAll();
        //    }
        //}

        //public void refreshAllAsync(List<BindableQuote> bindableQuotes)
        //{
        //    bindableQuotes.AsParallel()
        //        .WithDegreeOfParallelism(10)
        //        .ForAll((quote) =>
        //        {
        //            quote.refreshAll();
        //            if (refreshStarted != null) { refreshStarted(); }
        //        });
        //}

        //public double getOverallYield(double totalMarketValue)
        //{
        //    return quotes.Sum(q => q.Yield * q.marketValue / totalMarketValue).roundTo(2);
        //}

        //public double getPriceChange()
        //{
        //    double previousMarketValue = quotes.Sum(q => q.marketValue / (1 + (q.Change_Today / 100)));
        //    return quotes.Sum(q => q.Change_Today * (q.marketValue / (1 + (q.Change_Today / 100))) / previousMarketValue).roundTo(2);
        //}

        //public double getMarketValue()
        //{
        //    return quotes.Sum(q => q.marketValue).roundTo(2);
        //}

        public double getTotalCost(int portfolioID)
        {
            return dataLayer.getTotalCost(portfolioID, exchangeRate.getExchangeRate, defaultCurrency);            
        }

        #region database calls

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
       
        #endregion

        //private SortableBindingList<BindableQuote> reloadQuotesData(DataTable allHoldings, int portfolioID)
        //{
        //    string quoteInfos;
        //    string[] datas;
        //    List<string> symbols = new List<string>();
        //    string symbol;
        //    BindableQuote quote;
        //    SortableBindingList<BindableQuote> quotes = null;

        //    foreach (DataRow holding in allHoldings.Rows)
        //    {
        //        symbol = holding["Symbol"].ToString();
        //        symbols.Add(symbol);
        //    }

        //    quoteInfos = dataLoader.getQuotesInfo(symbols);

        //    if (quoteInfos != null)
        //    {
        //        quotes = new SortableBindingList<BindableQuote>();

        //        datas = quoteInfos.splitToRows();
        //        for (int i = 0; i < allHoldings.Rows.Count; i++)
        //        {
        //            quote = new BindableQuote(allHoldings.Rows[i], datas[i], exchangeRate, defaultCurrency, dataLayer);
        //            quotes.Add(quote);
        //            quote.annualReturn = dataLayer.getAnnualGrowthRate(portfolioID, quote.Symbol, quote.Ask);
        //        }
        //    }

        //    return quotes;
        //}

        //private SortableBindingList<BindableQuote> reloadQuotesDataOffline(DataTable allHoldings, int portfolioID)
        //{
        //    BindableQuote quote;
        //    SortableBindingList<BindableQuote> quotes = null;

        //    quotes = new SortableBindingList<BindableQuote>();

        //    for (int i = 0; i < allHoldings.Rows.Count; i++)
        //    {
        //        quote = new BindableQuote(allHoldings.Rows[i], exchangeRate, defaultCurrency, dataLayer);
        //        quotes.Add(quote);
        //        quote.annualReturn = 0; //dataLayer.getAnnualGrowthRate(portfolioID, quote.Symbol, quote.Ask);
        //    }

        //    return quotes;
        //}

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

