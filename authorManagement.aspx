<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="authorManagement.aspx.cs" Inherits="E_LibraryManagement.authorManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            overflow: hidden;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid backgroundImage">
        <div class="container">
            <div class="row">
                <div class="col-md-5" style="margin-top: 20vh;">

                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Author Details</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <img src="Source/imgs/writer.png" width="100px" />
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
                                    <label>Author ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="txtAuthorId" runat="server" placeholder="ID" />
                                            <asp:Button CssClass="btn btn-secondary" ID="btnGoToAuthorId" runat="server" Text="Go" OnClick="btnGoToAuthorId_Click" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-8">
                                    <label>Author Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="txtAuthorName" runat="server" placeholder="Author Name" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-4">
                                    <center>
                                        <div class="form-group">
                                            <asp:Button CssClass="btn btn-success btn-lg" ID="btnAddAuthor" runat="server" Text="Add" Style="width: 100%" OnClick="btnAddAuthor_Click" />
                                        </div>
                                    </center>
                                </div>

                                <div class="col-4">
                                    <center>
                                        <div class="form-group">
                                            <asp:Button CssClass="btn btn-primary btn-lg" ID="btnUpdateAuthor" runat="server" Text="Update" Style="width: 100%" OnClick="btnUpdateAuthor_Click" />
                                        </div>
                                    </center>
                                </div>

                                <div class="col-4">
                                    <center>
                                        <div class="form-group">
                                            <asp:Button CssClass="btn btn-danger btn-lg" ID="btnDeleteAuthor" runat="server" Text="Delete" Style="width: 100%" OnClick="btnDeleteAuthor_Click" />
                                        </div>
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-7" style="margin-top: 5vh;">
                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Author List</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="txtSearch" runat="server" placeholder="Enter a name..."></asp:TextBox>
                                            <asp:Button CssClass="btn btn-primary" ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div style="overflow-y: auto; max-height: 62vh;">
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elbraryDBConnectionString %>" ProviderName="<%$ ConnectionStrings:elbraryDBConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [author_master_tbl]"></asp:SqlDataSource>
                                    <asp:GridView CssClass="table table-striped table-dark table-bordered table-hover" ID="grdAuthorList" runat="server" AutoGenerateColumns="False" DataKeyNames="author_id" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="author_id" HeaderText="Author Id" ReadOnly="True" SortExpression="author_id" />
                                            <asp:BoundField DataField="author_name" HeaderText="Author Name" SortExpression="author_name" />
                                        </Columns>
                                    </asp:GridView>
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
