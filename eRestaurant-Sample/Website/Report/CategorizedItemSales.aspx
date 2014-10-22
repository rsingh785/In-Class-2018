<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CategorizedItemSales.aspx.cs" Inherits="Report_CategorizedItemSales" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ObjectDataSource ID="CategorizedSalesDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="TotalCategorizedItemSales" TypeName="eRestaurant.BLL.ReportsController"></asp:ObjectDataSource>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%">
        <LocalReport ReportPath="Report\CategorizedItemSales.rdlc">
            <DataSources>
                <rsweb:ReportDataSource Name="ItemSalesDataSet" DataSourceId="CategorizedSalesDataSource"></rsweb:ReportDataSource>
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
</asp:Content>

