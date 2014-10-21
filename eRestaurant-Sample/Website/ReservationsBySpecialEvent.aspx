<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ReservationsBySpecialEvent.aspx.cs" Inherits="ReservationsBySpecialEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class=" row col-md-12">
        <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ReservationsBySpecialEvents</h1>
        SpecialEvent<asp:DropDownList ID="SpecialDropDownList" runat="server" DataSourceID="ObjectDataSource1" DataTextField="DropDownList" DataValueField="Reservations" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>No Event</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" Text="View Reservations" />
        <br />
        <br />
      
        <p> 
           <asp:ObjectDataSource ID="SpecialEventDropDown" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="ListAllReservations" TypeName="eRestaurant.BLL.ReservationController" OnSelecting="ObjectDataSource1_Selecting"></asp:ObjectDataSource>
        </p>
        <p> 
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="ObjectDataSource2" Height="295px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="193px">
                <Columns>
                    <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" />
                    <asp:BoundField DataField="ReservationDate" HeaderText="ReservationDate" SortExpression="ReservationDate" />
                    <asp:BoundField DataField="ReservationID" HeaderText="ReservationID" SortExpression="ReservationID" />
                    <asp:BoundField DataField="NumberInParty" HeaderText="NumberInParty" SortExpression="NumberInParty" />
                    <asp:BoundField DataField="ContactPhone" HeaderText="ContactPhone" SortExpression="ContactPhone" />
                    <asp:BoundField DataField="ReservationStatus" HeaderText="ReservationStatus" SortExpression="ReservationStatus" />
                    <asp:BoundField DataField="EventCode" HeaderText="EventCode" SortExpression="EventCode" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="ListReservationsByEventCode" TypeName="eRestaurant.BLL.ReservationController">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="EventCode" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </p>
</div>
</asp:Content>

