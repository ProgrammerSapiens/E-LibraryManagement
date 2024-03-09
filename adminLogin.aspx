<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminLogin.aspx.cs" Inherits="E_LibraryManagement.adminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            overflow: hidden;
        }
    </style>
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
                                        <img src="Source/imgs/adminuser.png" width="110px" />
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h3>Admin Login</h3>
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
                                    <label>Email</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox1" runat="server" placeholder="Email" TextMode="Email" />
                                    </div>

                                    <label>Password</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password" />
                                    </div>

                                    <div class="form-group">
                                        <asp:Button class="btn btn-success btn-lg" ID="Button1" runat="server" Text="Login" Style="width: 100%" />
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
