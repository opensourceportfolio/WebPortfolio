using System.Data;
using MySql.Data.MySqlClient;
using System.Xml;
using System.IO;
using System.Collections.Generic;
using System.Data.Common;
using FinanceAPI3;
using System.Linq;
using System.Configuration;

namespace FinanceAPI3
{
    public class DataLayer
    {        
        string connectionString = "";
        DbConnection connection;
        DbDataAdapter adapter;
        DbCommand command;
        DataContext dataContext;

        public DataLayer(string dbType = "mySQL")
        {
            if (dbType == "mySQL")
            {
                connectionString = ConfigurationManager.ConnectionStrings["MySQLConnection"].ConnectionString;
                connection = new MySqlConnection(connectionString);
                adapter = new MySqlDataAdapter();
            }
            else
            {
                connectionString = ConfigurationManager.ConnectionStrings["MySQLConnection"].ConnectionString;
                connection = new System.Data.SqlClient.SqlConnection(connectionString);
                adapter = new System.Data.SqlClient.SqlDataAdapter();
            }
            dataContext = new DataContext(1);
        }

        #region Query database

        public double getTotalCost(int portfolioID, double exchangeRate, string resultCurrency)
        {            
            return dataContext.getTotalCost(portfolioID, exchangeRate, resultCurrency);
        }

        public List<Purchase> getAllPurchases(int portfolioID)
        {
            return dataContext.getAllPurchases(portfolioID);
        }

        public List<Purchase> getPurchaseHistroy(int portfolioID, string symbol)
        {
            return dataContext.getPurchaseHistroy(portfolioID, symbol);
        }

        public List<Dividend> getDividendHistroy(int portfolioID, string symbol)
        {
            string commandText = "call webportfolio.viewTransactionHistory(" + portfolioID + ",'" + symbol + "')";
            var results = executeStatement(commandText);
            List<Dividend> dividends = new List<Dividend>();

            foreach (DataRow row in results.Rows)
            {
                dividends.Add(new Dividend()
                {
                    dividendDate = System.DateTime.Parse(row["date"].ToString()),
                    amount = double.Parse(row["Amount"].ToString()),
                    tax = double.Parse(row["Tax"].ToString()),
                    type = row["type"].ToString(),
                    currency = row["currency"].ToString(),
                    note = row["note"].ToString()
                });
            }
            return dividends;
        }

        public List<Quote> getAllHoldings(int portfolioID, double exchangeRate, string resultingCurrency)
        {            
            return dataContext.getHoldings(portfolioID, exchangeRate, resultingCurrency);
        }

        public List<Portfolio> getPortfolios()
        {
            return dataContext.getPortfolios();
        }                      

        #endregion

        #region Update database

        public DbParameter newParameter(string parameterName, string parameterValue)
        {
            DbParameter parameter = command.CreateParameter();
            parameter.ParameterName = parameterName;
            parameter.Value = parameterValue;
            return parameter;
        }

        public void saveQuote(string portfolioID, string symbol, string industry,
                              string growthRate, string purchaseType, string shares,
                              string purchaseDate, string purchasePrice, string commission, 
                              string currency)
        {
            List<DbParameter> parameters = new List<DbParameter>();
            parameters.Add(newParameter("PortfolioID", portfolioID));
            parameters.Add(newParameter("symbol", symbol));
            parameters.Add(newParameter("industry", industry));
            parameters.Add(newParameter("growthRate", growthRate));
            parameters.Add(newParameter("purchaseType", purchaseType));
            parameters.Add(newParameter("shares", shares));
            parameters.Add(newParameter("purchaseDate", purchaseDate));
            parameters.Add(newParameter("purchasePrice", purchasePrice));
            parameters.Add(newParameter("commission", commission));
            parameters.Add(newParameter("currency", currency));
            parameters.Add(newParameter("note", ""));
            callStoredProcedure("routineInsertHolding", parameters);
        }

        public void saveTransaction(string portfolioID, string symbol, string transactionType,
                         string transactionDate, string amountOut, string amountIn, string tax, 
                         string currency, string note)
        {
            List<DbParameter> parameters = new List<DbParameter>();
            parameters.Add(newParameter("PortfolioID", portfolioID));
            parameters.Add(newParameter("transactionType", transactionType));
            parameters.Add(newParameter("transactionDate", transactionDate));
            parameters.Add(newParameter("amountOut", amountOut));
            parameters.Add(newParameter("amountIn", amountIn));
            parameters.Add(newParameter("commission", "0"));
            parameters.Add(newParameter("tax", tax));
            parameters.Add(newParameter("currency", currency));
            parameters.Add(newParameter("sourceSymbol", symbol));
            parameters.Add(newParameter("note", note));
            callStoredProcedure("routineModifyCash", parameters);
        }
        #endregion

        private DataTable callStoredProcedure(string name, List<DbParameter> parameters)
        {
            DataTable results ;
            command = connection.CreateCommand();
            command.CommandText = name;
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddRange(parameters.ToArray());
            command.Connection = connection;
            if (connection.State != ConnectionState.Open) { connection.Open(); }
            results = new DataTable();
            results.Load(command.ExecuteReader());
            return results;
        }

        private DataTable executeStatement(string statement)
        {
            DataTable allHoldings = new DataTable();
           
            command = connection.CreateCommand();
            command.CommandText = statement;
            command.Connection = connection;
            adapter.SelectCommand = command;
            adapter.Fill(allHoldings);

            return allHoldings;
        }
    }

}
