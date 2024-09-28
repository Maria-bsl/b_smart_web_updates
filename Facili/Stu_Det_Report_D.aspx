﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Stu_Det_Report_D.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="PresentationLayer.Facili.Stu_Det_Report_D" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script>
        $(document).ready(function () {
            $('table[id*=gvDept]>tbody>tr').click(function () {
                if ($(this).find(' input[type=radio]')[0]) {
                    $(this).find(' input[type=radio]')[0].click();
                }
            });

            $('table[id*=gvDept]').prepend($("<thead></thead>").append($(this).find("tr:first")))
                .DataTable({
                    "responsive": true,
                    "stateSave": true,
                    "lengthMenu": [
                        [10, 20, 30, 50, -1],
                        [10, 20, 30, 50, "All"]
                    ],
                    "sPaginationType": "full_numbers"
                });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="upRegister" runat="server">
        <ContentTemplate>

            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                    <li class="breadcrumb-item">Student Deactivate Details Report</li>
                </ol>
            </nav>

            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Student Deactivate Details Report</h5>

                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <label class="col-md-3 col-form-label pl-0">School</label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSchool">
                            </asp:DropDownList>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvRegion" CssClass="red_new offset-md-3"
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
                                ErrorMessage="Please select academic">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <label class="col-md-3 col-form-label pl-0">Class</label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlClass">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvCountry" CssClass="red_new offset-md-3"
                                ControlToValidate="ddlClass" Display="Dynamic" ErrorMessage="Please select class">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label1">Stream/Combination
                            </asp:Label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSection">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvDistrict" CssClass="red_new offset-md-3"
                                ControlToValidate="ddlSection" Display="Dynamic" ErrorMessage="Please select Stream/Combination">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <label class="col-md-3 col-form-label pl-0">Admission No.</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtAN">
                            </asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group d-flex justify-content-end">
                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="View Report"
                            OnClick="btnSubmit_Click" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnPdf" runat="server"
                            Text="Download PDF" OnClick="btnPdf_Click" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnExcel" runat="server"
                            Text="Download Excel" OnClick="btnExcel_Click" />
                    </div>

                    <div class="table-responsive mb-1">
                        <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                            AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                            ShowFooter="false" HeaderStyle-CssClass="HeaderDatagrid" PageSize="10"
                            OnRowDataBound="gvRowDataBound" OnPageIndexChanging="gvDept_PageIndexChanging"
                            AllowPaging="false">
                            <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                            <PagerStyle CssClass="gridViewPager" />
                            <Columns>
                                <asp:TemplateField HeaderText="SNo" ItemStyle-Width="2%" ItemStyle-VerticalAlign="Top"
                                    HeaderStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Acad_Year" HeaderText="Academic Year"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                <asp:BoundField DataField="Class_Name" HeaderText="Class" ItemStyle-VerticalAlign="Top"
                                    HtmlEncode="False" />
                                <asp:BoundField DataField="Section_Name" HeaderText="Stream/Combination"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                <asp:BoundField DataField="Student_Full_Name" HeaderText="Student Name"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                <asp:BoundField DataField="Admission_No" HeaderText="Admission No."
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                <asp:BoundField DataField="Admission_Date" HeaderText="Admission Date"
                                    DataFormatString="{0:dd/M/yyyy}" ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                <asp:BoundField DataField="Parent_Name" HeaderText="Parent"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                <asp:BoundField DataField="Parent_Mobile_No" HeaderText="Parent Mobile"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False"></asp:BoundField>
                                <asp:BoundField DataField="Parent_Email_Address" HeaderText="Parent Email"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False"></asp:BoundField>
                                <asp:BoundField DataField="Gender" HeaderText="Gender"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False"></asp:BoundField>
                                <asp:BoundField DataField="AuditBy" HeaderText="Action By"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False"></asp:BoundField>
                                <asp:BoundField DataField="Audit_Date" HeaderText="Date Deactivated" DataFormatString="{0:dd/M/yyyy}"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False"></asp:BoundField>
                            </Columns>
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

</asp:Content>