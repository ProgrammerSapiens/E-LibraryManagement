<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userSignUp.aspx.cs" Inherits="E_LibraryManagement.SignUp" %>

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
                <div class="col-md-6 mx-auto" style="margin-top: 5vh">

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
                                        <h4>Member Sign Up</h4>
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
                                        <asp:TextBox CssClass="form-control" ID="txtFullName" runat="server" placeholder="Full Name" />
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Date of Birth</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="txtDateOfBirth" runat="server" placeholder="Date of Birth" TextMode="Date" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Contact Number</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="txtContactNumber" runat="server" placeholder="Contact Number" TextMode="Number" />
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Email</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" placeholder="Email" TextMode="Email" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <label>State</label>
                                    <div class="form-group">
                                        <asp:DropDownList class="form-control" ID="dlState" runat="server">
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
                                        <asp:TextBox class="form-control" ID="txtCity" runat="server" placeholder="City" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Pincode</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="txtPincode" runat="server" placeholder="Pincode" TextMode="Number" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label>Full Adress</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="txtFullAdress" runat="server" placeholder="FullAdress" TextMode="Multiline" Rows="2" />
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
                                <div class="col-md-6">
                                    <label>Login</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="txtLogin" runat="server" placeholder="Login" />
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Password</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="txtPassword" runat="server" placeholder="Password" TextMode="Password" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <asp:Button class="btn btn-success btn-lg" ID="btnSignUp" runat="server" Text="Sign Up" Style="width: 100%" OnClick="btnSignUp_Click" />
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
