﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="BooksDisposalApp.aspx.cs" Inherits="Schools.Facili.BooksDisposalApp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="update" runat="server">
            <ContentTemplate>
                <script type="text/javascript">
                    function showProgress() {
                        if (Page_ClientValidate()) {
                            var updateProgress = $get("<%= upProgress.ClientID %>");
                            updateProgress.style.display = "block";
                        }
                    }
                </script>

                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Books Disposal Approve</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">
                            <asp:Label runat="server" ID="lblInbox" CssClass="hd1">Books Disposal Approve
                            </asp:Label>
                        </h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-100">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0"> runat="server" ID="lblPB">Location
                                    Id</asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtliblid" Enabled="false"
                                    runat="server">
                                </asp:TextBox>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-100">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0"> runat="server" ID="Label2">Location
                                    Name</asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtliblname" Enabled="false"
                                    runat="server">
                                </asp:TextBox>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-100">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0"> runat="server" ID="Label1">Subject
                                </asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtSubject" Enabled="false"
                                    runat="server">
                                </asp:TextBox>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-100">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0"> runat="server" ID="Label3">Remarks
                                </asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtremarks" TextMode="MultiLine"
                                    Enabled="false" runat="server">
                                </asp:TextBox>
                            </div>
                        </div>

                        <div class="table-responsive mb-1">
                            <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                                AutoGenerateColumns="False" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                                AllowPaging="false" ShowFooter="True">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <HeaderStyle CssClass="HeaderDatagrid" />
                                <PagerStyle CssClass="gridViewPager" />
                                <AlternatingRowStyle CssClass="AlternateItemStyle" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Sno">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex +1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%-- <asp:BoundField DataField="Books_OP_MAS_ID" HeaderText="Book Receive Sno" ShowHeader="false" >
                                                 <ItemStyle CssClass="hide" /><HeaderStyle CssClass="hide"/>
                                             </asp:BoundField>--%>

                                    <asp:BoundField DataField="Book_Title" HeaderText="Book Title" />
                                    <asp:BoundField DataField="Author" HeaderText="Author" />

                                    <asp:BoundField DataField="No_Of_Books" HeaderText="Quantity" />

                                </Columns>
                            </asp:GridView>
                        </div>


                        <div class="form-group d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server"
                                OnClientClick="showProgress();" Text="Approve" OnClick="btnSubmit_Click" />
                        </div>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="update">
            <ProgressTemplate>
                <div
                    style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                    <span
                        style="border-width: 0px; position: fixed; padding: 20px; background-color: #FFFFFF; font-size: 30px; left: 40%; top: 40%; border-radius: 50px;">
                        <img alt="progress" src="/Images/loader1.gif" />Loading ...</span>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
</asp:Content>