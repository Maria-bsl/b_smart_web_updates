<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashB.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.DashB" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        table[id*=gvDept] tr {
            cursor: pointer;
        }
    </style>

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
    <div>
      

        <ContentTemplate>

            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                    <li class="breadcrumb-item"></li>
                </ol>
            </nav>

            <div class="card">
                <div class="card-body">
                     <div class="row">
                         <div class="form-group col-md-6 row mx-0">
                                <video controls>
                                <source src="/Videos/Feestructure.mp4" type="video/mp4">
                                your browser doesn't support this video type

                            </video>
                          </div>
                         </div>
                    <div class="row">
                         <div class="form-group col-md-6 row mx-0">
                                <video controls>
                                <source src="/Videos/FeeAlloc.mp4" type="video/mp4">
                                your browser doesn't support this video type

                            </video>
                          </div>
                        </div>
                    <div class="row">
                         <div class="form-group col-md-6 row mx-0">
                                <video controls>
                                <source src="/Videos/InvoiceG.mp4" type="video/mp4">
                                your browser doesn't support this video type

                            </video>
                          </div>
                        </div>
                    <div class="row">
                         <div class="form-group col-md-6 row mx-0">
                                <video controls>
                                <source src="/Videos/PrintSMS.mp4" type="video/mp4">
                                your browser doesn't support this video type

                            </video>
                          </div>


                         </div>
                    </div>
            </div>
        </ContentTemplate>

    </div>
</asp:Content>