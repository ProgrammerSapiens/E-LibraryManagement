<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="bookInventory.aspx.cs" Inherits="E_LibraryManagement.bookInventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            overflow: hidden;
        }
    </style>
    <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
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
                                        <img id="imgview" src="book_inventory/books1.png" width="70px" />
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
                                        <asp:FileUpload class="form-control" ID="updBookImage" runat="server" onchange="readURL(this);" />
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3">
                                    <label>Book ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="txtBookId" runat="server" placeholder="Book ID" />
                                            <asp:Button class="btn btn-secondary" ID="btnGoToBookId" runat="server" Text="Go" OnClick="btnGoToBookId_Click" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-9">
                                    <label>Book Name</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="txtBookName" runat="server" placeholder="Book Name" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <label>Language</label>
                                    <div class="form-group">
                                        <asp:DropDownList class="form-control" ID="dlLanguage" runat="server" placeholder="Select">
                                            <asp:ListItem Text="Select" Value="Select" />
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
                                        <asp:DropDownList class="form-control" ID="dlPublisherName" runat="server" placeholder="Select" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Author Name</label>
                                    <div class="form-group">
                                        <asp:DropDownList class="form-control" ID="dlAuthorName" runat="server" placeholder="Select" />
                                    </div>
                                    <label>Publish Date</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="txtPublishDate" runat="server" placeholder="Publish Date" TextMode="Date" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Genre</label>
                                    <div class="form-group">
                                        <asp:ListBox CssClass="form-control" ID="lbGenre" runat="server" SelectionMode="Multiple" Rows="5">
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
                                        <asp:TextBox class="form-control" ID="txtEdition" runat="server" placeholder="Edition" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Book Cost(per unit)</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="txtBookCost" runat="server" placeholder="Book Cost(per unit)" TextMode="Number" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Pages</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="txtPages" runat="server" placeholder="Pages" TextMode="Number" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <label>Actual Stock</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="txtActualStock" runat="server" placeholder="Actual Stock" TextMode="Number" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Current Stock</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control readOnly" ID="txtCurrentStock" runat="server" placeholder="Current Stock" TextMode="Number" ReadOnly="true" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Issued Books</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control readOnly" ID="txtIssuedBooks" runat="server" placeholder="Issued Books" TextMode="Number" ReadOnly="true" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <label>Book Description</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="txtBookDescription" runat="server" placeholder="Book Description" TextMode="MultiLine" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-4">
                                    <center>
                                        <div class="form-group">
                                            <asp:Button class="btn btn-success btn-lg" ID="btnAddBook" runat="server" Text="Add" Style="width: 100%" OnClick="btnAddBook_Click" />
                                        </div>
                                    </center>
                                </div>

                                <div class="col-4">
                                    <center>
                                        <div class="form-group">
                                            <asp:Button class="btn btn-warning btn-lg" ID="btnUpdateBook" runat="server" Text="Update" Style="width: 100%" OnClick="btnUpdateBook_Click" />
                                        </div>
                                    </center>
                                </div>

                                <div class="col-4">
                                    <center>
                                        <div class="form-group">
                                            <asp:Button class="btn btn-danger btn-lg" ID="btnDeleteBook" runat="server" Text="Delete" Style="width: 100%" OnClick="btnDeleteBook_Click" />
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
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elbraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
                                        <asp:GridView class="table table-striped table-bordered table-dark" ID="grdBookInventoryList" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1" Font-Bold="True">
                                            <Columns>
                                                <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="True" SortExpression="book_id" />
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <div class="container-fluid">
                                                            <div class="row">
                                                                <div class="col-lg-10">
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            <asp:Label ID="label1" runat="server" Text='<%# Eval("book_name") %>' Font-Bold="true" Font-Size="X-Large" />
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            Author -
                                                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("author_name") %>'></asp:Label>
                                                                            &nbsp;| Genre -
                                                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("genre") %>'></asp:Label>
                                                                            &nbsp;| Language -
                                                                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("language") %>'></asp:Label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            Publisher -
                                                                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("publisher_name") %>'></asp:Label>
                                                                            &nbsp;| Publish Date -
                                                                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("publish_date") %>'></asp:Label>
                                                                            &nbsp;| Pages -
                                                                        <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("no_of_pages") %>'></asp:Label>
                                                                            &nbsp;| Edition -
                                                                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("edition") %>'></asp:Label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            Cost -
                                                                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("book_cost") %>'></asp:Label>
                                                                            &nbsp;| Actual Stock -
                                                                        <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("actual_stock") %>'></asp:Label>
                                                                            &nbsp;| Available -
                                                                        <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("current_stock") %>'></asp:Label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            <asp:Label ID="Label12" runat="server" Font-Bold="True" Text='<%# Eval("book_description") %>' Font-Size="Smaller"></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-2">
                                                                    <asp:Image class="img-fluid p-2" ID="Image" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
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
