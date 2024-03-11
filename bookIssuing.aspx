<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="bookIssuing.aspx.cs" Inherits="E_LibraryManagement.bookIssuing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            overflow: hidden;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid" style="background-image: url(../Source/imgs/background.jpg); background-size: cover; height: 100vh;">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-5" style="margin-top: 20vh;">

                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Book Issuing</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <img src="Source/imgs/books.png" width="100px" />
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
                                <div class="col-md-6">
                                    <label>Member ID</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox4" runat="server" placeholder="Member ID" />
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Book ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Book ID" />
                                            <asp:Button class="btn btn-secondary" ID="Button4" runat="server" Text="Go" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Member Name</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox1" runat="server" placeholder="Member Name" ReadOnly="true" />
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Book Name</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox2" runat="server" placeholder="Book Name" ReadOnly="true" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Start Date</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox5" runat="server" placeholder="Start Date" TextMode="Date" />
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>End Date</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox6" runat="server" placeholder="End Date" TextMode="Date" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-6">
                                    <center>
                                        <div class="form-group">
                                            <asp:Button class="btn btn-primary btn-lg" ID="Button1" runat="server" Text="Issue" Style="width: 100%" />
                                        </div>
                                    </center>
                                </div>

                                <div class="col-6">
                                    <center>
                                        <div class="form-group">
                                            <asp:Button class="btn btn-success btn-lg" ID="Button3" runat="server" Text="Return" Style="width: 100%" />
                                        </div>
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-7" style="margin-top: 20vh;">
                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Issued Book List</h4>
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
                                    <asp:GridView class="table talbe-striped table-bordered" ID="GridView1" runat="server"></asp:GridView>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>

</asp:Content>
