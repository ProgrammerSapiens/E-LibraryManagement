<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userLogin.aspx.cs" Inherits="E_LibraryManagement.userLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top: 120px;">
        <div class="row">
            <div class="col-md-4 mx-auto">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="Source/imgs/generaluser.png" width="100px" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Member Login</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <hr>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Member ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" />
                                </div>

                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" TextMode="Password" />
                                </div>

                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-lg" ID="Button1" runat="server" Text="Login" Style="width: 100%" />
                                </div>

                                <div class="form-group">
                                    <asp:Button class="btn btn-primary btn-lg" ID="Button2" runat="server" Text="Sign Up" Style="width: 100%" />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <a href="homepage.aspx"><< Back to Home</a>

            </div>
        </div>
    </div>

</asp:Content>
