<%@ Page MaintainScrollPositionOnPostback="true" Language="C#" AutoEventWireup="true" CodeBehind="Facireg.aspx.cs" MasterPageFile="~/Head_Admin.Master" Inherits="PresentationLayer.Admin.Facireg" %>
<%@ MasterType VirtualPath="~/Head_Admin.master" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="Newtonsoft.Json" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            $('table[id*=Gridview1]>tbody>tr').click(function () {
                if ($(this).find(' input[type=radio]')[0]) {
                    $(this).find(' input[type=radio]')[0].click();
                }
            });

            $('table[id*=Gridview1]').prepend($("<thead></thead>").append($(this).find("tr:first")))
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
                                <label class="col-md-3 col-form-label pl-0">School Short Name</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtShort" MaxLength="3"
                                    ToolTip="Short Name:(ex:SCH)"></asp:TextBox>
                                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1"
                                    CssClass="red_new offset-md-3" ValidationExpression="^[A-Za-z]+$"
                                    ControlToValidate="txtShort" Display="Dynamic"
                                    ErrorMessage="Please enter valid short name">
                                </asp:RegularExpressionValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblCompany">School
                                    Name <span class="red_new">*</span></asp:Label>
                                <asp:DropDownList CssClass="form-control" runat="server" Visible="false" ID="ddlFaci">
                                </asp:DropDownList>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtFaci" MaxLength="200" AutoPostBack="true" OnTextChanged="txtFaci_TextChanged">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCPN" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtFaci" Display="Dynamic"
                                    ErrorMessage="Please enter School name"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblCPN">Branch
                                    Name<span class="red_new">*</span></asp:Label>
                                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlBranch">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvBranch" CssClass="red_new offset-md-3"
                                    ControlToValidate="ddlBranch" Display="Dynamic"
                                    ErrorMessage="Please select branch name"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label4">
                                    Institution ID <span class="red_new">*</span></asp:Label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtIns" MaxLength="200">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvIns" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtIns" Display="Dynamic"
                                    ErrorMessage="Please enter institution id"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblCaptcha">School
                                    Reg. No.<span class="red_new">*</span></asp:Label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtRegNo" MaxLength="100">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4"
                                    CssClass="red_new offset-md-3" ControlToValidate="txtRegNo" Display="Dynamic"
                                    ErrorMessage="Please enter registration no."></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label7">Authorized
                                    User<span class="red_new">*</span></asp:Label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtName" MaxLength="100">
                                </asp:TextBox>
                                <small class="form-text text-muted offset-md-3">(Enter Full Name)</small>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2"
                                    CssClass="red_new offset-md-3" ControlToValidate="txtName" Display="Dynamic"
                                    ErrorMessage="Please enter name"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblEmail">Email
                                    Address<span class="red_new">*</span></asp:Label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtEmail" MaxLength="200">
                                </asp:TextBox>
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
                                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlCountry">
                                </asp:DropDownList>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblDesig">Region
                                </asp:Label>
                                <asp:DropDownList ViewStateMode="Enabled" EnableViewState="true" CssClass="form-control" runat="server" ID="ddlRegion"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlRegion_SelectedIndexChanged">
                                </asp:DropDownList>
                                <%-- <asp:UpdatePanel ID="ddlUpdatePanel" UpdateMode="Conditional" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList CssClass="form-control" runat="server" ID="ddlRegion"
                                            AutoPostBack="true" OnSelectedIndexChanged="ddlRegion_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel> --%>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblCity">District
                                </asp:Label>
                                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlDistrict"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblPostal">Ward
                                </asp:Label>
                                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlWard">
                                </asp:DropDownList>

                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label1">Address
                                </asp:Label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtAdd" MaxLength="400">
                                </asp:TextBox>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label2">Website
                                </asp:Label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtWeb" MaxLength="200">
                                </asp:TextBox>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label3">Phone No.
                                </asp:Label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtPhone" MaxLength="200">
                                </asp:TextBox>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblMobile">Mobile
                                    No. <span class="red_new">*</span></asp:Label>
                                <div class="input-group col-md-9 px-0">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="my-addon"><asp:Label runat="server" ID="lblISD"></asp:Label></span></div>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtWork" MaxLength="9"
                                    ToolTip="Mobile No:(ex:784777777)"></asp:TextBox>
                            </div>
                                <asp:RequiredFieldValidator runat="server" ID="rfvWork" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtWork" Display="Dynamic" ErrorMessage="Please enter mobile no">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ID="revWork"
                                    CssClass="red_new offset-md-3" ValidationExpression="^[0-9]{9}$"
                                    ControlToValidate="txtWork" Display="Dynamic"
                                    ErrorMessage="Please enter valid number"> </asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <hr>

                        <h5>
                            <asp:Label runat="server" ID="Label5">School Registration Account Details:</asp:Label>
                        </h5>


                        <div class="table-responsive mb-1">
                            <asp:gridview ID="Gridview1" runat="server" ShowFooter="false" Width="100%"
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
                                                CssClass="form-control" Width="275"></asp:TextBox>
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
                                    <asp:TemplateField ItemStyle-Width="1%">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false"
                                                onclick="LinkButton1_Click">Remove</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:gridview>
                        </div>

                        <div class="form-group d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="ButtonAdd" runat="server"
                                CausesValidation="false" Text="Add New Row" onclick="ButtonAdd_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnReg" runat="server"
                                Text="Register" OnClick="btnReg_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel" CausesValidation="false" OnClick="btnCancel_Click"
                                Text="Cancel" />
                        </div>
                    </div>
                    <div class="card-body">
                        <%
                            var rowCount = Gridview1.Rows.Count;
                            var items = new List<Dictionary<int, string>>();
                            for (int i = 0; i < rowCount; i++) {
                                var map = new Dictionary<int, string>();
                                for (int j = 0; j < Gridview1.HeaderRow.Cells.Count; j++) {
                                    var item = Gridview1.Rows[i].Cells[j];
                                    if (j == 1) {
                                        var txtValidity = (TextBox)item.FindControl("txtValidity");
                                        map[j] = txtValidity.ClientID;
                                    }
                                    else if (j == 2) {
                                       var ddlCur = (DropDownList)item.FindControl("ddlCur");
                                       map[j] = ddlCur.ClientID; 
                                    }
                                    else if (j == 3) {
                                        var linkButton = (LinkButton)item.FindControl("LinkButton1");
                                        map[j] = linkButton.ClientID;
                                    }
                                    else {
                                        map[j] = item.ClientID;
                                    }
                                }
                                items.Add(map);
                            }
                        %>


                        <register-school-form
                            school-name-client-id=<%= txtFaci.ClientID %>
                            school-acronym-client-id=<%= txtShort.ClientID %>
                            school-reg-no-client-id=<%= txtRegNo.ClientID %>
                            institution-client-id=<%= txtIns.ClientID %>
                            authorized-user-client-id=<%= txtName.ClientID %>
                            branch-name-select-client-id=<%= ddlBranch.ClientID %>
                            email-address-client-id='<%= txtEmail.ClientID %>'
                            country-select-client-id='<%= ddlCountry.ClientID %>'
                            region-select-client-id='<%= ddlRegion.ClientID %>'
                            district-select-client-id=<%= ddlDistrict.ClientID %>
                            ward-select-client-id='<%= ddlWard.ClientID %>'
                            address-client-id='<%= txtAdd.ClientID %>'
                            website-client-id='<%= txtWeb.ClientID %>'
                            phone-number-client-id='<%= txtPhone.ClientID %>'
                            mobile-number-client-id='<%= txtWork.ClientID %>'
                            account-details-array='<%= JsonConvert.SerializeObject(items) %>'
                            add-new-row-button-client-id='<%= ButtonAdd.ClientID %>'
                            register-button-client-id='<%= btnReg.ClientID %>'
                            cancel-button-client-id='<%= btnCancel.ClientID %>'>
                        </register-school-form>

                        <script>
                            const el = document.querySelector('register-school-form');
                            console.log(el);
                            el.addEventListener('regionNotify',(e) => {
                                console.log(123)
                                //__doPostBack('<%= ddlRegion.UniqueID %>', '');
                            });
                        </script>

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