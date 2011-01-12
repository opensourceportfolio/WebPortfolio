using System.Collections.Generic;

namespace FinanceAPI3
{
    public class Quote
    {
        private List<Dividend> Dividends { get; set; }
        public string Name { get; set; }
        public string Symbol { get; set; }
        public double Ask { get; set; }
        public double Change_Today { get; set; }
        public double Price_to_Earnings { get; set; }
        public double Yield { get; set; }
        public double Change_From_High { get; set; }
        public double EPS { get; set; }
        public double Payout_Ratio { get; set; }
        public double Price_to_Book { get; set; }
        public string Industry { get; set; }
        public double Expected_Growth_Rate { get; set; }
        public List<Purchase> purchases { get; set; }
        public double shares { get; set; }
        public double totalCost { get; set; }
        public double marketValue { get; set; }
    }
}
