using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FinanceAPI3
{
    public class Dividend : IPortfolio
    {
        public virtual int cashHistoryID { get; set; }
        public virtual int portfolioID { get; set; }
        public virtual string symbol { get; set; }
        public virtual string type { get; set; }
        public virtual DateTime dividendDate { get; set; }
        public virtual double amount { get; set; }
        public virtual double tax { get; set; }
        public virtual string currency { get; set; }
        public virtual string note { get; set; }
    }
}