<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="publisherManagement.aspx.cs" Inherits="E_LibraryManagement.publisherManagement" %>

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

                    <div class="card text-white bg-dark">
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
                                            <asp:TextBox CssClass="form-control" ID="txtPublisherId" runat="server" placeholder="ID" />
                                            <asp:Button class="btn btn-secondary" ID="btnGoToPublisherId" runat="server" Text="Go" OnClick="btnGoToPublisherId_Click" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-8">
                                    <label>Publisher Name</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="txtPublisherName" runat="server" placeholder="Publisher Name" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-4">
                                    <center>
                                        <div class="form-group">
                                            <asp:Button class="btn btn-success btn-lg" ID="btnAddPublisher" runat="server" Text="Add" Style="width: 100%" OnClick="btnAddPublisher_Click" />
                                        </div>
                                    </center>
                                </div>

                                <div class="col-4">
                                    <center>
                                        <div class="form-group">
                                            <asp:Button class="btn btn-primary btn-lg" ID="btnUpdatePublisher" runat="server" Text="Update" Style="width: 100%" OnClick="btnUpdatePublisher_Click" />
                                        </div>
                                    </center>
                                </div>

                                <div class="col-4">
                                    <center>
                                        <div class="form-group">
                                            <asp:Button class="btn btn-danger btn-lg" ID="btnDeletePublisher" runat="server" Text="Delete" Style="width: 100%" OnClick="btnDeletePublisher_Click" />
                                        </div>
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-7" style="margin-top: 5vh;">
                    <div class="card text-white bg-dark">
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
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="txtSearch" runat="server" placeholder="Search..."></asp:TextBox>
                                            <asp:Button CssClass="btn btn-primary" ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div style="overflow-y: auto; max-height: 60vh;">
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elbraryDBConnectionString %>" ProviderName="<%$ ConnectionStrings:elbraryDBConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [publisher_master_tbl]"></asp:SqlDataSource>
                                        <asp:GridView class="table table-striped table-bordered table-dark" ID="grdPublisherList" AutoGenerateColumns="False" DataKeyNames="publisher_id" runat="server" DataSourceID="SqlDataSource1">
                                            <Columns>
                                                <asp:BoundField DataField="publisher_id" HeaderText="Publisher Id" ReadOnly="True" SortExpression="publisher_id" />
                                                <asp:BoundField DataField="publisher_name" HeaderText="Publisher Name" SortExpression="publisher_name" />
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
