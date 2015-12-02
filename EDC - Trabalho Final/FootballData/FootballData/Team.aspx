﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Team.aspx.cs" Inherits="FootballData.Team" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h2><%# team.name %></h2>
        <div class="row">    
            <div class="col-md-4">
                <div class="card">
                    <div class="card-image" style="text-align: center">
                        <img class="img-responsive" style="max-height: 350px; max-width: 300px" src="<%# team.crestUrl %>">
                    
                    </div><!-- card image -->
                
                    <div class="card-content">
                        <span class="card-title">Squad value: <%# team.squadMarketValue %></span>   
                    </div>
                    <!-- card content -->
                    <div class="card-action">
                        <a href="#" data-toggle="modal" data-target="#fixturesModal" target="new_blank">Fixtures</a>
                        <a href="#" data-toggle="modal" data-target="#squadModal" target="new_blank">Squad</a>
                    </div><!-- card actions -->
                </div>
            </div>
            <div class="col-md-6">
                <h3>News</h3>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade scroll-modal" id="fixturesModal" tabindex="-1" role="dialog" aria-labelledby="fixturesLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="fixturesLabel">Fixtures</h4>
          </div>
          <div class="modal-body">
            <table class="table table-condensed">
                <thead>
                    <tr>
                        <td><strong>Date</strong></td>
                        <td><strong>Home</strong></td>
                        <td><strong>Away</strong></td>
                        <td><strong>Result</strong></td>
                    </tr>
                </thead>
                <tbody>
                    <%# fixturesTable_html %>
                </tbody>
            </table>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
    <!-- Modal -->
    <div class="modal fade scroll-modal" id="squadModal" tabindex="-1" role="dialog" aria-labelledby="squadLabel">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="squadLabel">Squad</h4>
          </div>
          <div class="modal-body">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <td><strong>Name</strong></td>
                        <td><strong>Jersey Number</strong></td>
                        <td><strong>Position</strong></td>
                        <td><strong>Nationality</strong></td>
                        <td><strong>Date Of Birth</strong></td>
                        <td><strong>Market Value</strong></td>
                        <td><strong>Contract Until</strong></td>
                    </tr>
                </thead>
                <tbody>
                    <%# players_list_html %>
                </tbody>
            </table>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
</asp:Content>
