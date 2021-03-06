﻿<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="WingtipToys.ProductList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <div>
            <h2><%: Page.Title %></h2>

            <asp:ListView ID="productList" runat="server" DataKeyNames="ProductID" GroupItemCount="4" ItemType="WingtipToys.Models.Product" SelectMethod="GetProducts">
                <EmptyDataTemplate>
                    <table>
                        <tr>
                            <td> No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td></td>
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceHolderContainer" runat="server">
                        <td id="itemPlaceHolder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
                    <td runat="server">
                        <table>
                            <tr>
                                <td>
                                    <!-- Before custom url routing: 
                                        <a href="ProductDetails.aspx?productID=< %#: Item.ProductID %>">
                                    -->
                                    <a href="<%#: GetRouteUrl("ProductByNameRoute", new { productName = Item.ProductName }) %>">
                                        <img src="/Catalog/Images/Thumbs/<%#:Item.ImagePath%>" width="100" height="75" style="border: solid" />
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <!-- Before custom url routing:
                                        <a href="ProductDetails.aspx?productID=< %#: Item.ProductID %>">
                                        <span>
                                            < %#: Item.ProductName %>
                                        </span>
                                    -->
                                    <a href="<%#: GetRouteUrl("ProductByNameRoute", new { productName = Item.ProductName }) %>"><%#: Item.ProductName %></a>
                                    <br />
                                    <span>
                                        <b>Price: </b><%#: String.Format("{0:c}", Item.UnitPrice) %>
                                    </span>
                                    <br />
                                    <a href="/AddToCart.aspx?productID=<%#:Item.ProductID %>">
                                        <span class="ProductItemList">
                                            <b>Add To Cart</b>
                                        </span>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table style="width:100%">
                        <tbody>
                            <tr>
                                <td>
                                    <table id="groupPlaceholderContainer" runat="server" style="width:100%">
                                        <tr id="groupPlaceholder"></tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
        </div>
    </section>
</asp:Content>
