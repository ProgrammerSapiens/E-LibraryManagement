<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userLogin.aspx.cs" Inherits="E_LibraryManagement.userLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            overflow: hidden;
        }
    </style>
    <link href="css/customStyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" style="background-image: url(../Source/imgs/background.jpg); background-size: cover; height: 100vh;">
        <div class="container">
            <div class="row">
                <div class="col-md-4 mx-auto" style="margin-top: 18vh;">

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
                                    <label>Username</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="txtUserUsername" runat="server" placeholder="Username" />
                                    </div>

                                    <label>Password</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="txtUserPassword" runat="server" TextMode="Password" placeholder="Password" />
                                    </div>

                                    <div class="form-group">
                                        <asp:Button class="btn btn-success btn-lg" ID="btnUserLogin" runat="server" Text="Login" Style="width: 100%" OnClick="btnUserLogin_Click" />
                                    </div>

                                    <div class="form-group">
                                        <asp:Button class="btn btn-primary btn-lg" ID="btnSignUp" runat="server" Text="Sign Up" Style="width: 100%" OnClick="btnSignUp_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

</asp:Content>
