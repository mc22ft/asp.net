<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Kassakvitto.WebForm1" ViewStateMode="Disabled" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>KassaKvitto</title>
    <link href="~/Content/Style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form" runat="server">
        <h1>KassaKvitto</h1>
    <div>
        <asp:Label ID="Label1" runat="server" AssociatedControlID="Total" Text="Total köpesumma:"></asp:Label>
    </div>
        <div>
            <asp:TextBox ID="Total" runat="server"></asp:TextBox>
            <%-- Valdiation --%>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToValidate="Total"
                ErrorMessage="Du måste ange ett ett giltigt tal (flyttal)." 
                Type="Double" Display="Dynamic" 
                Operator="GreaterThan" 
                SetFocusOnError="True" ValueToCompare="0"></asp:CompareValidator>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="Total"
                ErrorMessage="Du måste ange en summa." SetFocusOnError="True" Display="Dynamic">
            </asp:RequiredFieldValidator>            
           
        </div>
        <div>
            <asp:Button ID="sendButton" runat="server" Text="Beräkna Rabatt" OnClick="sendButton_Click" />
        </div>
        <div>
            <%-- Presentation --%>
            <asp:PlaceHolder ID="OutPutPlaceHolder" runat="server" Visible="False">

                <asp:Literal ID="test" runat="server" ></asp:Literal>

                <h2>My Store AB</h2>
                <p>vi jobbar för dig...</p>
                <p>Tel: 0736-90 03 08</p>
                <p>Öppet tider 9-15</p>
                <p>Öppetköp i 30 dagar</p>
                

                <%-- Här skulle det vara label kontroller --%>
                <asp:Label ID="Label2" runat="server" Text="Total: "></asp:Label>
                <asp:Label ID="subtotal" runat="server" >{0:c}</asp:Label>
                <br />
                <asp:Label ID="Label5" runat="server" Text="Rabattsats: "></asp:Label>
                <asp:Label ID="discountrate" runat="server" >{0}%</asp:Label>
                <br />      
                <asp:Label ID="Label3" runat="server" Text="Rabatt: "></asp:Label>
                <asp:Label ID="moneyoff" runat="server" >{0:c}</asp:Label>                
                <br />
                <asp:Label ID="Label6" runat="server" Text="Att betala: "></asp:Label>
                <asp:Label ID="totalamount" runat="server" >{0:c}</asp:Label>

                <p>Org Nr: 34211-3452</p>
                <p>Välkommen Åter</p>
            </asp:PlaceHolder>
        </div>

        <div>
            <asp:PlaceHolder ID="ErrorHolder" runat="server" Visible="False">
                <asp:Literal ID="ErrorMessageServer" runat="server">{0}</asp:Literal>
            </asp:PlaceHolder>

        </div>
    </form>
    <script type="text/javascript" src="js/Script.js"></script>
</body>
</html>
