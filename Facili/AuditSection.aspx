﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditSection.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.AuditSection" %>

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
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPdf" />
            <asp:PostBackTrigger ControlID="btnExcel" />
        </Triggers>
    </asp:UpdatePanel>
    <ContentTemplate>

        <nav aria-label="Page breadcrumb">
            <ol class="breadcrumb mb-1 bg-white py-1 border">
                <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                <li class="breadcrumb-item">Section</li>
            </ol>
        </nav>

        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Section</h5>

                <div class="row">
                    <div class="form-group col-md-6 row mx-0">
                        <label class="col-md-3 col-form-label pl-0">Date From</label>
                        <div class="input-group col-md-9 px-0">
                            <asp:TextBox CssClass="col-md-9 form-control" ID="txtFDate" runat="server">
                            </asp:TextBox>
                            <div class="input-group-append rounded-right">
                                <asp:ImageButton CssClass="input-group-text" runat="server" CausesValidation="false"
                                    ID="iPopup" ImageUrl="/images/calendar.png" height="38px" />
                            </div>
                        </div>
                        <ajaxToolkit:CalendarExtender ID="Calendar1" runat="server" PopupButtonID="iPopup"
                            TargetControlID="txtFDate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender><br />
                        <asp:RequiredFieldValidator runat="server" ID="rfvFDate" ControlToValidate="txtFDate"
                            Display="Dynamic" CssClass="red_new offset-md-3" ErrorMessage="Please select from date">
                        </asp:RequiredFieldValidator>
                        <asp:comparevalidator ID="cmpFDate" runat="server" Display="Dynamic"
                            errormessage="The date must be less than or equal to today date"
                            CssClass="red_new offset-md-3" valuetocompare="<%# DateTime.Today.ToShortDateString() %>"
                            controltovalidate="txtFDate" type="date" Operator="LessThanEqual" />
                    </div>

                    <div class="form-group col-md-6 row mx-0">
                        <label class="col-md-3 col-form-label pl-0">Date To</label>
                        <div class="input-group col-md-9 px-0">
                            <asp:TextBox CssClass="col-md-9 form-control" ID="txtTDate" runat="server">
                            </asp:TextBox>
                            <div class="input-group-append rounded-right">
                                <asp:ImageButton CssClass="input-group-text" runat="server" CausesValidation="false"
                                    ID="iPopup1" ImageUrl="/images/calendar.png" height="38px" />
                            </div>
                        </div>
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="iPopup1"
                            TargetControlID="txtTDate" Format="MM/dd/yyyy">
                        </ajaxToolkit:CalendarExtender><br />
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                            ControlToValidate="txtTDate" Display="Dynamic" CssClass="red_new offset-md-3"
                            ErrorMessage="Please select to date"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cmpVal" ControlToCompare="txtFDate" ControlToValidate="txtTDate"
                            Display="Dynamic" CssClass="red_new offset-md-3" Type="Date" Operator="GreaterThanEqual"
                            ErrorMessage="To Date should be greater than or equal to From Date" runat="server">
                        </asp:CompareValidator>
                    </div>
                </div>

                <div class="form-group d-flex justify-content-end">
                    <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="View Report"
                        OnClick="btnSubmit_Click" />
                    <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnPdf" runat="server" Text="Download PDF"
                        OnClick="btnPdf_Click" />
                    <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnExcel" runat="server"
                        Text="Download Excel" OnClick="btnExcel_Click" />

                </div>

                <div class="table-responsive mb-1">
                    <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                        AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                        HeaderStyle-CssClass="HeaderDatagrid" PageSize="10" OnRowDataBound="gvRowDataBound"
                        OnPageIndexChanging="gvDept_PageIndexChanging" AllowPaging="false">
                        <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                        <PagerStyle CssClass="gridViewPager" />
                        <Columns>
                            <asp:BoundField DataField="AuditID" HeaderText="AuditID" />
                            <asp:BoundField DataField="AuditAction" HeaderText="Action" />
                            <asp:BoundField DataField="SectionSno" HeaderText="Section Sno" />
                            <asp:BoundField DataField="Section_Name" HeaderText="Section" />
                            <asp:BoundField DataField="Audit_Date" HeaderText="Action Date"
                                DataFormatString="{0:dd/M/yyyy}" />
                            <asp:BoundField DataField="AuditDone" HeaderText="Action By" />
                        </Columns>
                    </asp:GridView>

                </div>
            </div>
        </div>
    </ContentTemplate>

</asp:Content>