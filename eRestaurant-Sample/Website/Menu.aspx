<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <br />
    </p>
    <p>
        <asp:Label ID="Label1" runat="server" Text="Menu Items:"></asp:Label>
&nbsp;<asp:DropDownList ID="MenuDropDown" runat="server" AppendDataBoundItems="True" DataSourceID="MenuDataSource" DataTextField="Category" DataValueField="Description">
        </asp:DropDownList>
&nbsp;
        <asp:HyperLink ID="HyperLink1" runat="server">View Menu Items</asp:HyperLink>
    </p>
    <p>
        <asp:ObjectDataSource ID="MenuDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="ListMenuItems" TypeName="eRestaurant.BLL.MenuController"></asp:ObjectDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:ObjectDataSource ID="GridDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupMenuItemByCategory" TypeName="eRestaurant.BLL.RestaurantAdminController">
            <SelectParameters>
                <asp:ControlParameter ControlID="MenuDropDown" Name="ItemId" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="GridDataSource">
            <Columns>
                <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="CurrentPrice" HeaderText="CurrentPrice" SortExpression="CurrentPrice" />
                <asp:BoundField DataField="CurrentCost" HeaderText="CurrentCost" SortExpression="CurrentCost" />
                <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
                <asp:BoundField DataField="Calories" HeaderText="Calories" SortExpression="Calories" />
                <asp:BoundField DataField="Comment" HeaderText="Comment" SortExpression="Comment" />
                <asp:BoundField DataField="MenuCategoryID" HeaderText="MenuCategoryID" SortExpression="MenuCategoryID" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>

