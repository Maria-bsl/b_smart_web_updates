<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Attendance_Report_Old.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.Attendance_Report_Old" %>

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
        function onCalendarShown() {
            var cal = $find("calendar1");
            cal._switchMode("months", true);
            if (cal._monthsBody) {
                for (var i = 0; i < cal._monthsBody.rows.length; i++) {
                    var row = cal._monthsBody.rows[i];
                    for (var j = 0; j < row.cells.length; j++) {
                        Sys.UI.DomEvent.addHandler(row.cells[j].firstChild, "click", call);
                    }
                }
            }
        }

        function onCalendarHidden() {
            var cal = $find("calendar1");
            if (cal._monthsBody) {
                for (var i = 0; i < cal._monthsBody.rows.length; i++) {
                    var row = cal._monthsBody.rows[i];
                    for (var j = 0; j < row.cells.length; j++) {
                        Sys.UI.DomEvent.removeHandler(row.cells[j].firstChild, "click", call);
                    }
                }
            }
        }

        function call(eventElement) {
            var target = eventElement.target;
            switch (target.mode) {
                case "month":
                    var cal = $find("calendar1");
                    cal.set_selectedDate(target.date);
                    cal._blur.post(true);
                    cal.raiseDateSelectionChanged(); break;
                    break;
            }
        }
        function onCalendarShown2() {
            var cal = $find("calendar2");
            cal._switchMode("months", true);
            if (cal._monthsBody) {
                for (var i = 0; i < cal._monthsBody.rows.length; i++) {
                    var row = cal._monthsBody.rows[i];
                    for (var j = 0; j < row.cells.length; j++) {
                        Sys.UI.DomEvent.addHandler(row.cells[j].firstChild, "click", call2);
                    }
                }
            }
        }

        function onCalendarHidden2() {
            var cal = $find("calendar2");
            if (cal._monthsBody) {
                for (var i = 0; i < cal._monthsBody.rows.length; i++) {
                    var row = cal._monthsBody.rows[i];
                    for (var j = 0; j < row.cells.length; j++) {
                        Sys.UI.DomEvent.removeHandler(row.cells[j].firstChild, "click", call2);
                    }
                }
            }
        }

        function call2(eventElement) {
            var target = eventElement.target;
            switch (target.mode) {
                case "month":
                    var cal = $find("calendar2");
                    cal.set_selectedDate(target.date);
                    cal._blur.post(true);
                    cal.raiseDateSelectionChanged(); break;
                    break;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="upRegister" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
            <asp:PostBackTrigger ControlID="btnPdf" />
            <asp:PostBackTrigger ControlID="btnExcel" />
        </Triggers>
    </asp:UpdatePanel>
    <ContentTemplate>

        <nav aria-label="Page breadcrumb">
            <ol class="breadcrumb mb-1 bg-white py-1 border">
                <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                <li class="breadcrumb-item">Attendance Report</li>
            </ol>
        </nav>

        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Attendance Report</h5>

                <div class="row">
                    <div class="form-group col-md-6 row mx-0">
                        <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label1">Academic
                            Year<span class="red_new">*</span></asp:Label>

                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlAcademic">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvAcad" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlAcademic" Display="Dynamic" ErrorMessage="Please select Year">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group col-md-6 row mx-0">
                        <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label2">Class<span
                                class="red_new">*</span></asp:Label>

                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlClass">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvCname" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlClass" Display="Dynamic" ErrorMessage="Please select Class">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group col-md-6 row mx-0">
                        <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label3">
                            Stream/Combination<span class="red_new">*</span></asp:Label>

                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSection">
                        </asp:DropDownList>
                       
                        <asp:RequiredFieldValidator runat="server" ID="rfvSection" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlSection" Display="Dynamic" ErrorMessage="Please select Stream/Combination">
                        </asp:RequiredFieldValidator>
                    </div>


                    <div class="form-group col-md-6 row mx-0">
                        <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label4">Month(s)
                            <span class="red_new">*</span></asp:Label>
                            <asp:ListBox CssClass="col-md-9 form-control" ID="lbMonth" runat="server" SelectionMode="Multiple">
                               <%-- <asp:ListItem Value="">Select Month(s)</asp:ListItem>--%>
                                <asp:ListItem Value="1">January</asp:ListItem>
                                <asp:ListItem Value="2">February</asp:ListItem>
                                <asp:ListItem Value="3">March</asp:ListItem>
                                <asp:ListItem Value="4">April</asp:ListItem>
                                <asp:ListItem Value="5">May</asp:ListItem>
                                <asp:ListItem Value="6">June</asp:ListItem>
                                <asp:ListItem Value="7">July</asp:ListItem>
                                <asp:ListItem Value="8">August</asp:ListItem>
                                <asp:ListItem Value="9">September</asp:ListItem>
                                <asp:ListItem Value="10">October</asp:ListItem>
                                <asp:ListItem Value="11">November</asp:ListItem>
                                <asp:ListItem Value="12">December</asp:ListItem>
                            </asp:ListBox>
                            <%--<div class="input-group-append rounded-right">
                                <asp:ImageButton CssClass="input-group-text" runat="server" CausesValidation="false"
                                    ID="iPopup" ImageUrl="/images/calendar.png" height="38px" />
                            </div>--%>
                        <%--<ajaxToolkit:CalendarExtender ID="Calendar1" runat="server" PopupButtonID="iPopup" OnClientHidden="onCalendarHidden" OnClientShown="onCalendarShown"
                         BehaviorID="calendar1"  TargetControlID="txtFDate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender><br />--%>
                        <asp:RequiredFieldValidator runat="server" ID="rfvFDate" ControlToValidate="lbMonth"
                            Display="Dynamic" CssClass="red_new offset-md-3" ErrorMessage="Please select month">
                        </asp:RequiredFieldValidator>
                        <%--<asp:comparevalidator ID="cmpFDate" runat="server" Display="Dynamic"
                            errormessage="The date must be less than today date" CssClass="red_new offset-md-3"
                            valuetocompare="<%# DateTime.Today.ToShortDateString() %>" controltovalidate="txtFDate"
                            type="date" Operator="LessThan" />--%>

                    </div>

                    <%--<div class="form-group col-md-6 row mx-0">
                        <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label5">To Date
                            <span class="red_new">*</span></asp:Label>
                        <div class="input-group col-md-9 px-0">
                            <asp:TextBox CssClass="form-control" ID="txtTDate" runat="server">
                            </asp:TextBox>
                            <div class="input-group-append rounded-right">
                                <asp:ImageButton CssClass="input-group-text" runat="server" CausesValidation="false"
                                    ID="iPopup1" ImageUrl="/images/calendar.png" height="38px" />
                            </div>
                        </div>
                        <ajaxToolkit:CalendarExtender ID="Calendar2" runat="server" PopupButtonID="iPopup1" OnClientHidden="onCalendarHidden2" OnClientShown="onCalendarShown2"
                         BehaviorID="calendar2"
                            TargetControlID="txtTDate" Format="MM/dd/yyyy">
                        </ajaxToolkit:CalendarExtender><br />
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                            ControlToValidate="txtTDate" Display="Dynamic" CssClass="red_new offset-md-3"
                            ErrorMessage="Please select to date"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cmpVal" ControlToCompare="txtFDate" ControlToValidate="txtTDate"
                            Display="Dynamic" CssClass="red_new offset-md-3" Type="Date" Operator="GreaterThan"
                            ErrorMessage="To Date should be greater than From Date" runat="server">
                        </asp:CompareValidator>
                    </div>--%>

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
                            <asp:BoundField DataField="Admission_No" HeaderText="Admission No"
                                ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                            <asp:BoundField DataField="Student_Full_Name" HeaderText="Student"
                                ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                            <asp:BoundField DataField="" HeaderText="Total Days" ItemStyle-VerticalAlign="Top"
                                HtmlEncode="False" />
                            <asp:BoundField DataField="" HeaderText="Present" ItemStyle-VerticalAlign="Top"
                                HtmlEncode="False" />
                            <asp:BoundField DataField="" HeaderText="Absent" ItemStyle-VerticalAlign="Top"
                                HtmlEncode="False" />
                            <asp:BoundField DataField="" HeaderText="Sick" ItemStyle-VerticalAlign="Top"
                                HtmlEncode="False" />
                            <asp:BoundField DataField="" HeaderText="Permission" ItemStyle-VerticalAlign="Top"
                                HtmlEncode="False" />

                        </Columns>

                    </asp:GridView>
                </div>
            </div>
        </div>
    </ContentTemplate>

</asp:Content>