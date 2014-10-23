<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="FrontDesk.aspx.cs" Inherits="Staff_FrontDesk" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
 <div class="row col-md-12">
     <h1> Manage Front Desk</h1>
     <div class ="well"><h5>Mock Date/ Time</h5> 


           Last Billed Date/Time:
     <asp:Repeater ID="AdhocBillDateRepeater" runat="server"
         ItemType="System.DateTime" DataSourceID="BillDateTimeObjectDataSource">
         <ItemTemplate>
             <%# Item.ToShortDateString() %>
             &ndash;
            <%# Item.ToShortTimeString()%>
         </ItemTemplate>
     </asp:Repeater>
     <asp:ObjectDataSource runat="server" ID="BillDateTimeObjectDataSource" OldValuesParameterFormatString="original_{0}" SelectMethod="GetLastBillDateTime" TypeName="eRestaurant.BLL.AdhocController"></asp:ObjectDataSource>
     <asp:TextBox ID="SearchDate" runat="server" TextMode="Date" Text="2014-10-16" />
      <asp:TextBox ID="SearchTime" runat="server" TextMode="Time" Text="13:00" CssClass="clockpicker"/>
         <script src="../Scripts/clockpicker.js"></script>
        <script> 
            $('.clockpicker').clockpicker({ donetext: 'Accept' });
        </script>
         <link itemprop="url" href="../Content/standalone.css" rel="stylesheet" />
         <link   itemprop="url" href="../Content/clockpicker.css" rel="stylesheet" />
         <!-- Additional scripts styles for time-->
     <asp:LinkButton ID="MockDateTime" runat="server" CssClass="btn btn-primary">Post Back New Date/Time </asp:LinkButton>
     <asp:LinkButton ID ="MockLastBillingDateTime" runat="server" CssClass ="btn btn-default" OnClick="MockLastBillingDateTime_Click">Set to last-Billed date/Time</asp:LinkButton>
 </div>
 </div>
    <uc1:MessageUserControl runat="server" id="MessageUserControl" />

</asp:Content>

