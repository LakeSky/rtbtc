<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="VoucherPrint.aspx.cs" Inherits="Bookings_VoucherPrint" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="button"  OnClick="btnPrint_Click" /><br />
    <asp:Panel ID="pnl1" runat="server">
                <table  width="100%" align="center">
                    <tr>
                        <td align="left">
                           <table>
                            <tr>
                                <td> 
                                    <asp:Image ID="imgLogo" ImageUrl="../Images/all3.png" runat="server" 
                                   Height="49px" Width="340px" />
                                </td>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label4" runat="server" Text="Voucher No : " Width="90px"></asp:Label>
                                                <asp:Label ID="lblBkgId" runat="server" ></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="Label5" runat="server" Text="Book Date : " Width="80px"></asp:Label>
                                                <asp:Label ID="lblBkgDate" runat="server" ></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                        <td> <asp:Label ID="Label10" runat="server" Text="Ref. No. :" Width="80px"></asp:Label><asp:Label ID="lblSupRefNo" runat="server" Text=""></asp:Label></td>
                                        <td> <asp:Label ID="Label11" runat="server" Text="Con. No. :" Width="80px"></asp:Label><asp:Label ID="lblSupConNo" runat="server" Text=""></asp:Label></td>
                                           
                                        </tr>
                                    </table>
                                </td>
                                </tr>
                                </table> 
                        </td>
                        
                    </tr>
                   <tr><td><hr /></td></tr>
                    <tr>
                    
                        <td align="left">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text="Guest Details" Width="130px"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:Label ID="Label2" runat="server" Text="Adult : " Width="70px"></asp:Label><asp:Label ID="lblNoOfAdults" runat="server" Text="" Width="70px"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:Label ID="Label7" runat="server" Text="Child : " Width="70px"></asp:Label></asp:Label><asp:Label ID="lblNoOfChild" runat="server" Text="" Width="70px"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:Label ID="Label8" runat="server" Text="Infand : " Width="70px"></asp:Label></asp:Label><asp:Label ID="lblNoOfInfant" runat="server" Text="" Width="70px"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                         </td>

                    </tr>
                     <tr><td><hr /></td></tr>
                    <tr>
                        <td>
                           <asp:Repeater ID="repGuests" runat="server">
                           <HeaderTemplate><table width="100%"></HeaderTemplate>
                           <ItemTemplate>
                           <tr>
                           <td width="50px">
                           <%# Eval("title") %>
                           </td>
                            <td width="250px">
                           <%# Eval("PaxName")%>
                           </td>
                            <td  align="left">
                           <%# (Eval("Age").ToString() == "0") ? "" : " Age : " + Eval("Age").ToString() %>
                           </td>
                           </tr>
                           </ItemTemplate>
                           <FooterTemplate></table></FooterTemplate>
                           
                           </asp:Repeater>
                        </td>
                    </tr>
                     <tr><td ><hr /></td></tr>
                   <tr><td align="left">
                   <table><tr><td> <asp:Label ID="lblServiceName" runat="server" Text="" Width="60px"></asp:Label></td>
                   <td> <asp:Label ID="lblProductName" runat="server" Text="" Width="250px"></asp:Label></td>
                     <td> <asp:Label ID="Label3" runat="server" Text="Check IN :" Width="70px"></asp:Label></td>
                       <td> <asp:Label ID="lblCheckIN" runat="server" Width="84px"></asp:Label></td>
                         <td> <asp:Label ID="Label6" runat="server" Text="OUT :" Width="45px"></asp:Label></td>
                       <td> <asp:Label ID="lblCheckOUT" runat="server" Width="100px"></asp:Label></td>
                         <td> <asp:Label ID="Label9" runat="server" Text=" Nights :" Width="50px"></asp:Label></td>
                       <td> <asp:Label ID="lblTotalNights" runat="server" Width="50px"></asp:Label></td>
                  
                   </tr></table>
                   
                   </td>
                   </tr>
                    <tr><td ><hr /></td></tr>
                    <tr>
                        <td align="left">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label12" runat="server" Text="Address :" Width="100px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblHotelAddress" runat="server" Text="" Width="300px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label14" runat="server" Text="City :" Width="70px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblCity" runat="server" Width="100px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label16" runat="server" Text="Tel. :" Width="45px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblTel" runat="server" Width="100px"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            </td>
                    </tr>
                    <tr><td ><hr /></td></tr>
                    <tr>
                        <td align="left">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label13" runat="server" Text="RoomType :" Width="100px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblRoomType" runat="server" Text="" ></asp:Label><asp:Label ID="Label15" runat="server" Text="  -  " ></asp:Label>
                                    </td>
                                    
                                    <td>
                                        <asp:Label ID="lblRoomName" runat="server" ></asp:Label><asp:Label ID="Label17" runat="server" Text="  -  " ></asp:Label>
                                    </td>
                                    &nbsp;&nbsp;-&nbsp;&nbsp;
                                    <td>
                                        <asp:Label ID="lblBBName" runat="server" ></asp:Label>
                                    </td>
                                </tr>
                            </table>
                    </tr>
                     <tr><td ><hr /></td></tr>
                    <tr><td align="left">  <asp:Label ID="lblCustomerRemarks" runat="server" ></asp:Label></td> </tr>
                     <tr><td align="left">  <asp:Label ID="lblSupplierRemarks" runat="server" ></asp:Label></td> </tr>
                     <tr><td ><hr /></td></tr>
                     <tr><td align="left">  <p>This Voucher covers rooms accomodation charges only unless otherwise specified.<br />
                     All incidental charges must be paid by the guest upon check out. <br /> Void if mutilated or altered. Issuing office is
                     not responsible for any alteration made. </p></td> </tr>
                     <tr><td ><hr /></td></tr>
                      <tr><td align="left">  <p style="font-size:x-small"> P O. Box : 3599, Riyadh 11481. Tel No.: +966 11 292 7777 Ext. 520 Fax No.: +966 11 477 9899 Email : sales@alriyadhtravel.com </p></td> </tr>
                </table>
            </asp:Panel>
</asp:Content>

