<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Reservations.aspx.cs" Inherits="Reservations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<div class=" row col-md-12">
<h1> Reservations</h1>
    <p> 
        <asp:Label ID="Label1" runat="server" Text="Special Event"></asp:Label>
        <asp:DropDownList ID="SpecialEventDropDownList" runat="server" DataSourceID="ObjectDataSourceSpecialEvent" DataTextField="Description" DataValueField="EventCode">
        </asp:DropDownList>
        <asp:LinkButton ID="ViewReservations" runat="server">View Reservations</asp:LinkButton>
        <asp:ObjectDataSource ID="ObjectDataSourceSpecialEvent" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="ListAllReservations" TypeName="eRestaurant.BLL.ReservationController"></asp:ObjectDataSource>
        <asp:GridView ID="ReservationsGridView" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSourceSpecialEvent">
            <Columns>
                <asp:BoundField DataField="EventCode" HeaderText="EventCode" SortExpression="EventCode" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ReservationsObjectDataSource" runat="server"></asp:ObjectDataSource>
    </p>
</div>
   
</asp:Content>

