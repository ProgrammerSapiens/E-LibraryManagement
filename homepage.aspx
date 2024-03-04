<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="E_LibraryManagement.homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        <img src="Source/imgs/home-bg.jpg" class="img-fluid" />
    </section>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                        <h2>Our Features</h2>
                        <p><b>Our 3 Primary Features</b></p>
                    </center>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <center>
                        <img src="Source/imgs/digital-inventory.png" width="150" />
                        <h4>Digital Book Inventory</h4>
                        <p class="text-justify">
                            Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariater. Lorem ipsum dolor.
                        </p>
                    </center>
                </div>

                <div class="col-md-4">
                    <center>
                        <img src="Source/imgs/search-online.png" width="150" />
                        <h4>Search Books</h4>
                        <p class="text-justify">
                            Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariater. Lorem ipsum dolor.
                        </p>
                    </center>
                </div>

                <div class="col-md-4">
                    <center>
                        <img src="Source/imgs/defaulters-list.png" width="150" />
                        <h4>Defaulter List</h4>
                        <p class="text-justify">
                            Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariater. Lorem ipsum dolor.
                        </p>
                    </center>
                </div>
            </div>
        </div>
    </section>

    <section>
        <img src="Source/imgs/in-homepage-banner.jpg" class="img-fluid" />
    </section>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <h2>Our Process</h2>
                    <p><b>We have a Simple 3 Step Process</b></p>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 text-center">
                    <img src="Source/imgs/sign-up.png" width="150" />
                    <h4>Sign Up</h4>
                    <p class="text-justify">
                        Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariater. Lorem ipsum dolor.
                    </p>
                </div>

                <div class="col-md-4 text-center">
                    <img src="Source/imgs/search-online.png" width="150" />
                    <h4>Search Books</h4>
                    <p class="text-justify">
                        Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariater. Lorem ipsum dolor.
                    </p>
                </div>

                <div class="col-md-4 text-center">
                    <img src="Source/imgs/library.png" width="150" />
                    <h4>Visit Us</h4>
                    <p class="text-justify">
                        Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariater. Lorem ipsum dolor.
                    </p>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
