﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fee_Up_Report.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="PresentationLayer.Facili.Fee_Up_Report" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        table[id$=gvDept] tr>td:nth-of-type(8) {
            text-align: right;
        }
    </style>

    <script>
        $(document).ready(function () {
            $('table[id*=gvDept]>tbody>tr').click(function () {
                if ($(this).find(' input[type=radio]')[0]) {
                    $(this).find(' input[type=radio]')[0].click();
                }
            });

            var gvDeptTable = $('table[id*=gvDept]');

            if ($(gvDeptTable).length != 0) {

                var gvDeptFooter = $('[id$=lblRATot]').parent().parent();

                $(gvDeptTable).prepend(
                    $("<thead/>").append(
                        $(this).find("tr:first")
                    )
                );

                if ($(gvDeptFooter).length != 0) {
                    $(gvDeptTable).append(
                        $('<tfoot/>').prepend(
                            $(this).find($(gvDeptFooter))
                        )
                    );
                }

                $(gvDeptTable).DataTable({
                    "responsive": true,
                    "stateSave": true,
                    "stateDuration": 60 * 3,
                    "lengthMenu": [
                        [10, 20, 30, 50, -1],
                        [10, 20, 30, 50, "All"]
                    ],
                    "sPaginationType": "full_numbers",

                    "footerCallback": function (row, data, start, end, display) {
                        var api = this.api(),
                            data;

                        // Remove the formatting to get integer data for summation
                        var intVal = function (i) {
                            return typeof i === 'string' ? i.replace(/[\$,]/g, '') * 1 :
                                typeof i === 'number' ? i : 0;
                        };

                        // Total over this page
                        var requestedAmountPageTotal = api
                            .column(7, {
                                page: 'current'
                            })
                            .data()
                            .reduce(function (a, b) {
                                return intVal(a) + intVal(b);
                            }, 0);

                        //Note: Solve is NaN exception
                        var value_requestedAmountPageTotal = checkIsNaN(
                                Intl.NumberFormat().format(requestedAmountPageTotal)
                            ) === true ?
                            0 : Intl.NumberFormat().format(requestedAmountPageTotal);

                        // Update footer
                        $('[id$=lblRATot]').text(value_requestedAmountPageTotal);
                    }

                });

            }


            $('table[id*=gvCopy]>tbody>tr').click(function () {
                if ($(this).find(' input[type=radio]')[0]) {
                    $(this).find(' input[type=radio]')[0].click();
                }
            });

            var gvCopyTable = $('table[id*=gvCopy]');

            if ($(gvCopyTable).length != 0) {

                $(gvCopyTable).prepend(
                    $("<thead></thead>").append(
                        $(this).find("tr:first")
                    )
                );
                $(gvCopyTable).DataTable({
                    "responsive": true,
                    "stateSave": true,
                    "stateDuration": 60 * 3,
                    "lengthMenu": [
                        [10, 20, 30, 50, -1],
                        [10, 20, 30, 50, "All"]
                    ],
                    "sPaginationType": "full_numbers"
                });

            }
        });

        function checkIsNaN(params) {
            params = String(params);
            return Number.isNaN(Number(params.replace(/,/g, "")));
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="upRegister" runat="server">
            <ContentTemplate>

                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Fee Data Report</li>
                    </ol>
                </nav>

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Fee Data Report</h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <label class="col-sm-3 col-form-label pl-0">School</label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSchool">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvRegion" CssClass="red_new offset-md-3"
                                    ControlToValidate="ddlSchool" Display="Dynamic" ErrorMessage="Please select school">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblDesig">Academic
                                </asp:Label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlAcademic">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2"
                                    ControlToValidate="ddlAcademic" Display="Dynamic"
                                    ErrorMessage="Please select academic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <label class="col-sm-3 col-form-label pl-0">Term</label>

                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlTerm">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                                    ControlToValidate="ddlTerm" Display="Dynamic" CssClass="red_new offset-md-3"
                                    ErrorMessage="Please select term">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label1">Fee
                                </asp:Label>

                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlFee">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCountry" ControlToValidate="ddlFee"
                                    Display="Dynamic" CssClass="red_new offset-md-3" ErrorMessage="Please select fee">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <label class="col-sm-3 col-form-label pl-0">Admission No.</label>

                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtAN"></asp:TextBox>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label2">Reference
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

                        <div>
                            <asp:GridView ID="gvDept"
                                Style="border-width: 0px; border-style: None; width: 100%; border-collapse: collapse;"
                                runat="server" AutoGenerateColumns="false" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" ShowFooter="true"
                                HeaderStyle-CssClass="HeaderDatagrid" PageSize="10" OnRowDataBound="gvRowDataBound"
                                OnPageIndexChanging="gvDept_PageIndexChanging" AllowPaging="false">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <PagerStyle CssClass="gridViewPager" />
                                <Columns>
                                    <asp:TemplateField HeaderText="SNo" ItemStyle-Width="2%"
                                        ItemStyle-VerticalAlign="Top" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Student_Full_Name" HeaderText="Student Name"
                                        ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                    <asp:BoundField DataField="Admission_No" HeaderText="Admission No."
                                        ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                    <asp:BoundField DataField="Fee_Data_Sno" HeaderText="Reference No."
                                        ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                    <asp:TemplateField HeaderText="Fee Amount">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblRA" Text='<%#Eval("Requested_Amount") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                        <FooterTemplate>
                                            <asp:Label ID="lblRATot" runat="server"></asp:Label><br />
                                            <asp:Label ID="lblRATot1" runat="server"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>


                                </Columns>
                                <FooterStyle HorizontalAlign="Left" />
                            </asp:GridView>
                            <asp:GridView ID="gvCopy" Visible="false"
                                Style="border-width: 0px; border-style: None; width: 100%; border-collapse: collapse;"
                                runat="server" AutoGenerateColumns="false" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" ShowFooter="true"
                                HeaderStyle-CssClass="HeaderDatagrid" OnRowDataBound="gvCopyRowDataBound"
                                AllowPaging="false">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <PagerStyle CssClass="gridViewPager" />
                                <Columns>
                                    <asp:TemplateField HeaderText="SNo" ItemStyle-Width="2%"
                                        ItemStyle-VerticalAlign="Top" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Fee_Data_Sno" HeaderText="Reference No."
                                        ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                    <asp:TemplateField HeaderText="Fee Amount">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblRA1" Text='<%#Eval("Requested_Amount") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>


                                </Columns>
                                <FooterStyle HorizontalAlign="Right" />
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