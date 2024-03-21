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
                                            <asp:TextBox CssClass="form-control" ID="txtUserId" runat="server" placeholder="ID" />
                                            <asp:Button class="btn btn-secondary" ID="btnGoToUserId" runat="server" Text="Go" OnClick="btnGoToUserId_Click" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Full Name</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control readOnly" ID="txtUserName" runat="server" placeholder="Full Name" ReadOnly="true" />
                                    </div>
                                </div>

                                <div class="col-md-5">
                                    <label>Account Status</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control readOnly" ID="txtAccountStatus" runat="server" placeholder="Account Status" ReadOnly="true" />
                                            <asp:LinkButton class="btn btn-success" ID="lkbtnActiveStatus" runat="server" Text="S" OnClick="lkbtnActiveStatus_Click"><i class="fa-regular fa-circle-check"></i></asp:LinkButton>
                                            <asp:LinkButton class="btn btn-warning" ID="lkbtnPendingStatus" runat="server" Text="P" OnClick="lkbtnPendingStatus_Click"><i class="fa-regular fa-circle-pause"></i></asp:LinkButton>
                                            <asp:LinkButton class="btn btn-danger" ID="lkbtnDiactivateStatus" runat="server" Text="D" OnClick="lkbtnDiactivateStatus_Click"><i class="fa-regular fa-circle-xmark"></i></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3">
                                    <label>Date of birth</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control readOnly" ID="txtUserDateOfBirth" runat="server" placeholder="DOB" ReadOnly="true" TextMode="Date" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Contact Number</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control readOnly" ID="txtUserContactNumber" runat="server" placeholder="Contact Number" ReadOnly="true" TextMode="Phone" />
                                    </div>
                                </div>

                                <div class="col-md-5">
                                    <label>Email</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control readOnly" ID="txtUserEmail" runat="server" placeholder="Email" ReadOnly="true" TextMode="Email" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <label>State</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control readOnly" ID="txtUserState" runat="server" placeholder="State" ReadOnly="true" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>City</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control readOnly" ID="txtUserCity" runat="server" placeholder="City" ReadOnly="true" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Pin Code</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control readOnly" ID="txtUserPincode" runat="server" placeholder="Pin Code" TextMode="Number" ReadOnly="true" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <label>Full Postal Adress</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control readOnly" ID="txtUserFullAdress" runat="server" placeholder="Full Postal Adress" ReadOnly="true" TextMode="MultiLine" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    <center>
                                        <div class="form-group">
                                            <asp:Button class="btn btn-danger btn-lg" ID="btnDeleteUser" runat="server" Text="Delete User Permanently" Style="width: 100%" OnClick="btnDeleteUser_Click" />
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
                                    <div style="overflow-y: auto; max-height: 60vh;">
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elbraryDBConnectionString %>" SelectCommand="SELECT * FROM [member_master_tbl]"></asp:SqlDataSource>
                                        <asp:GridView class="table table-striped table-bordered table-dark" ID="grdUserList" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                                            <Columns>
                                                <asp:BoundField DataField="member_id" HeaderText="Member ID" ReadOnly="True" SortExpression="member_id" />
                                                <asp:BoundField DataField="full_name" HeaderText="Full Name" SortExpression="full_name" />
                                                <asp:BoundField DataField="account_status" HeaderText="Account Status" SortExpression="account_status" />
                                                <asp:BoundField DataField="contact_no" HeaderText="Contact Number" SortExpression="contact_no" />
                                                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                                <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                                <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
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
