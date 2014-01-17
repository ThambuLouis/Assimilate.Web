using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BookSalePieChart
/// </summary>
public class BookSalePieChart
{
    public BookSalePieChart(string unitsold, string seller)
	{
        _unitsold = unitsold;
        _seller = seller;
	}

    private string _unitsold;
    private string _seller;
    public string UnitSold
    {
        get { return _unitsold; }
        set { _unitsold = value; }
    
    }
    public string Seller
    {

        get { return _seller; }
        set { _seller = value; }
    
    }

    }