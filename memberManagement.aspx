<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="memberManagement.aspx.cs" Inherits="E_LibraryManagement.memberManagement" %>

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
                <div class="col-md-5" style="margin-top: 10vh;">

                    <div class="card text-white bg-dark">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Member Details</h4>
                                    </center>
                                </div>
                            </div>

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
                                        <hr>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3">
                                    <label>Member ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Member ID" />
                                            <asp:Button class="btn btn-secondary" ID="Button4" runat="server" Text="Go" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Full Name</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox4" runat="server" placeholder="Full Name" ReadOnly="true" />
                                    </div>
                                </div>

                                <div class="col-md-5">
                                    <label>Account Status</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Account Status" ReadOnly="true" />
                                            <asp:LinkButton class="btn btn-success" ID="LinkButton1" runat="server" Text="S"><i class="fa-regular fa-circle-check"></i></asp:LinkButton>
                                            <asp:LinkButton class="btn btn-warning" ID="LinkButton2" runat="server" Text="P"><i class="fa-regular fa-circle-pause"></i></asp:LinkButton>
                                            <asp:LinkButton class="btn btn-danger" ID="LinkButton3" runat="server" Text="D"><i class="fa-regular fa-circle-xmark"></i></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3">
                                    <label>DOB</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox1" runat="server" placeholder="DOB" ReadOnly="true" TextMode="Date" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Contact Number</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox2" runat="server" placeholder="Contact Number" ReadOnly="true" TextMode="Phone" />
                                    </div>
                                </div>

                                <div class="col-md-5">
                                    <label>Email ID</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="Email ID" ReadOnly="true" TextMode="Email" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <label>State</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox5" runat="server" placeholder="State" ReadOnly="true" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>City</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox6" runat="server" placeholder="City" ReadOnly="true" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Pin Code</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox9" runat="server" placeholder="Pin Code" TextMode="Number" ReadOnly="true" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <label>Full Postal Adress</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox10" runat="server" placeholder="Full Postal Adress" ReadOnly="true" TextMode="MultiLine" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    <center>
                                        <div class="form-group">
                                            <asp:Button class="btn btn-danger btn-lg" ID="Button3" runat="server" Text="Delete User Permanently" Style="width: 100%" />
                                        </div>
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-7" style="margin-top: 10vh;">
                    <div class="card text-white bg-dark">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Member List</h4>
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
