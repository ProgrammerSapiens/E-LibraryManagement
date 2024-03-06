<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="publisherManagement.aspx.cs" Inherits="E_LibraryManagement.publisherManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top: 200px;">
    <div class="row">
        <div class="col-md-5">

            <div class="card">
                <div class="card-body">

                    <div class="row">
                        <div class="col">
                            <center>
                                <h4>Publisher Details</h4>
                            </center>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <center>
                                <img src="Source/imgs/publisher.png" width="100px" />
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
                        <div class="col-md-4">
                            <label>Publisher ID</label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="ID" />
                                    <asp:Button class="btn btn-secondary" ID="Button4" runat="server" Text="Go" />
                                </div>
                            </div>
                        </div>

                        <div class="col-md-8">
                            <label>Publisher Name</label>
                            <div class="form-group">
                                <asp:TextBox class="form-control" ID="TextBox4" runat="server" placeholder="Publisher Name" />
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-4">
                            <center>
                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-lg" ID="Button1" runat="server" Text="Add" Style="width: 100%" />
                                </div>
                            </center>
                        </div>

                        <div class="col-4">
                            <center>
                                <div class="form-group">
                                    <asp:Button class="btn btn-primary btn-lg" ID="Button2" runat="server" Text="Update" Style="width: 100%" />
                                </div>
                            </center>
                        </div>

                        <div class="col-4">
                            <center>
                                <div class="form-group">
                                    <asp:Button class="btn btn-danger btn-lg" ID="Button3" runat="server" Text="Delete" Style="width: 100%" />
                                </div>
                            </center>
                        </div>
                    </div>
                </div>

            </div>

            <a href="homepage.aspx"><< Back to Home</a>
        </div>

        <div class="col-md-7">
            <div class="card">
                <div class="card-body">

                    <div class="row">
                        <div class="col">
                            <center>
                                <h4>Publisher List</h4>
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
</asp:Content>
