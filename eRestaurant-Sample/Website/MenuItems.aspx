<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MenuItems.aspx.cs" Inherits="MenuItems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="row col-md-12">
        <h1> Menu Items</h1>
    </div>
    <asp:Repeater ID="MenuItemRepeater" runat="server" DataSourceID="MenuItemDataSource">
     
           <ItemTemplate>
    <h3><img src='<%# "Images/" + Eval("Description") +"-1.png" %>' alt="" />
               
               <%# Eval("Description") %></h3>
               <div class="well">
               <asp:Repeater ID="ItemDetailRepeater" runat="server" DataSource='<%# Eval("MenuItems") %>'>
                   <ItemTemplate>
                       <div>
                           <h4>
                           <%# Eval ("Description") %>&mdash;
                           <span class="badge"><%# Eval ("Calories") %> Calories</span>
                           <%# ((decimal) Eval("Price")).ToString("C") %>
                           </h4>
                           <%# Eval ("Comment") %>
                       </div>
                   </ItemTemplate>
               </asp:Repeater>
                   </div>
</ItemTemplate>
     
        <SeparatorTemplate>
            <hr />
        </SeparatorTemplate>
    </asp:Repeater>
    <asp:ObjectDataSource runat="server" ID="MenuItemDataSource" OldValuesParameterFormatString="original_{0}" SelectMethod="ListCastegorizedMenuItems" TypeName="eRestaurant.BLL.MenuController"></asp:ObjectDataSource>
</asp:Content>

