<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KonventeraTemperaturer.Default" ViewStateMode="Disabled" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Konventera Temperaturer</title>
    <link href="~/Content/Style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <h1>Konventera Temperaturer</h1>
        <%-- FelMeddelande --%>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="Fel inträfade. Åtgärda felen och försök igen." />

        <%-- Starttemperatur --%>
    <div>
        <asp:Label ID="StartTemp" runat="server" Text="Starttemperatur:" AssociatedControlID="Start"></asp:Label>
    </div>
        <div>
            <asp:TextBox ID="Start" runat="server"></asp:TextBox>
        
            <%-- Valedering --%>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="Start"
            Text="*" 
            ErrorMessage="Du måste ange en starttemperatur." 
            SetFocusOnError="True" 
            ForeColor="Red" 
            Display="Dynamic">
        </asp:RequiredFieldValidator>        

        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToValidate="Start"
            Text="*" ErrorMessage="Starttemperaturen måste anges i ett heltal."              
            SetFocusOnError="True" 
            Operator="DataTypeCheck" 
            Type="Integer" ForeColor="Red"></asp:CompareValidator>    
        </div>

        <%-- Sluttemperatur --%>
    <div>
        <asp:Label ID="SlutTemp" runat="server" Text="Sluttemperatur:" AssociatedControlID="Slut"></asp:Label>
    </div>
        <div>
            <asp:TextBox ID="Slut" runat="server"></asp:TextBox>
        
            <%-- Valedering --%>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="Slut"           
            Text="*" ErrorMessage="Du måste ange en sluttemperatur." 
            SetFocusOnError="True" ForeColor="Red" Display="Dynamic">
        </asp:RequiredFieldValidator>

            <asp:CompareValidator ID="CompareValidator4" runat="server" 
            ControlToValidate="Slut"
            Text="*" ErrorMessage="Sluttemperaturen måste anges i ett heltal."              
            SetFocusOnError="True" 
            Operator="DataTypeCheck" 
            Type="Integer" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>

        <asp:CompareValidator ID="CompareValidator2" runat="server" 
            ControlToValidate="Slut"
            ControlToCompare="Start" 
            Text="*" ErrorMessage="Sluttemperaturen får inte vara lägre än starttemperaturen." 
            Operator="GreaterThanEqual" Type="Integer" 
            SetFocusOnError="True" ForeColor="Red">
        </asp:CompareValidator>
        </div>

        <%-- Temperatursteg --%>
    <div>
        <asp:Label ID="StegTemp" runat="server" Text="Temperatursteg:" AssociatedControlID="Steg"></asp:Label>
    </div>
        <div>
            <asp:TextBox ID="Steg" runat="server"></asp:TextBox>
        
            <%-- Valedering --%>

        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="Steg"
            Text="*" ErrorMessage="Du måste ange ett temperatursteg." 
            SetFocusOnError="True" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

            <asp:CompareValidator ID="CompareValidator3" runat="server" 
            ControlToValidate="Steg"
            Text="*" ErrorMessage="Stegtemperaturen måste anges i ett heltal."              
            SetFocusOnError="True" 
            Operator="DataTypeCheck" 
            Type="Integer" ForeColor="Red" Display="Dynamic"></asp:CompareValidator> 

        <asp:RangeValidator ID="RangeValidator1" runat="server" 
            ControlToValidate="Steg"
            Text="*" ErrorMessage="Du måste välja ett intervall mellan 1 - 100."              
            SetFocusOnError="True" Type="Integer" 
            MaximumValue="100" MinimumValue="1" Display="Dynamic" ForeColor="Red"></asp:RangeValidator>

        </div>

        <%-- RadioButton (RadioButton1 är satt till default) --%>
        <div>
            <asp:Label ID="RadioButton" runat="server" Text="Typ av konvertering"></asp:Label>
        </div>
        <div>
            <asp:RadioButton ID="RadioButton1" runat="server" Text="Celsius till Fahrenheit" GroupName="Radio" Checked="True" />           
        </div>
        <div>
            <asp:RadioButton ID="RadioButton2" runat="server" Text="Fahrenheit till Celsius" GroupName="Radio"/>
        </div>
        <div>
            <asp:Button ID="MyButton" runat="server" Text="Konvertera" OnClick="MyButton_Click" />
        </div>
        
        <div>
            <%-- Presentation --%>

            <asp:Table ID="MyTable" runat="server" Visible="False"></asp:Table>           
            
        </div>
    </form>
</body>
</html>
