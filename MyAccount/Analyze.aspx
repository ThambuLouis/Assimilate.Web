<%@ Page Title="Analyze - Assimilate App" Language="C#" MasterPageFile="~/MasterPages/Site.master" AutoEventWireup="true" CodeFile="Analyze.aspx.cs" Inherits="My_Account_Analyze" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
                    </telerik:RadScriptManager>
    <asp:Label ID="lbl_Error" runat="server" ForeColor="Red"></asp:Label><br />
    <table>
        <tr>
            <td>Month</td>
            <td>
                <asp:DropDownList ID="ddl_Month" runat="server">
                    <asp:ListItem Text="January" Value="January"></asp:ListItem>
                    <asp:ListItem Text="February" Value="February"></asp:ListItem>
                    <asp:ListItem Text="March" Value="March"></asp:ListItem>
                    <asp:ListItem Text="April" Value="April"></asp:ListItem>
                    <asp:ListItem Text="May" Value="May"></asp:ListItem>
                    <asp:ListItem Text="June" Value="June"></asp:ListItem>
                    <asp:ListItem Text="July" Value="July"></asp:ListItem>
                    <asp:ListItem Text="August" Value="August"></asp:ListItem>
                    <asp:ListItem Text="September" Value="September"></asp:ListItem>
                    <asp:ListItem Text="October" Value="October"></asp:ListItem>
                    <asp:ListItem Text="November" Value="November"></asp:ListItem>
                    <asp:ListItem Text="December" Value="December"></asp:ListItem>
                </asp:DropDownList></td>
            <td>Year</td>
            <td>
                <asp:DropDownList ID="ddl_Year" runat="server">
                    <asp:ListItem Text="2012" Value="2012"></asp:ListItem>
                    <asp:ListItem Text="2013" Value="2013"></asp:ListItem>
                    <asp:ListItem Text="2014" Value="2014"></asp:ListItem>
                </asp:DropDownList></td>
            <td>
                <asp:Button ID="btn_ShowData" runat="server" Text="Show Data" OnClick="btn_ShowData_Click" /></td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="grid_BookSales" runat="server" DataKeyNames="BookSalesID" AutoGenerateColumns="true"></asp:GridView>
    <br />
    <asp:Button ID="btn_Analyze" runat="server" Text="Analyze the Data" OnClick="btn_Analyze_Click" /><br />
    <asp:Panel ID="pnl_Charts" runat="server" Visible="false">
        <table>
            <tr>
                <td>
                   <telerik:RadHtmlChart runat="server" ID="RadHtmlChart1" Height="400px" Width="400px" >
    <PlotArea>
        <Series>
            <telerik:PieSeries DataFieldY="UnitSold" NameField="Seller"  >
                <LabelsAppearance DataFormatString="{0}%"> 
                </LabelsAppearance>
                <TooltipsAppearance DataFormatString="{0}%"></TooltipsAppearance>
            </telerik:PieSeries>
        </Series>
        <YAxis>
        </YAxis>
    </PlotArea>
    <ChartTitle Text="Book sales by seller">
    </ChartTitle>
</telerik:RadHtmlChart>
      
                   
      
                   </td>
                <td>
                     <telerik:RadHtmlChart ID="RadHtmlChart2" runat="server"   Height="400px" Width="400px" >
                         <PlotArea>
                            
                            
                           <XAxis DataLabelsField="authorname">
                               
                               <TitleAppearance Text="Author Name" ></TitleAppearance>
                           </XAxis>
                             <YAxis >

                                 <TitleAppearance Position="Center" Text="Units Sold"></TitleAppearance>
                             </YAxis>
                                                       
                             <Series>

                                 <telerik:ColumnSeries  DataFieldY="totalunitSold" >
                                     

                                 </telerik:ColumnSeries>

                             </Series>
                         </PlotArea>
                         <ChartTitle Text="Book sales by Author">
    </ChartTitle>
                    </telerik:RadHtmlChart>
                   </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

