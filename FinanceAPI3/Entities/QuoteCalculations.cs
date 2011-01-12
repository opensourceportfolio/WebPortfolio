using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Diagnostics;

namespace FinanceAPI3
{
    public class QuoteCalculations
    {
        public static double getAdjustedExponentialGrowthRate(List<double> x, List<double> y)
        {
            var firstRegression = new RegressionEquation(x, y);
            RegressionEquation secondGrowthRate = null;
            RegressionEquation thirdGrowthRate = null;
            int worstCaseIndex = 0;
            //get furthest away point
            firstRegression.calculateExponentialRegressionLine();
            worstCaseIndex = indexOutlier(x, y, firstRegression);
            //remove it
            x.RemoveAt(worstCaseIndex);
            y.RemoveAt(worstCaseIndex);
            //get second furthest away point
            secondGrowthRate = new RegressionEquation(x, y);
            secondGrowthRate.calculateExponentialRegressionLine();
            worstCaseIndex = indexOutlier(x, y, secondGrowthRate);
            //remove it
            x.RemoveAt(worstCaseIndex);
            y.RemoveAt(worstCaseIndex);
            thirdGrowthRate = new RegressionEquation(x, y);
            thirdGrowthRate.calculateExponentialRegressionLine();
            //take the average
            return ((firstRegression.growth + secondGrowthRate.growth + thirdGrowthRate.growth - 3) * 100) / 3;
        }

        private static int indexOutlier(List<double> x, List<double> y, RegressionEquation regression)
        {
            double worstCase = 0;
            int worstCaseIndex = 0;
            double difference = 0;

            for (int i = 0; i <= x.Count - 1; i++)
            {
                difference = System.Math.Abs(y[i] - regression.intercept * System.Math.Pow(regression.growth, x[i]));
                if (difference > worstCase)
                {
                    worstCase = difference;
                    worstCaseIndex = i;
                }
            }
            return worstCaseIndex;
        }

        private class RegressionEquation
        {
            public double growth { get; set; }
            public double intercept { get; set; }

            private List<double> _x;

            private List<double> _y;
            public RegressionEquation(List<double> x, List<double> y)
            {
                var minimum = y.Min() - 1;
                List<double> yTemp = new List<double>();

                this._x = x;

                if (minimum < 0)
                {
                    for (int i = 0; i <= y.Count - 1; i++)
                    {
                        yTemp.Add(y[i] - minimum);
                    }
                }
                else
                {
                    yTemp = y;
                }
                this._y = yTemp;
            }

            public void calculateRegressionLine()
            {
                setRegressionEquation(_x, _y);
            }

            public void calculateExponentialRegressionLine()
            {
                List<double> yTemp = new List<double>();

                foreach (double yPoint in _y)
                {
                    yTemp.Add(System.Math.Log10(yPoint));
                }
                setRegressionEquation(_x, yTemp);
                growth = System.Math.Pow(10, growth);
                intercept = System.Math.Pow(10, intercept);
            }


            public void setRegressionEquation(List<double> x, List<double> y)
            {
                var n = x.Count;
                double sumOfXY = 0;

                for (int i = 0; i <= x.Count - 1; i++)
                {
                    sumOfXY += x[i] * y[i];
                }

                growth = (n * sumOfXY - x.Sum() * y.Sum()) / (n * x.Sum(e => System.Math.Pow(e, 2)) - System.Math.Pow(x.Sum(), 2));

                intercept = (y.Sum() - growth * x.Sum()) / x.Count;
            }
        }
    }
}
