using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Assimilate.Data;

public partial class My_Account_Analyze : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btn_ShowData_Click(object sender, EventArgs e)
    {
        lbl_Error.Text = string.Empty;
        pnl_Charts.Visible = false;
        try
        {
            using (AssimilateEntities context = new AssimilateEntities())
            {
                int year = Convert.ToInt32(ddl_Year.SelectedValue);
                List<BookSale> bookSales = context.BookSales.Where(b => b.MonthOfSale == ddl_Month.SelectedValue && b.YearOfSale == year).ToList();
                if (bookSales.Count > 0)
                {
                    grid_BookSales.DataSource = bookSales;
                    grid_BookSales.DataBind();
                }
                else
                {
                    lbl_Error.Text = "No data available for this month and year";
                    grid_BookSales.DataSource = null;
                    grid_BookSales.DataBind();
                }

            }
        }
        catch (Exception ex)
        {
            lbl_Error.Text = ex.Message;
            grid_BookSales.DataSource = null;
            grid_BookSales.DataBind();
        }
    }
    protected void btn_Analyze_Click(object sender, EventArgs e)
    {
        SetSellerChartParameters();
        pnl_Charts.Visible = true;
    }

    private void SetSellerChartParameters()
    {
        using (AssimilateEntities context = new AssimilateEntities())
        {
            int year = Convert.ToInt32(ddl_Year.SelectedValue);
            List<BookSale> bookSales = context.BookSales.Where(b => b.MonthOfSale == ddl_Month.SelectedValue && b.YearOfSale == year).ToList();
            if (bookSales.Count > 0)
            {
                List<BookSalePieChart> objbook = new List<BookSalePieChart>();
                int totalSum = 0;
                foreach (BookSale book in bookSales)
                {
                    totalSum +=Convert.ToInt32( book.UnitsSold);
                
                }
                               
                foreach (BookSale book in bookSales)
                {

                    objbook.Add(new BookSalePieChart(Math.Round((Convert.ToDouble( book.UnitsSold) / totalSum)*100,0).ToString(), book.Seller));
                
                }
                RadHtmlChart1.DataSource = objbook;
                RadHtmlChart1.DataBind();

                var barhcartList = bookSales.GroupBy(g => g.Author).Select(s => new { authorname = s.Key, totalunitSold = s.Sum(u => u.UnitsSold) }).ToList();
                RadHtmlChart2.DataSource = barhcartList;
                RadHtmlChart2.DataBind();
            }
          
        
        }
    }

}