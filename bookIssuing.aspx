<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="bookIssuing.aspx.cs" Inherits="E_LibraryManagement.bookIssuing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            overflow: hidden;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid backgroundImage">
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
                                        <asp:TextBox class="form-control" ID="txtMemberId" runat="server" placeholder="Member ID" />
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Book ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="txtBookId" runat="server" placeholder="Book ID" />
                                            <asp:Button class="btn btn-dark" ID="btnGoToBookId" runat="server" Text="Go" OnClick="btnGoToBookId_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Member Name</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control readOnly" ID="txtMemberName" runat="server" placeholder="Member Name" ReadOnly="true" />
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Book Name</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control readOnly" ID="txtBookName" runat="server" placeholder="Book Name" ReadOnly="true" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Start Date</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="txtStartDate" runat="server" placeholder="Start Date" TextMode="Date" />
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>End Date</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="txtEndDate" runat="server" placeholder="End Date" TextMode="Date" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-6">
                                    <center>
                                        <div class="form-group">
                                            <asp:Button class="btn btn-primary btn-lg" ID="btnIssue" runat="server" Text="Issue" Style="width: 100%" OnClick="btnIssue_Click" />
                                        </div>
                                    </center>
                                </div>

                                <div class="col-6">
                                    <center>
                                        <div class="form-group">
                                            <asp:Button class="btn btn-success btn-lg" ID="btnReturn" runat="server" Text="Return" Style="width: 100%" OnClick="btnReturn_Click" />
                                        </div>
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-7" style="margin-top: 1vh;">
                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Issued Books List</h4>
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
                                    <center>
                                        <hr>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div style="overflow-y: auto; max-height: 69vh;">
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elbraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_issue_tbl]"></asp:SqlDataSource>
                                        <asp:GridView class="table table-striped table-bordered table-dark" ID="grdIssuedBooksList" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" OnRowDataBound="grdIssuedBooksList_RowDataBound">
                                            <Columns>
                                                <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id" />
                                                <asp:BoundField DataField="member_name" HeaderText="Member Name" SortExpression="member_name" />
                                                <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id" />
                                                <asp:BoundField DataField="book_name" HeaderText="Book Name" SortExpression="book_name" />
                                                <asp:BoundField DataField="issue_date" HeaderText="Issue Date" SortExpression="issue_date" />
                                                <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date" />
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
