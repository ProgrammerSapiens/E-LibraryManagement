<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userProfile.aspx.cs" Inherits="E_LibraryManagement.userProfile" %>

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
                <div class="col-md-5" style="margin-top: 4vh;">

                    <div class="card text-white bg-dark">
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
                                        <h4>Your Profile</h4>
                                        <span>Account Status - </span>
                                        <asp:Label class="badge rounded-pill text-bg-info" ID="Label1" runat="server" Text="Your Status" />
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
                                    <label>Full Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Full Name" />
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Date of Birth</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Date of Birth" TextMode="Date" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Contact Number</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Contact Number" TextMode="Number" />
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Email</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Email" TextMode="Email" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <label>State</label>
                                    <div class="form-group">
                                        <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                            <asp:ListItem Text="Alabama" Value="Alabama" />
                                            <asp:ListItem Text="Alaska" Value="Alaska" />
                                            <asp:ListItem Text="Arizona" Value="Arizona" />
                                            <asp:ListItem Text="Arkansas" Value="rkansas" />
                                            <asp:ListItem Text="California" Value="California" />
                                            <asp:ListItem Text="Colorado" Value="Colorado" />
                                            <asp:ListItem Text="Connecricut" Value="Connecricut" />
                                            <asp:ListItem Text="Delaware" Value="Delaware" />
                                            <asp:ListItem Text="Florida" Value="Florida" />
                                            <asp:ListItem Text="Georgia" Value="Georgia" />
                                            <asp:ListItem Text="Hawaii" Value="Hawaii" />
                                            <asp:ListItem Text="Idaho" Value="Idaho" />
                                            <asp:ListItem Text="Illinois" Value="Illinois" />
                                            <asp:ListItem Text="Indiana" Value="Indiana" />
                                            <asp:ListItem Text="Iowa" Value="Iowa" />
                                            <asp:ListItem Text="Kansas" Value="Kansas" />
                                            <asp:ListItem Text="Kentucky" Value="Kentucky" />
                                            <asp:ListItem Text="Louisiana" Value="Louisiana" />
                                            <asp:ListItem Text="Maine" Value="Maine" />
                                            <asp:ListItem Text="Maryland" Value="Maryland" />
                                            <asp:ListItem Text="Massachusetts" Value="Massachusetts" />
                                            <asp:ListItem Text="Michigan" Value="Michigan" />
                                            <asp:ListItem Text="Minnesota" Value="Minnesota" />
                                            <asp:ListItem Text="Mississippi" Value="Mississippi" />
                                            <asp:ListItem Text="Missouri" Value="Missouri" />
                                            <asp:ListItem Text="Montana" Value="Montana" />
                                            <asp:ListItem Text="Nebraska" Value="Nebraska" />
                                            <asp:ListItem Text="Nevada" Value="Nevada" />
                                            <asp:ListItem Text="New Hampshire" Value="New Hampshire" />
                                            <asp:ListItem Text="New Jersey" Value="New Jersey" />
                                            <asp:ListItem Text="New Mexico" Value="New Mexico" />
                                            <asp:ListItem Text="New York" Value="New York" />
                                            <asp:ListItem Text="North Carolina" Value="North Carolina" />
                                            <asp:ListItem Text="North Dakota" Value="North Dakota" />
                                            <asp:ListItem Text="Ohio" Value="Ohio" />
                                            <asp:ListItem Text="Oklahoma" Value="Oklahoma" />
                                            <asp:ListItem Text="Oregon" Value="Oregon" />
                                            <asp:ListItem Text="Pennsylvania" Value="Pennsylvania" />
                                            <asp:ListItem Text="Rhode Island" Value="Rhode Island" />
                                            <asp:ListItem Text="South Carolina" Value="South Carolina" />
                                            <asp:ListItem Text="South Dakota" Value="South Dakota" />
                                            <asp:ListItem Text="Tennessee" Value="Tennessee" />
                                            <asp:ListItem Text="Texas" Value="Texas" />
                                            <asp:ListItem Text="Utah" Value="Utah" />
                                            <asp:ListItem Text="Vermont" Value="Vermont" />
                                            <asp:ListItem Text="Washington" Value="Washington" />
                                            <asp:ListItem Text="West Virginia" Value="West Virginia" />
                                            <asp:ListItem Text="Wisconsin" Value="Wisconsin" />
                                            <asp:ListItem Text="Wyoming" Value="Wyoming" />
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>City</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox6" runat="server" placeholder="City" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Pincode</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox7" runat="server" placeholder="Pincode" TextMode="Number" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label>Full Adress</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="FullAdress" TextMode="Multiline" Rows="2" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <center>
                                    <div class="col">
                                        <span class="badge rounded-pill text-bg-primary">Login Credentials</span>
                                    </div>
                                </center>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <label>Login</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="Login" ReadOnly="true" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Old Password</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox9" runat="server" placeholder="Old Password" TextMode="Password" ReadOnly="true" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>New Password</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox10" runat="server" placeholder="New Password" TextMode="Password" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-8 mx-auto">
                                    <center>
                                        <div class="form-group">
                                            <asp:Button class="btn btn-primary btn-lg" ID="Button1" runat="server" Text="Update" Style="width: 100%" />
                                        </div>
                                    </center>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-md-7" style="margin-top: 4vh;">
                    <div class="card text-white bg-dark">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <img src="Source/imgs/books1.png" width="100px" />
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Your Issued Books</h4>
                                        <asp:Label class="badge rounded-pill text-bg-info" ID="Label2" runat="server" Text="Your books info" />
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
