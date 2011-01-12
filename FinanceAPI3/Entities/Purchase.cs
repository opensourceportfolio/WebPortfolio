using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FinanceAPI3
{
    public class Purchase : IPortfolio
    {
        public virtual int purchaseHistoryID { get; set; }
        public virtual int portfolioID { get; set; }
        public virtual string symbol { get; set; }
        public virtual double shares { get; set; }
        public virtual System.DateTime transactionDate { get; set; }
        public virtual double price { get; set; }
        public virtual string type { get; set; }
        public virtual double commission { get; set; }
        public virtual string currency { get; set; }
        public virtual double transactionValue { get; set; }
    }
}
