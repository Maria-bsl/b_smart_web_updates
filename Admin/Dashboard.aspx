﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" MasterPageFile="~/Head_Admin.Master" Inherits="Schools.Admin.Dashboard" %>

<%@ MasterType VirtualPath="~/Head_Admin.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>

        .dashboard-hidden {
            position: relative;
        }

        <%-- nav {
            display: none;
        } --%>

    </style>

 <%-- <app-root></app-root>  --%>
    <div class="dashbaord-hidden">
        <nav aria-label="Page breadcrumb">
            <ol class="breadcrumb mb-1 bg-white py-1 border">
                <li class="breadcrumb-item active" aria-current="page"><a href="txKulA">Home</a></li>
                <li class="breadcrumb-item"></li>
            </ol>
        </nav>        
    </div>
    <%-- <style>
        .dashboard-page{
            width: 100%
        }
    </style> --%>
    <dashboard-page></dashboard-page>
</asp:Content>
