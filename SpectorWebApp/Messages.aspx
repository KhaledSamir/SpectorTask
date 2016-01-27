<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Messages.aspx.cs" Inherits="SpectorWebApp.Messages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/Site.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/modernizr-2.6.2.js"></script>
    <script type="text/javascript" src="Scripts/SpectorLogic.js"></script>
    <title>Spector Testing Task !</title>
</head>
<body>
    <div id="wrapper">

        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <span class="navbar-brand">Spector Messages Portal </span>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                    </ul>
                </div>
            </div>
        </div>

        <div class="container body-content">
            <form id="form1" runat="server">
                <p>
                    <input type="button" class="btn" onclick="displayCreateP()" value="Add new message" />
                </p>
                <p id="CreateP" style="display: none;">
                    Message :
                <input type="text" id="MsgText" />
                    <input type="button" value="Add" class="btn" onclick='Methods.addNewMessage();' />
                    <span class="alert-warning" style="color: red; display: none;" id="InvSpan">Please add value!</span>
                </p>
                <asp:GridView ID="MsgsGrid" ClientIDMode="Static" runat="server" DataMember="ID" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="404px" Style="text-align: left">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <asp:Label ID="lblID" runat='server' ClientIDMode="Static" Text='<%# Bind("ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Message" HeaderText="Message" />
                        <asp:TemplateField HeaderText="Removing">
                            <ItemTemplate>
                                <a href="#" onclick="Methods.showModel(this);" id="rmvBtn">Remove</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </form>
        </div>
    </div>

    <div id="myModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Warning!!</h4>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete this message?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                    <button type="button" onclick="Methods.deleteMessage();" class="btn btn-primary">Yes</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</body>
</html>
