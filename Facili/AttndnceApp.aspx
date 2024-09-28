﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="AttndnceApp.aspx.cs" Inherits="Schools.Facili.AttndnceApp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="upRegister" runat="server">
            <ContentTemplate>

                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Attendance Approve</li>
                    </ol>
                </nav>

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">
                            <label class="hd1">Attendance Approve</label>
                        </h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-145">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblCPN">Academic
                                    Year<span class="red_new">*</span></asp:Label>
                                <asp:DropDownList CssClass="col-sm-9 form-control" runat="server" ID="ddlAcademic"
                                     Enabled="false">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvAcademic" CssClass="red_new offset-md-3"
                                    ControlToValidate="ddlAcademic" Display="Dynamic"
                                    ErrorMessage="Please select Academic Year"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-145">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label1">Class Name
                                    <span class="red_new">*</span>
                                </asp:Label>
                                <asp:DropDownList CssClass="col-sm-9 form-control" runat="server" ID="ddlCname"
                                     Enabled="false">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCname" CssClass="red_new offset-md-3"
                                    ControlToValidate="ddlCname" Display="Dynamic" ErrorMessage="Please select Class">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-145">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label3">Section
                                    Name<span class="red_new">*</span></asp:Label>
                                <asp:DropDownList CssClass="col-sm-9 form-control" runat="server" Enabled="false"
                                    ID="ddlSection"  AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlSection_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvSection" CssClass="red_new offset-md-3"
                                    ControlToValidate="ddlSection" Display="Dynamic"
                                    ErrorMessage="Please select Section"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-145">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblDate">
                                    Attendance Date<span class="red_new">*</span></asp:Label>
                                <div class="col-sm-9 input-group">
                                    <asp:TextBox CssClass="form-control" ID="txtDate" runat="server"
                                        CssClass="Displaytext" Enabled="false" >
                                    </asp:TextBox>
                                    <div class="input-group-append">
                                        <asp:ImageButton CssClass="input-group-text" runat="server"
                                            CausesValidation="false" ID="iPopup" ImageUrl="/images/calendar.png"
                                            Height="38" />
                                    </div>
                                </div>
                                <ajaxToolkit:CalendarExtender ID="Calendar1" runat="server" PopupButtonID="iPopup"
                                    TargetControlID="txtDate" Format="MM/dd/yyyy">
                                </ajaxToolkit:CalendarExtender>
                                <br />
                                <asp:RequiredFieldValidator runat="server" ID="rfvDate" ControlToValidate="txtDate"
                                    Display="Dynamic" CssClass="red_new offset-md-3" ErrorMessage="Please select  Date">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="table-responsive mb-1">
                            <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                                AutoGenerateColumns="False" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                                ShowFooter="True" OnRowDataBound="gvRowDataBound">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <HeaderStyle CssClass="HeaderDatagrid" />
                                <PagerStyle CssClass="gridViewPager" />
                                <AlternatingRowStyle CssClass="AlternateItemStyle" />
                                <Columns>
                                    <asp:TemplateField HeaderText="SNo" ItemStyle-Width="25%"
                                        ItemStyle-VerticalAlign="Top" HeaderStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Admission_No" HeaderText="Admission No" />
                                    <asp:BoundField DataField="Student_Full_Name" HeaderText="Student" />
                                    <asp:BoundField DataField="PresentAbsent" HeaderText="Present/Absent" />


                                </Columns>
                            </asp:GridView>
                        </div>

                        <div class="form-group d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Approve"
                                OnClick="btnSubmit_Click" />
                        </div>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>