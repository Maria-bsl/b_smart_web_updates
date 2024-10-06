<%@ Page MaintainScrollPositionOnPostback="true" Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" MasterPageFile="~/Head_Public.Master" Inherits="PresentationLayer.Permit.ForgotPassword" %>
<%@ MasterType VirtualPath="~/Head_Public.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="upRegistration" runat="server">
            <ContentTemplate>
                <!-- <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="/H0Pijr">Home</a></li>
                        <li class="breadcrumb-item">Forgot Password</li>
                    </ol>
                </nav> -->
                <div class="card card-650">
                    <div class="card-body">
                        <%-- <div class="title-head d-flex justify-content-between w-100">
                            <div class="d-flex">
                                <img style="width: 170px; height: 80px" src="../Images/nmb-light.png" alt="">
                                <img style="width: 170px; height: 80px" src="../Images/logo.png" alt="">
                            </div>
                            <h5 class="card-title text-normal mb-2">Forgot your Password?
                            <span class="d-block card-title-span font-weight-normal">Use the form below to recover it.</span></h5>
                        </div> --%>
                        <div class="d-flex justify-content-between align-items-center">
                            <ul class="d-flex">
                                <li>
                                    <img style="width: 170px; height: 80px" src="../Images/nmb-light.png" alt="">
                                </li>
                                <li>
                                    <img style="width: 170px; height: 80px" src="../Images/logo.png" alt="">
                                </li>
                            </ul>
                            <div>
                                <h1 class="font-weight-bold">
                                    Forgot your Password?
                                </h1>
                                <p>
                                    Use the form below to recover it.
                                </p>
                            </div>
                        </div>
                        <hr class="mt-2">
                        
                        <forgot-password-form
                            username-client-id='<%= txtEmail.ClientID %>'
                            question-client-id='<%= ddlSecret.ClientID %>'
                            answer-client-id='<%= txtAns.ClientID %>'
                            capcha-text-client-id='<%= txtCaptcha.ClientID %>'
                            capcha-image-client-id='<%= imgCaptcha.ClientID %>'
                            capcha-button-client-id='<%= imgCaptcha1.ClientID %>'
                            back-to-login-link-client-id='<%= ForgotPassword.ClientID %>'
                            submit-form-button-client-id='<%= btnReg.ClientID %>'
                            invalid-capcha-client-id='<%= cvCaptcha.ClientID %>'>
                        </forgot-password-form>

                        <div class="row d-none">
                            <div class="form-group col-sm-12 col-md-11 row mx-0 format-210">
                                <label class="col-sm-3 col-form-label pl-0">Email Address/User Name<span
                                        class="red_new">*</span></label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtEmail"
                                    MaxLength="200">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvEmail" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtEmail" Display="Dynamic"
                                    ErrorMessage="Please enter email/user"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-12 col-md-11 row mx-0 format-210">
                                <label class="col-sm-3 col-form-label pl-0">Secret Question<span
                                        class="red_new">*</span></label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSecret">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCurrent"
                                    CssClass="red_new offset-md-3" ControlToValidate="ddlSecret" Display="Dynamic"
                                    ErrorMessage="Please select question"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-12 col-md-11 row mx-0 format-210">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label1">Answer
                                    <span class="red_new">*</span>
                                </asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtAns"
                                    TextMode="Password" MaxLength="490">
                                </asp:TextBox>
                                </asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvAns" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtAns" Display="Dynamic" ErrorMessage="Please enter answer">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-12 col-md-11 row mx-0 format-210">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label8">Enter
                                    Below Code<span class="red_new">*</span></asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtCaptcha"
                                    MaxLength="200">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCaptcha"
                                    CssClass="red_new offset-md-3" ControlToValidate="txtCaptcha" Display="Dynamic"
                                    ErrorMessage="Please enter captcha code"></asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="cvCaptcha" runat="server" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtCaptcha"
                                    ErrorMessage="Please enter valid captcha code, try again." Display="Dynamic"
                                    OnServerValidate="cvCaptcha_ServerValidate">
                                </asp:CustomValidator>
                            </div>
                            <div class="col-12"></div>
                            <div class="form-group col d-flex fix-210">
                                <asp:Image CssClass="fix-captcha" ID="imgCaptcha" runat="server" />
                                <%-- <asp:ImageButton CssClass="input-group-text fix-btn ml-1" runat="server"
                                    ImageUrl="~/images/refresh.png" CausesValidation="false" ID="imgCaptcha1"
                                    OnClick="imgCaptcha1_Click" /> --%>
                                    <asp:UpdatePanel>
                                        <asp:ContentTemplate>
                                            <asp:ImageButton CssClass="input-group-text fix-btn ml-1" runat="server"
                                                ImageUrl="~/images/refresh.png" CausesValidation="false" ID="imgCaptcha1"
                                                OnClick="imgCaptcha1_Click" />
                                        <asp:ContentTemplate>
                                    </asp:UpdatePanel>
                            </div>
                            <div class="col-12"></div>
                            <div class="form-group col-12 d-flex justify-content-between mb-0">
                                <div class="text-muted font-w500 fix-210">
                                    <i class="fas fa-chevron-circle-left"></i>
                                    <asp:HyperLink CssClass="text-muted" ID="ForgotPassword" runat="server"
                                        NavigateUrl="../Default.aspx">I have my password</asp:HyperLink>
                                </div>
                                <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnReg" runat="server" Text="Submit"
                                    OnClick="btnReg_Click" />
                            </div>
                        </div>
                    </div>

                    <%-- <div class="card-body">
                        <app-forgot-password-form
                            username-client-id='<%= txtEmail.ClientID %>'
                            question-client-id='<%= ddlSecret.ClientID %>'
                            answer-client-id='<%= txtAns.ClientID %>'
                            capcha-text-client-id='<%= txtCaptcha.ClientID %>'
                            capcha-image-client-id='<%= imgCaptcha.ClientID %>'
                            capcha-button-client-id='<%= imgCaptcha1.ClientID %>'
                            back-to-login-link-client-id='<%= ForgotPassword.ClientID %>'
                            submit-form-button-client-id='<%= btnReg.ClientID %>'
                            invalid-capcha-client-id='<%= cvCaptcha.ClientID %>'>
                        </app-forgot-password-form>
                    </div> --%>


                </div>

            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnReg" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>