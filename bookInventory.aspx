<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="bookInventory.aspx.cs" Inherits="E_LibraryManagement.bookInventory" %>

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
                <div class="col-md-5" style="margin-top: 1vh;">

                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Book Details</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <img src="Source/imgs/books1.png" width="60px" />
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
                                    <center>
                                        <asp:FileUpload class="form-control" ID="FileUpload1" runat="server" />
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3">
                                    <label>Book ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Book ID" />
                                            <asp:Button class="btn btn-secondary" ID="Button4" runat="server" Text="Go" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-9">
                                    <label>Book Name</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox4" runat="server" placeholder="Book Name" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <label>Language</label>
                                    <div class="form-group">
                                        <asp:DropDownList class="form-control" ID="DropDownList1" runat="server" placeholder="Select">
                                            <asp:ListItem Text="English" Value="English" />
                                            <asp:ListItem Text="French" Value="French" />
                                            <asp:ListItem Text="Spanish" Value="Spanish" />
                                            <asp:ListItem Text="Russian" Value="Russian" />
                                            <asp:ListItem Text="Italian" Value="Italian" />
                                            <asp:ListItem Text="German" Value="German" />
                                            <asp:ListItem Text="Mandarin" Value="Mandarin" />
                                        </asp:DropDownList>
                                    </div>

                                    <label>Publisher Name</label>
                                    <div class="form-group">
                                        <asp:DropDownList class="form-control" ID="DropDownList2" runat="server" placeholder="Select">
                                            <asp:ListItem Text="Publisher 1" Value="Publisher 1" />
                                            <asp:ListItem Text="Publisher 2" Value="Publisher 2" />
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Author Name</label>
                                    <div class="form-group">
                                        <asp:DropDownList class="form-control" ID="DropDownList3" runat="server" placeholder="Select">
                                            <asp:ListItem Text="A1" Value="A1" />
                                            <asp:ListItem Text="A2" Value="A2" />
                                        </asp:DropDownList>
                                    </div>
                                    <label>Publish Date</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox1" runat="server" placeholder="Publish Date" TextMode="Date" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Genre</label>
                                    <div class="form-group">
                                        <asp:ListBox CssClass="form-control" ID="ListBox1" runat="server" SelectionMode="Multiple" Rows="5">
                                            <asp:ListItem Text="Action" Value="Action" />
                                            <asp:ListItem Text="Adventure" Value="Adventure" />
                                            <asp:ListItem Text="Comic Book" Value="Comic Book" />
                                            <asp:ListItem Text="Self Help" Value="Self Help" />
                                            <asp:ListItem Text="Motivation" Value="Motivation" />
                                            <asp:ListItem Text="Healthy" Value="Healthy" />
                                            <asp:ListItem Text="Crime" Value="Crime" />
                                            <asp:ListItem Text="Drama" Value="Drama" />
                                            <asp:ListItem Text="Fantasy" Value="Fantasy" />
                                            <asp:ListItem Text="Horror" Value="Horror" />
                                            <asp:ListItem Text="Poetry" Value="Poetry" />
                                            <asp:ListItem Text="Romance" Value="Romance" />
                                            <asp:ListItem Text="Autobiography" Value="Autobiography" />
                                        </asp:ListBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <label>Edition</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox5" runat="server" placeholder="Edition" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Book Cost(per unit)</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox6" runat="server" placeholder="Book Cost(per unit)" TextMode="Number" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Pages</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox9" runat="server" placeholder="Pages" TextMode="Number" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <label>Actual Stock</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox2" runat="server" placeholder="Actual Stock" TextMode="Number" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Current Stock</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox7" runat="server" placeholder="Current Stock" TextMode="Number" ReadOnly="true" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Issued Books</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="Issued Books" TextMode="Number" ReadOnly="true" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <label>Book Description</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox10" runat="server" placeholder="Book Description" TextMode="MultiLine" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-4">
                                    <center>
                                        <div class="form-group">
                                            <asp:Button class="btn btn-success btn-lg" ID="Button3" runat="server" Text="Add" Style="width: 100%" />
                                        </div>
                                    </center>
                                </div>

                                <div class="col-4">
                                    <center>
                                        <div class="form-group">
                                            <asp:Button class="btn btn-warning btn-lg" ID="Button1" runat="server" Text="Update" Style="width: 100%" />
                                        </div>
                                    </center>
                                </div>

                                <div class="col-4">
                                    <center>
                                        <div class="form-group">
                                            <asp:Button class="btn btn-danger btn-lg" ID="Button2" runat="server" Text="Delete" Style="width: 100%" />
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
                                        <h4>Book Inventory List</h4>
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
                                    <asp:GridView class="table table-striped table-bordered table-dark" ID="GridView1" runat="server"></asp:GridView>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>
</asp:Content>
