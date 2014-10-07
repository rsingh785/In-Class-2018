<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Reservations.aspx.cs" Inherits="Reservations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<div class=" row col-md-12">
<h1> Reservations</h1>
    <p> 
        <asp:Label ID="Label1" runat="server" Text="Special Event"></asp:Label>
        <asp:DropDownList ID="SpecialEventDropDownList" runat="server" DataSourceID="ObjectDataSourceSpecialEvent" DataTextField="Description" DataValueField="EventCode" AppendDataBoundItems="True">
            <asp:ListItem Value="none">[Select an Event]</asp:ListItem>
            <asp:ListItem Value="">[No Event]</asp:ListItem>
        </asp:DropDownList>
        <asp:LinkButton ID="ViewReservations" runat="server">View Reservations</asp:LinkButton>
        <asp:ObjectDataSource ID="ObjectDataSourceSpecialEvent" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="ListAllSpecialEvents" TypeName="eRestaurant.BLL.RestaurantAdminController"></asp:ObjectDataSource>
    </p>
    <p> 
        &nbsp;</p>
    <p> 
        &nbsp;</p>
    <p> 
        <asp:GridView ID="ReservationsGridView" runat="server" AutoGenerateColumns="False" DataSourceID="ReservationsObjectDataSource" Height="264px" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" />
                <asp:BoundField DataField="ReservationDate" HeaderText="ReservationDate" SortExpression="ReservationDate" />
                <asp:BoundField DataField="ReservationID" HeaderText="ReservationID" SortExpression="ReservationID" />
                <asp:BoundField DataField="NumberInParty" HeaderText="NumberInParty" SortExpression="NumberInParty" />
                <asp:BoundField DataField="ContactPhone" HeaderText="ContactPhone" SortExpression="ContactPhone" />
                <asp:BoundField DataField="ReservationStatus" HeaderText="ReservationStatus" SortExpression="ReservationStatus" />
                <asp:BoundField DataField="EventCode" HeaderText="EventCode" SortExpression="EventCode" />
            </Columns>
            <EmptyDataTemplate>
                No Data to display.
            </EmptyDataTemplate>
        </asp:GridView>
        <asp:ObjectDataSource ID="ReservationsObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupReservationsBySpecialEvent" TypeName="eRestaurant.BLL.RestaurantAdminController">
            <SelectParameters>
                <asp:ControlParameter ControlID="SpecialEventDropDownList" Name="eventCode" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </p>
</div>
   
</asp:Content>

