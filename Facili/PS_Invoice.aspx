<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PS_Invoice.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.PS_Invoice" %>

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

    <nav aria-label="Page breadcrumb">
        <ol class="breadcrumb mb-1 bg-white py-1 border">
            <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
            <li class="breadcrumb-item">Print/Send Invoice</li>
        </ol>
    </nav>

    <div class="card">
        <div class="card-body">

            <h5 class="card-title">Print/Send Invoice</h5>

            <div class="row">
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                    <label class="col-md-3 col-form-label pl-0">Admission No:</label>
                    <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtRegion" MaxLength="100">
                    </asp:TextBox>
                </div>

                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                    <label class="col-md-3 col-form-label pl-0">Class:</label>
                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlClass">
                    </asp:DropDownList>

                </div>

                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                    <label class="col-md-3 col-form-label pl-0">Date From</label>
                    <div class="input-group col-md-9 px-0">
                        <asp:TextBox CssClass="Displaytext form-control" ID="txtFDate" runat="server"></asp:TextBox>
                        <div class="input-group-append rounded-right">
                            <asp:ImageButton CssClass="input-group-text" runat="server" CausesValidation="false"
                                ID="iPopup" ImageUrl="/images/calendar.png" Height="38" />
                            <ajaxToolkit:CalendarExtender ID="Calendar1" runat="server" PopupButtonID="iPopup"
                                TargetControlID="txtFDate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender><br />
                        </div>
                    </div>
                    <asp:RequiredFieldValidator runat="server" ID="rfvFDate" ControlToValidate="txtFDate"
                        Display="Dynamic" CssClass="red_new offset-md-3" ErrorMessage="Please select from date">
                    </asp:RequiredFieldValidator>
                    <asp:comparevalidator ID="cmpFDate" runat="server" Display="Dynamic"
                        errormessage="The date must be less than or equal to today date" CssClass="red_new offset-md-3"
                        valuetocompare="<%# DateTime.Today.ToShortDateString() %>" controltovalidate="txtFDate"
                        type="date" Operator="LessThanEqual" />
                </div>

                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                    <label class="col-md-3 col-form-label pl-0">Date To</label>
                    <div class="input-group col-md-9 px-0">
                        <asp:TextBox CssClass="Displaytext form-control" ID="txtTDate" runat="server"></asp:TextBox>
                        <div class="input-group-append rounded-right">
                            <asp:ImageButton CssClass="input-group-text" runat="server" CausesValidation="false"
                                ID="iPopup1" ImageUrl="/images/calendar.png" Height="38" />
                        </div>
                    </div>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="iPopup1"
                        TargetControlID="txtTDate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender><br />
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtTDate"
                        Display="Dynamic" CssClass="red_new offset-md-3" ErrorMessage="Please select to date">
                    </asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cmpVal" ControlToCompare="txtFDate" ControlToValidate="txtTDate"
                        Display="Dynamic" CssClass="red_new offset-md-3" Type="Date" Operator="GreaterThanEqual"
                        ErrorMessage="To Date should be greater than or equal to From Date" runat="server">
                    </asp:CompareValidator>
                </div>
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                    <label class="col-md-3 col-form-label pl-0">Update Due Date(Optional)</label>
                    <div class="input-group col-md-9 px-0">
                        <asp:TextBox CssClass="Displaytext form-control" ID="txtupd" runat="server"></asp:TextBox>
                        <div class="input-group-append rounded-right">
                            <asp:ImageButton CssClass="input-group-text" runat="server" CausesValidation="false"
                                ID="iPopup2" ImageUrl="/images/calendar.png" Height="38" />
                        </div>
                    </div>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" PopupButtonID="iPopup2"
                        TargetControlID="txtupd" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender><br />
                    
                </div>
            </div>

            <div class="form-group d-flex justify-content-end">
                <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Find"
                    OnClick="btnSubmit_Click" />
            </div>

            <div class="table-responsive mb-1">
                <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                    AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle" OnRowDataBound="gvRowDataBound"
                    HeaderStyle-CssClass="HeaderDatagrid" AllowPaging="false" OnRowCancelingEdit="gvDept_RowCancelingEdit" OnRowCommand="gvDept_OnRowCommand"
                            DataKeyNames="Sno" OnRowEditing="gvDept_RowEditing" OnRowUpdating="gvDept_RowUpdating">
                    <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                    <PagerStyle CssClass="gridViewPager" />
                    <Columns>
                        <asp:TemplateField HeaderText="Admission No" >
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblAN" Text='<%#Eval("Admission_No") %>'>
                                </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Upload Date">
                            <ItemTemplate>
                                <asp:Label ID="lblUD" runat="server" Text='<%#Convert.ToDateTime(Eval("Upload_Date")).ToString("MM/dd/yyyy") %>'>
                                </asp:Label>
                            </ItemTemplate>
                           
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Full Name" >
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblFN" Text='<%#Eval("Student_Full_Name") %>'>
                                </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Term" >
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblTT" Text='<%#Eval("Term_Type") %>'>
                                </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fee" >
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblFT" Text='<%#Eval("Fee_Type") %>'>
                                </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Amount" >
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblRA" Text='<%#Eval("Requested_Amount") %>'>
                                </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Parent Name" >
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblPN" Text='<%#Eval("Parent_Name") %>'>
                                </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:BoundField DataField="Sno" HeaderText="Sector ID" ShowHeader="false">
                            <ItemStyle CssClass="hide" />
                            <HeaderStyle CssClass="hide" />
                        </asp:BoundField>
                        <asp:CommandField ShowEditButton="false" />
                    </Columns>
                </asp:GridView>
            </div>

            <div class="form-group d-flex justify-content-end">
                <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="lnkView" runat="server" Visible="false"
                    Text="Print Invoice" OnClick="lnkView_Click" />
                <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="lnkView1" runat="server" Visible="false"
                    Text="Email/SMS Resend" OnClick="lnkView1_Click" />
            </div>

        </div>
    </div>
</asp:Content>