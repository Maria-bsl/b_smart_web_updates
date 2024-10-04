<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" MasterPageFile="~/Login_New.Master" Inherits="Schools.Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <style>
    .main-area {
    display: flex;
    justify-content: center;
    align-items: center;
    }

    .main-area .auth-box {
      background: url(Images/nmb-dark.png);
      background-repeat: no-repeat;
      background-attachment: scroll;
      background-blend-mode: screen;
      background-size: contain;
      background-position: center;
      display: -webkit-box;
      display: -ms-flexbox;
      display: flex;
      -webkit-box-align: center;
      -ms-flex-align: center;
      align-items: center;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      justify-content: center;
      width: 100%;
      max-width: 48rem;
      height: 100%;
      max-height: 48rem;
  }

    .card-auth {
      background: rgba(255, 255, 255, .95);
    }

    .apk-box{
      height: auto;
      display: flex;
    }

    .apk-box a{
      margin: 0 auto;
      position: relative;
      width: 100%;
      text-align: center;
    }

    .hidden {
      display: none
    }
   
  </style>

 <div class="relative">
        <div class="container-fluid relative">
          <div class="row">
            <div class="app-main d-flex flex-column p-0">
              <div class="main-area">
                <div class="auth-box">
                  <div class="card card-auth">
                    <div class="card-body">
                      <div class="corp-logo">
                        <img src="Images/logo.png" alt="">
                      </div>
                      <h5 class="card-title text-center text-normal mb-2"> B-Smart Academia</h5>
                      <hr class="mt-0">
                      <div class="row d-none"> 
                        <div class="form-group col-12 mb-1">
                          <asp:Label CssClass="font-w500" ID="lblUName" runat="server">Username
                          </asp:Label>
                          <asp:TextBox CssClass="form-control" runat="server" ID="txtEmail" />
                          <asp:RequiredFieldValidator ID="rfvUName" runat="server" ControlToValidate="txtEmail"
                            CssClass="red_new" Display="Dynamic" ErrorMessage="The username field is required." />
                        </div>
                        <div class="form-group col-12">
                          <asp:Label CssClass="font-w500" ID="lblPwd" runat="server">Password
                          </asp:Label>
                          <asp:TextBox CssClass="form-control" runat="server" ID="txtPwd" TextMode="Password" />
                          <asp:RequiredFieldValidator ID="rfvPwd" runat="server" ControlToValidate="txtPwd"
                            CssClass="red_new" Display="Dynamic" ErrorMessage="The password field is required." />
                        </div>
                        <div class="form-group col-12 d-flex justify-content-between mb-0">
                          <div class="text-muted font-w500">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                            <asp:HyperLink CssClass="text-muted" ID="ForgotPassword" runat="server"
                              NavigateUrl="Public/ForgotPassword.aspx">I
                              forgot my password</asp:HyperLink><br />
                              <asp:HyperLink CssClass="text-muted" ID="HyperLink1" runat="server" NavigateUrl="Public/PReg.aspx">Admission</asp:HyperLink>
                          </div>
                          <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnLogin" CausesValidation="true"
                            runat="server" Text="Log in" OnClick="Login_Click" />
                        </div>
                      </div>
                      <div class="py-2">
                          <app-login-page 
                          admission-link-client-id='<%= HyperLink1.ClientID %>' 
                          forgot-password-client-id='<%= ForgotPassword.ClientID %>' 
                          password-input-client-id='<%= txtPwd.ClientID %>' 
                          username-input-client-id='<%= txtEmail.ClientID %>' 
                          login-button-client-id='<%= btnLogin.ClientID %>'>
                          </app-login-page>
                      </div>
                      <hr>

                      <div class="apk-box py-2">
                        <a class="small text-muted" href="#"><i class="fas fa-mobile-alt"></i> Download Mobile App (For Parents)</a>
                      </div>
                      <hr>
                      <p class="small mb-0 text-center">Powered by</p>
                      <p class="medium mb-0 text-center">
                        <a class="text-muted font-w500" target="_blank" href="http://bizlogicsolutions.com/">Biz-Logic Solutions Ltd.</a>
                      </p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="footer px-2">
                <p class="mb-0 small"><asp:Label runat="server" ID="lblBSA"></asp:Label></p>
              </div>
            </div>
          </div>

        </div>
  </div>
</asp:Content>