﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateFacireg_Self.aspx.cs" MasterPageFile="~/Head_Admin.Master" Inherits="PresentationLayer.Admin.UpdateFacireg_Self" %>
<%@ MasterType VirtualPath="~/Head_Admin.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="upRegistration" runat="server">
            <ContentTemplate>


                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="txKulA">Home</a></li>
                        <li class="breadcrumb-item">Registration</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Registration</h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <label class="col-md-3 col-form-label pl-0">School Short Name <span
                                        class="red_new">*</span></label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtShort" MaxLength="3"
                                    ToolTip="Short Name:(ex:SCH)"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvShort" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtShort" Display="Dynamic"
                                    ErrorMessage="Please enter short name"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1"
                                    CssClass="red_new offset-md-3" ValidationExpression="^[A-Za-z]+$"
                                    ControlToValidate="txtShort" Display="Dynamic"
                                    ErrorMessage="Please enter valid short name">
                                </asp:RegularExpressionValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblCompany">School
                                    Name<span class="red_new">*</span></asp:Label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" Visible="false"
                                    ID="ddlFaci"></asp:DropDownList>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtFaci" AutoPostBack="true" OnTextChanged="txtFaci_TextChanged"
                                    MaxLength="200"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCPN" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtFaci" Display="Dynamic"
                                    ErrorMessage="Please enter School name"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblCPN">Branch
                                    Name<span class="red_new">*</span></asp:Label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlBranch">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvBranch" CssClass="red_new offset-md-3"
                                    ControlToValidate="ddlBranch" Display="Dynamic"
                                    ErrorMessage="Please select branch name"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label4">
                                    Institution ID<span class="red_new">*</span></asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtIns"
                                    MaxLength="200"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvIns" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtIns" Display="Dynamic"
                                    ErrorMessage="Please enter institution id"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblCaptcha">School
                                    Reg No.<span class="red_new">*</span></asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtRegNo"
                                    MaxLength="100"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4"
                                    CssClass="red_new offset-md-3" ControlToValidate="txtRegNo" Display="Dynamic"
                                    ErrorMessage="Please enter registration no."></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label7">Authorized
                                    User<span class="red_new">*</span></asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtName"
                                    MaxLength="100"></asp:TextBox>
                                <small class="offset-md-3">(Enter Full Name)</small>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2"
                                    CssClass="red_new offset-md-3" ControlToValidate="txtName" Display="Dynamic"
                                    ErrorMessage="Please enter name"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblEmail">Email
                                    Address<span class="red_new">*</span></asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtEmail"
                                    MaxLength="200"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvEmail" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtEmail" Display="Dynamic"
                                    ErrorMessage="Please enter email address"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revEmail" CssClass="red" runat="server"
                                    ControlToValidate="txtEmail" ErrorMessage="Please enter the valid Email ID"
                                    ValidationExpression="^[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"
                                    Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblPB">Country
                                </asp:Label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlCountry">
                                </asp:DropDownList>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblDesig">Region
                                </asp:Label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlRegion"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlRegion_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblCity">District
                                </asp:Label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlDistrict"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblPostal">Ward
                                </asp:Label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlWard">
                                </asp:DropDownList>

                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label1">Address
                                </asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtAdd"
                                    MaxLength="400"></asp:TextBox>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label2">Website
                                </asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtWeb"
                                    MaxLength="200"></asp:TextBox>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label3">Phone No.
                                </asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtPhone"
                                    MaxLength="200"></asp:TextBox>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblMobile">Mobile
                                    No.<span class="red_new">*</span></asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtWork" MaxLength="20"
                                    ToolTip="Mobile No:(ex:784777777)"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvWork" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtWork" Display="Dynamic" ErrorMessage="Please enter mobile no">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ID="revWork"
                                    CssClass="red_new offset-md-3" ValidationExpression="^[0-9]{1,12}$"
                                    ControlToValidate="txtWork" Display="Dynamic"
                                    ErrorMessage="Please enter valid number"> </asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <div class="table-responsive mb-1">
                            <asp:gridview ID="Gridview1" runat="server" ShowFooter="true" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" AutoGenerateColumns="false"
                                CssClass="table table-bordered mb-1 display" OnRowCreated="Gridview1_RowCreated"
                                HeaderStyle-CssClass="HeaderDatagrid">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <PagerStyle CssClass="gridViewPager" />
                                <Columns>
                                    <asp:BoundField DataField="RowNumber" HeaderText="SNo" ItemStyle-Width="1%" />
                                    <asp:TemplateField HeaderText="Account No">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtValidity" MaxLength="100" runat="server"
                                                CssClass="form-control" style="max-width: 275px;"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ID="rfvValidity"
                                                ControlToValidate="txtValidity" Display="Dynamic"
                                                CssClass="red_new offset-md-3" ErrorMessage="Please enter account no">
                                            </asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Currency">
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlCur" runat="server"  CssClass="form-control" Width="275"></asp:DropDownList>
                                            <asp:RequiredFieldValidator runat="server" ID="rfvCur" ControlToValidate="ddlCur" Display="Dynamic"
                                                CssClass="red_new offset-md-3" ErrorMessage="Please select currency">
                                            </asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false"
                                                onclick="LinkButton1_Click">Remove</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:gridview>
                        </div>
                         <div class="table-responsive mb-1">
                        <asp:GridView ID="gvComments"
                            Style="border-width: 0px; border-style: None; width: 100%; border-collapse: collapse;" runat="server" AutoGenerateColumns="false" Width="100%"
                            EmptyDataText="No comments exists" GridLines="None" AllowPaging="true" PageSize="10" OnPageIndexChanging="gvComments_PageIndexChanging"
                            ShowHeader="false">
                            <PagerStyle CssClass="gridViewPager" />
                            <Columns>
                                <asp:TemplateField HeaderText="Commentd On" ItemStyle-VerticalAlign="Top" ItemStyle-Width="60px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCD" runat="server">
                                            <br />Commented By:<br />Commented
                                            Date:<br />Comment:<br />
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Commented By"
                                    ItemStyle-VerticalAlign="Top"
                                    ItemStyle-Width="200px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCB" runat="server"><br />
                                             <%# Eval("UserName") %><br />
                                                <%# Eval("C_Date") %><br />
                                                    <%# Eval("Comment") %><br />
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-sm-3 col-form-label pl-0">Add Comments <span
                                class="red"></span></label>
                        <asp:TextBox CssClass="form-control" runat="server"
                            TextMode="MultiLine" Rows="5" Columns="30" ID="txtComments">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvComments"
                            CssClass="red_new offset-md-3" ControlToValidate="txtComments" Display="Dynamic"
                            ErrorMessage="Please enter comments">
                        </asp:RequiredFieldValidator>
                    </div>
                        <div class="form-group d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="ButtonAdd" runat="server"
                                CausesValidation="false" Text="Add New Row" onclick="ButtonAdd_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnReg" runat="server"
                                Text="Update"
                                OnClientClick="return confirmCheckIn(this,'Are you sure you want to update?');"
                                OnClick="btnReg_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" CausesValidation="false" ID="btnCancel" OnClick="btnCancel_Click"
                                Text="Cancel" />
                        </div>
                    </div>
                </div>

            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="txtFaci" EventName="TextChanged" />
                <asp:PostBackTrigger ControlID="btnReg" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>