﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fee_Bal_Report_C.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="PresentationLayer.Facili.Fee_Bal_Report_C" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="upRegister" runat="server">
            <ContentTemplate>

                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Fee Balance Report</li>
                    </ol>
                </nav>

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Fee Balance Report</h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                                <label class="col-md-3 col-form-label pl-0">School</label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSchool">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvRegion" CssClass="red_new offset-md-3"
                                    ControlToValidate="ddlSchool" Display="Dynamic" ErrorMessage="Please select school">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <label class="col-md-3 col-form-label pl-0">Schools</label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSch" AutoPostBack="true" OnSelectedIndexChanged="ddlSch_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" CssClass="red_new offset-md-3"
                                ControlToValidate="ddlSchool" Display="Dynamic" ErrorMessage="Please select school">
                            </asp:RequiredFieldValidator>
                        </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblDesig">Academic
                                </asp:Label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlAcademic">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2"
                                    CssClass="red_new offset-md-3" ControlToValidate="ddlAcademic" Display="Dynamic"
                                    ErrorMessage="Please select academic"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                                <label class="col-md-3 col-form-label pl-0">Term</label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlTerm">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                                    CssClass="red_new offset-md-3" ControlToValidate="ddlTerm" Display="Dynamic"
                                    ErrorMessage="Please select term"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label1">Fee
                                </asp:Label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlFee">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCountry"
                                    CssClass="red_new offset-md-3" ControlToValidate="ddlFee" Display="Dynamic"
                                    ErrorMessage="Please select fee"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                                <label class="col-md-3 col-form-label pl-0">Class</label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlClass">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3"
                                    CssClass="red_new offset-md-3" ControlToValidate="ddlClass" Display="Dynamic"
                                    ErrorMessage="Please select class"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label3">Stream/Combination
                                </asp:Label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSection">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvDistrict"
                                    CssClass="red_new offset-md-3" ControlToValidate="ddlSection" Display="Dynamic"
                                    ErrorMessage="Please select Stream/Combination"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                                <label class="col-md-3 col-form-label pl-0">Admission No.</label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtAN"></asp:TextBox>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label2">Reference
                                    No.</asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtRN"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server"
                                Text="View Report" OnClick="btnSubmit_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnPdf" runat="server"
                                Text="Download PDF" OnClick="btnPdf_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnExcel" runat="server"
                                Text="Download Excel" OnClick="btnExcel_Click" />

                        </div>

                        <div class="table-responsive mb-1">
                            <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                                Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" ShowFooter="false"
                                HeaderStyle-CssClass="HeaderDatagrid" PageSize="10" OnRowDataBound="gvRowDataBound"
                                OnPageIndexChanging="gvDept_PageIndexChanging" AllowPaging="false">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <PagerStyle CssClass="gridViewPager" />
                                
                                <FooterStyle HorizontalAlign="Left" />
                            </asp:GridView>
                        </div>

                       
                    </div>
                </div>

            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnSubmit" />
                <asp:PostBackTrigger ControlID="btnPdf" />
                <asp:PostBackTrigger ControlID="btnExcel" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>