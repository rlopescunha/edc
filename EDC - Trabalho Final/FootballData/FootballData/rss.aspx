﻿<%@ Page Language="C#" ContentType="text/xml" AutoEventWireup="true" CodeBehind="rss.aspx.cs" Inherits="FootballData.rss" %>
<asp:Repeater ID="RepeaterRSS" runat="server">
    <HeaderTemplate>
        <rss version="2.0">
            <channel>
                <title><%# RemoveIllegalCharacters(rssChannel.title) %></title>
                <link><%# RemoveIllegalCharacters(rssChannel.link) %></link>
                <language><%# RemoveIllegalCharacters(rssChannel.language) %></language>
    </HeaderTemplate>
    <ItemTemplate>
        <% if(rssChannel.format=="full") { %>
            <item>
                <title><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "title")) %></title>
                <link><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "link")) %></link>
                <pubDate><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "pubDate")) %></pubDate>
                <description><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "description")) %></description>
                <team><%# RemoveIllegalCharacters((object)teamsNames[(int)DataBinder.Eval(Container.DataItem, "team_id")]) %></team>
                <asp:Repeater ID="related" datasource='<%# ((TeamNew)Container.DataItem).related %>' runat="server">
                <ItemTemplate>
                <related>
                    <title><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "title")) %></title>
                    <link><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "link")) %></link>
                </related>
                </ItemTemplate>
                </asp:Repeater>
            </item>
        <% }else { %>
            <item>
                <title><%#  RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "title")) %></title>
                <link><%#  RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "link")) %></link>
                <team><%# RemoveIllegalCharacters((object)teamsNames[(int)DataBinder.Eval(Container.DataItem, "team_id")]) %></team>
            </item>
            <asp:Repeater ID="Repeater1" datasource='<%# ((TeamNew)Container.DataItem).related %>' runat="server">
            <ItemTemplate>
            <item>
                <title><%#  RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "title")) %></title>
                <link><%#  RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "link")) %></link>
                <team><%# RemoveIllegalCharacters((object)teamsNames[(int)DataBinder.Eval(Container.DataItem, "team_id")]) %></team>
            </item>
            </ItemTemplate>
            </asp:Repeater>
        <% } %>
    </ItemTemplate>
    <FooterTemplate>
            </channel>
        </rss>
    </FooterTemplate>
</asp:Repeater>