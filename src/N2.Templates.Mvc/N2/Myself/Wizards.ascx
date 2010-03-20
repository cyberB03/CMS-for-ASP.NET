﻿<%@ Import Namespace="N2.Edit.Wizard.Items" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Wizards.ascx.cs" Inherits="Management.N2.Myself.Wizards" %>

<div class="box">
	<h4 class="header"><%= CurrentItem.Title %></h4>

	<n2:Repeater ID="rptLocations" runat="server">
		<HeaderTemplate><table><thead><tr><th>Wizard</th><th>Description</th><th>Location</th></tr></thead><tbody></HeaderTemplate>
		<ItemTemplate>
			<tr><td>
				<asp:HyperLink ID="hlNew" NavigateUrl='<%# GetEditUrl((MagicLocation)Container.DataItem) %>' ToolTip='<%# Eval("ToolTip") %>' runat="server">
					<asp:Image ID="imgIco" ImageUrl='<%# Eval("IconUrl") %>' CssClass="icon" runat="server" meta:resourcekey="imgIcoResource1" />
					<%# Eval("Title") %>
				</asp:HyperLink>
			</td><td>
				<%# Eval("Description") %>
			</td><td>
				<a href="<%# Eval("Location.Url") %>">
					<asp:Image runat=server ImageUrl='<%# Eval("Location.IconUrl") %>' />
					<%# Eval("Location.Title") %>
				</a>
			</td></tr>
		</ItemTemplate>
		<EmptyTemplate>
			<asp:Label runat="server" ID="lblNoItems" meta:resourcekey="lblNoItems" Text="No locations added." />
		</EmptyTemplate>
		<FooterTemplate></tbody></table></FooterTemplate>
	</n2:Repeater>

</div>