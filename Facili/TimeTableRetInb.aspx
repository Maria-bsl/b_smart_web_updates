﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="TimeTableRetInb.aspx.cs" Inherits="Schools.Facili.TimeTableRetInb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="upRegister" runat="server">
            <ContentTemplate>
                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Time Table Return Inbox</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><label class="hd1 mb-0">Time Table Return Inbox</label></h5>

                        <div class="table-responsive mb-1">
                            <asp:GridView ID="gvPermit" CssClass="table table-bordered mb-1 display" runat="server"
                                EmptyDataText="No data exists." ShowHeaderWhenEmpty="true"
                                OnRowDataBound="InbRowDataBound" OnPageIndexChanging="gvPermit_PageIndexChanging"
                                AutoGenerateColumns="false" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                                PageSize="10" AllowPaging="false">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <PagerStyle CssClass="gridViewPager" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Academic Year">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="lnkView" Text='<%#Eval("Acad_Year")%>'
                                                OnClick="lnkView_Click">
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblID"
                                                Text='<%#Eval("Time_Table_Mas_Sno") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Class_Name" HeaderText="Class" />
                                    <asp:BoundField DataField="Section_Name" HeaderText="Stream/Combination" />
                                    <asp:BoundField DataField="Time_Table_Date" HeaderText="Timetable Date"
                                        DataFormatString="{0:dd/M/yyyy}" />
                                    <asp:BoundField DataField="Day" HeaderText="Day" />

                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>